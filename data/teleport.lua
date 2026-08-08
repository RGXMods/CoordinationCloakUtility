-- CCU | Teleport Logic
local CCU = _G.CCU
local RGX = _G.RGXFramework

-- Initialize cloaks
function CCU:InitializeCloaks()
	self.cloaksInitialized = false
	local pendingItems = #self.cloaks
	if pendingItems == 0 then
		self.cloaksInitialized = true
		self:UpdateUsableCloaks()
		return
	end

	for _, cloakID in ipairs(self.cloaks) do
		local item = Item:CreateFromItemID(cloakID)
		item:ContinueOnItemLoad(function()
			pendingItems = pendingItems - 1
			local itemLink = select(2, GetItemInfo(cloakID))
			if GetItemCount(cloakID) > 0 and itemLink then
				self.usableCloaks[cloakID] = itemLink
			end
			if pendingItems == 0 then
				self.cloaksInitialized = true
				self:UpdateUsableCloaks()
				if self.waitingForItemInfo and self.pendingAction then
					self.waitingForItemInfo = false
					self.pendingAction()
					self.pendingAction = nil
				end
			end
		end)
	end
end

-- Update usable cloaks from inventory
function CCU:UpdateUsableCloaks()
	local oldUsable = self.usableCloaks
	self.usableCloaks = {}
	local pendingItems = 0

	for _, cloakID in ipairs(self.cloaks) do
		if GetItemCount(cloakID) > 0 then
			local itemLink = select(2, GetItemInfo(cloakID))
			if itemLink then
				self.usableCloaks[cloakID] = itemLink
			else
				pendingItems = pendingItems + 1
				local item = Item:CreateFromItemID(cloakID)
				item:ContinueOnItemLoad(function()
					RGX:After(0.1, function()
						self.usableCloaks[cloakID] = select(2, GetItemInfo(cloakID))
						pendingItems = pendingItems - 1
						if pendingItems == 0 and self.waitingForItemInfo and self.pendingAction then
							self.waitingForItemInfo = false
							self.pendingAction()
							self.pendingAction = nil
						end
					end)
				end)
			end
		else
			self.usableCloaks[cloakID] = nil
		end
	end

	if pendingItems == 0 and self.waitingForItemInfo and self.pendingAction then
		self.waitingForItemInfo = false
		self.pendingAction()
		self.pendingAction = nil
	end

	self:RefreshMinimapButton()
end

-- Handle back slot (cloak) changes
function CCU:HandleBackSlotItem()
	if self.inCombat then return end

	if not self.cloaksInitialized then
		self.waitingForItemInfo = true
		self.pendingAction = function() self:HandleBackSlotItem() end
		return
	end

	local backSlotID = GetInventorySlotInfo("BackSlot")
	local equippedCloakID = GetInventoryItemID("player", backSlotID)
	self.currentCloakID = equippedCloakID
	self.forceDefaultMinimapIcon = false

	if self.currentCloakID and not self.usableCloaks[self.currentCloakID] then
		self.lastNonTeleportationCloakID = self.currentCloakID
		self.db.lastEquippedCloak = self.currentCloakID
	elseif not self.currentCloakID then
		self.lastNonTeleportationCloakID = nil
	end

	if equippedCloakID and self.usableCloaks[equippedCloakID] then
		if not self.teleportInProgress then
			self.originalCloak = self.lastNonTeleportationCloakID or nil
			if self.originalCloak and self.originalCloak ~= equippedCloakID then
				local originalCloakLink = select(2, GetItemInfo(self.originalCloak))
			else
				self:Print(self.L.ORIGINAL_CLOAK_SAVED .. "No cloak equipped.")
			end
		end

		local start, duration = GetItemCooldown(equippedCloakID)
		local remaining = math.ceil(start + duration - GetTime())
		local itemLink = self.usableCloaks[equippedCloakID]

		if duration == 0 then
			if self.suppressNextEquipMessage then
				self.suppressNextEquipMessage = false
			else
				self:Print(self.CCU_PREFIX .. itemLink .. self.L.CLOAK_EQUIPPED)
			end
			if not InCombatLockdown() then
				if self.suppressNextPopupButton then
					self.suppressNextPopupButton = false
					if self.secureButton and self.secureButton:IsShown() then
						self.secureButton:Hide()
					end
				else
					self:ConfigureSecureButtonForBackSlot(equippedCloakID)
					self.secureButton:Show()
				end
			end
		else
			local remainingTime = self:FormatTime(remaining)
			self:Print(self.CCU_PREFIX .. string.format(self.L.CLOAK_ON_CD, itemLink, remainingTime))
			if not InCombatLockdown() then
				self.secureButton:Hide()
			end
		end
		return
	else
		self.originalCloak = nil
		if not InCombatLockdown() and self.secureButton and self.secureButton:IsShown() then
			self.secureButton:Hide()
		end
	end

	self:RefreshMinimapButton()
end

-- Reset cloak process
function CCU:ResetCloakProcess()
	self.teleportInProgress = false
	self.originalCloak = nil
	self.reEquipAttempted = false
	self.reEquipStartTime = nil
	self.waitingToReequip = false
	self.inLoadingScreen = false
	self.reEquipRetryCount = 0
	self.forceDefaultMinimapIcon = true
	if self.reEquipTimer then
		self.reEquipTimer:Cancel()
		self.reEquipTimer = nil
	end
	if not InCombatLockdown() and self.secureButton and self.secureButton:IsShown() then
		self.secureButton:Hide()
	end
	self:RefreshMinimapButton()
	self:Print(self.L.PROCESS_RESET)
	self:HandleBackSlotItem()
end

-- Start re-equip check
function CCU:StartReEquipCheck()
	if self.reEquipTimer then
		self.reEquipTimer:Cancel()
	end

	self.lastZone = GetZoneText()
	self.lastSubZone = GetSubZoneText()
	self.reEquipStartTime = GetTime()

	self.reEquipTimer = RGX:Every(1, function()
		self:CheckTeleportAndReequip()
	end)
end

-- Check teleport and re-equip
function CCU:CheckTeleportAndReequip()
	if self.inLoadingScreen then return end

	local elapsed = GetTime() - (self.reEquipStartTime or 0)
	if elapsed > self.reEquipTimeout then
		if self.reEquipTimer then self.reEquipTimer:Cancel(); self.reEquipTimer = nil end
		self:Print(self.L.REEQUIP_FAILED)
		self:ResetCloakProcess()
		return
	end

	local zoneChanged = self.lastZone ~= GetZoneText() or self.lastSubZone ~= GetSubZoneText()
	local backSlotID = GetInventorySlotInfo("BackSlot")
	local equippedCloakID = GetInventoryItemID("player", backSlotID)

	if zoneChanged then
		if self.reEquipTimer then self.reEquipTimer:Cancel(); self.reEquipTimer = nil end
		self.reEquipRetryCount = 0
		self:AttemptReequip()
	elseif equippedCloakID == self.originalCloak then
		if self.reEquipTimer then self.reEquipTimer:Cancel(); self.reEquipTimer = nil end
		self:ResetCloakProcess()
	end
end

-- Attempt re-equip with retries
function CCU:AttemptReequip()
	if not self.teleportInProgress then return end
	if self.inCombat then self:NotifyCombatLockdown(); return end
	if not self.originalCloak then self:ResetCloakProcess(); return end

	local backSlotID = GetInventorySlotInfo("BackSlot")
	local equippedCloakID = GetInventoryItemID("player", backSlotID)
	if equippedCloakID == self.originalCloak then
		self:Print(self.colors.success .. "Original cloak is already equipped.|r")
		self:ResetCloakProcess()
		return
	end

	local itemLink = select(2, GetItemInfo(self.originalCloak))
	if not itemLink then
		self.reEquipRetryCount = self.reEquipRetryCount + 1
		if self.reEquipRetryCount <= self.reEquipRetryMax then
			RGX:After(self.reEquipRetryDelay, function() self:AttemptReequip() end)
		else
			self:Print(self.L.REEQUIP_FAILED)
			self:ResetCloakProcess()
		end
		return
	end

	if not self.reEquipAttempted then
		self:Print(self.L.REEQUIP_CLOAK .. itemLink)
		self.reEquipAttempted = true
	end

	EquipItemByName(self.originalCloak)

	self.reEquipRetryCount = self.reEquipRetryCount + 1
	if self.reEquipRetryCount <= self.reEquipRetryMax then
		RGX:After(self.reEquipRetryDelay, function() self:AttemptReequip() end)
	else
		RGX:After(self.reEquipRetryDelay, function()
			if self.teleportInProgress then
				self:Print(self.L.REEQUIP_FAILED)
				self:ResetCloakProcess()
			end
		end)
	end
end

-- Get best usable cloak
function CCU:GetBestUsableCloakID(silent)
	local firstOwnedCloakID = nil
	local firstOwnedLink = nil

	for cloakID, itemLink in pairs(self.usableCloaks) do
		if not firstOwnedCloakID then
			firstOwnedCloakID = cloakID
			firstOwnedLink = itemLink
		end

		if not GetItemInfo(cloakID) then
			self.waitingForItemInfo = true
			self.pendingAction = function() self:RefreshMinimapButton() end
			return nil, nil, firstOwnedCloakID, firstOwnedLink
		end

		local start, duration = GetItemCooldown(cloakID)
		local remaining = math.ceil(start + duration - GetTime())
		if duration == 0 then
			return cloakID, itemLink, firstOwnedCloakID, firstOwnedLink
		elseif not silent then
			local remainingTime = self:FormatTime(remaining)
			self:Print(self.CCU_PREFIX .. string.format(self.L.CLOAK_ON_CD, itemLink, remainingTime))
		end
	end

	return nil, nil, firstOwnedCloakID, firstOwnedLink
end

-- Get available cloak
function CCU:GetAvailableCloakID()
	if self.inCombat then
		self:NotifyCombatLockdown()
		return nil, nil
	end

	local cloakID, itemLink = self:GetBestUsableCloakID(false)
	return cloakID, itemLink
end

-- Equip and use cloak
function CCU:EquipAndUseCloak(cloakID, cloakLink, source)
	if self.inCombat then
		self:NotifyCombatLockdown()
		return
	end

	local start, duration = GetItemCooldown(cloakID)
	local remaining = math.ceil(start + duration - GetTime())
	if duration > 0 then
		local remainingTime = self:FormatTime(remaining)
		self:Print(self.CCU_PREFIX .. string.format(self.L.CLOAK_ON_CD, cloakLink, remainingTime))
		return
	end

	self:Print(self.CCU_PREFIX .. cloakLink .. self.L.PROCESS_STARTED)

	local backSlotID = GetInventorySlotInfo("BackSlot")
	local equippedCloakID = GetInventoryItemID("player", backSlotID)

	self.originalCloak = self.lastNonTeleportationCloakID or self.db.lastEquippedCloak or nil
	if self.originalCloak == cloakID then
		self.originalCloak = nil
	end
	local originalCloakLink = self.originalCloak and select(2, GetItemInfo(self.originalCloak))
	self.db.lastEquippedCloak = self.originalCloak
	if originalCloakLink then
		self:Print(self.CCU_PREFIX .. self.L.ORIGINAL_CLOAK_SAVED .. originalCloakLink)
	else
		self:Print(self.CCU_PREFIX .. self.L.ORIGINAL_CLOAK_SAVED .. "No cloak equipped.")
	end

	if source == "minimap" then
		if equippedCloakID == cloakID then
			self:Print(self.CCU_PREFIX .. self.L.CLOAK_ALREADY_EQUIPPED)
		else
			self.suppressNextEquipMessage = true
			self.suppressNextPopupButton = true
			EquipItemByName(cloakID)
			self:Print(self.CCU_PREFIX .. cloakLink .. self.L.CLOAK_EQUIPPED)
		end
		if not InCombatLockdown() and self.secureButton and self.secureButton:IsShown() then
			self.secureButton:Hide()
		end
		RGX:After(0.1, function() self:RefreshMinimapButton() end)
		return
	end

	local usedDirectly = false
	if not InCombatLockdown() then
		if equippedCloakID == cloakID then
			self:Print(self.CCU_PREFIX .. self.L.CLOAK_ALREADY_EQUIPPED)
			usedDirectly = self:TryExecuteTeleportMacro(cloakID)
		else
			usedDirectly = self:TryExecuteTeleportMacro(cloakID)
			if not usedDirectly then
				self.suppressNextEquipMessage = true
				EquipItemByName(cloakID)
			end
		end

		if usedDirectly then
			self.teleportInProgress = true
			self:Print(self.CCU_PREFIX .. self.L.TELEPORTATION_IN_PROGRESS)
		else
			self:ConfigureSecureButtonForBackSlot(cloakID)
			self.secureButton:Show()
		end
	end
end

-- Handle cloak use from slash/minimap
function CCU:HandleCloakUse(source)
	if self.inCombat then
		self:NotifyCombatLockdown()
		return
	end

	if not self.cloaksInitialized then
		self.waitingForItemInfo = true
		self.pendingAction = function() self:HandleCloakUse(source) end
		return
	end

	local hasUsableCloak = false
	for _, _ in pairs(self.usableCloaks) do
		hasUsableCloak = true
		break
	end

	if not hasUsableCloak then
		self:Print(self.L.NO_USABLE_CLOAK)
		return
	end

	local cloakID, cloakLink = self:GetAvailableCloakID()
	if cloakID then
		self:EquipAndUseCloak(cloakID, cloakLink, source)
	end
end

-- Get available cloak
function CCU:GetAvailableCloakID()
	if self.inCombat then
		self:NotifyCombatLockdown()
		return nil, nil
	end

	return self:GetBestUsableCloakID(false)
end