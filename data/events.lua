-- CCU | Events
local CCU = _G.CCU
local RGX = _G.RGXFramework

function CCU:RegisterEvents()
	local RGX = _G.RGXFramework

	RGX:RegisterEvent("ADDON_LOADED", function(addonName)
		if addonName == self.name then
			self:CreateSecureButton()
			self:CreateMinimapButton()
			self.version = C_AddOns.GetAddOnMetadata(self.name, "Version")
		end
	end)

	RGX:RegisterEvent("PLAYER_LOGIN", function()
		-- DB already initialized via RGX:NewDatabase
		if not self.db.minimapIconEnabled then
			if self.minimapButton then self.minimapButton:Hide() end
		else
			self:UpdateMinimapButtonPosition()
			self:RefreshMinimapButton()
		end

		if self.db.showWelcomeMessage then
			self:PrintWelcome()
		end

		RGX:After(1, function() self:HandleBackSlotItem() end)
	end)

	RGX:RegisterEvent("LOADING_SCREEN_ENABLED", function()
		if self.teleportInProgress then
			self.inLoadingScreen = true
			self.waitingToReequip = true
			if self.reEquipTimer then self.reEquipTimer:Cancel(); self.reEquipTimer = nil end
		end
	end)

	RGX:RegisterEvent("PLAYER_ENTERING_WORLD", function()
		self.inLoadingScreen = false
		self:InitializeCloaks()
		self:UpdateMinimapButtonPosition()
		self:RefreshMinimapButton()

		if self.teleportInProgress then
			if self.reEquipTimer then self.reEquipTimer:Cancel(); self.reEquipTimer = nil end
			self.waitingToReequip = false
			self.reEquipRetryCount = 0
			self.reEquipStartTime = GetTime()
			RGX:After(1, function() self:AttemptReequip() end)
		end
	end)

	RGX:RegisterEvent("PLAYER_EQUIPMENT_CHANGED", function(slotID)
		if slotID == GetInventorySlotInfo("BackSlot") then
			if self.reEquipAttempted and self.originalCloak then
				local equippedCloakID = GetInventoryItemID("player", slotID)
				if equippedCloakID == self.originalCloak then
					if self.reEquipTimer then
						self.reEquipTimer:Cancel()
						self.reEquipTimer = nil
					end
					self:Print(self.L.REEQUIP_SUCCESS .. (select(2, GetItemInfo(self.originalCloak)) or "Unknown Cloak"))
					self:ResetCloakProcess()
				end
			end
			self:HandleBackSlotItem()
		end
	end)

	RGX:RegisterEvent("PLAYER_REGEN_DISABLED", function()
		self.inCombat = true
		if not InCombatLockdown() and self.secureButton then
			self.secureButton:Hide()
		end
	end)

	RGX:RegisterEvent("PLAYER_REGEN_ENABLED", function()
		self.inCombat = false
		self:HandleBackSlotItem()
	end)

	RGX:RegisterEvent("GET_ITEM_INFO_RECEIVED", function()
		if self.waitingForItemInfo and self.pendingAction then
			self.waitingForItemInfo = false
			self.pendingAction()
			self.pendingAction = nil
		end
	end)

	RGX:RegisterEvent("BAG_UPDATE_DELAYED", function()
		self:UpdateUsableCloaks()
	end)

	RGX:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED", function(unit, _, spellID)
		if unit == "player" and self.teleportInProgress then
			self:StartReEquipCheck()
		end
	end)
end