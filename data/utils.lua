-- CCU | Secure Button & Minimap Refresh
local CCU = _G.CCU
local RGX = _G.RGXFramework

-- Create secure button for cloak usage
function CCU:CreateSecureButton()
	if InCombatLockdown() then return end

	self.secureButton = CreateFrame("Button", "CCU_CloakUseButton", UIParent, "SecureActionButtonTemplate")
	local button = self.secureButton
	button:SetSize(64, 64)
	button:SetPoint("CENTER")
	button:SetNormalFontObject("GameFontNormalLarge")
	button:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
	button:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square")
	button:RegisterForClicks("AnyUp")
	button:SetScript("PostClick", function() self:HandleTeleportButtonPostClick() end)
	button:Hide()
end

-- Handle teleport button post-click
function CCU:HandleTeleportButtonPostClick()
	local backSlotID = GetInventorySlotInfo("BackSlot")
	local equippedCloakID = GetInventoryItemID("player", backSlotID)
	if equippedCloakID and self.usableCloaks[equippedCloakID] and not self.teleportInProgress then
		self.teleportInProgress = true
		self:Print(self.CCU_PREFIX .. self.L.TELEPORTATION_IN_PROGRESS)
	end
end

-- Build teleport macro
function CCU:BuildTeleportMacro(cloakID, includeEquip)
	if not cloakID then return nil end

	if includeEquip then
		return string.format("/equipslot 15 item:%d\n/use 15", cloakID)
	end

	return "/use 15"
end

-- Clear secure button
function CCU:ClearSecureTeleportButton(button)
	if InCombatLockdown() or not button then return end

	button:SetAttribute("type", nil)
	button:SetAttribute("macrotext", nil)
end

-- Configure secure button
function CCU:ConfigureSecureTeleportButton(button, cloakID, includeEquip)
	if InCombatLockdown() or not button or not cloakID then return end

	button:SetAttribute("type", "macro")
	button:SetAttribute("macrotext", self:BuildTeleportMacro(cloakID, includeEquip))
end

-- Configure secure button for back slot
function CCU:ConfigureSecureButtonForBackSlot(cloakID)
	if not self.secureButton then return end

	self:ConfigureSecureTeleportButton(self.secureButton, cloakID, false)
	self.secureButton:SetNormalTexture(GetItemIcon(cloakID))
end

-- Try execute teleport macro
function CCU:TryExecuteTeleportMacro(cloakID)
	if not cloakID or InCombatLockdown() then
		return false
	end

	local macroText = self:BuildTeleportMacro(cloakID, true)
	if not macroText or type(RunMacroText) ~= "function" then
		return false
	end

	local ok = pcall(RunMacroText, macroText)
	return ok == true
end

-- Refresh minimap button
function CCU:RefreshMinimapButton()
	if not self.minimapButton then return end

	if self.forceDefaultMinimapIcon then
		self:ClearSecureTeleportButton(self.minimapButton)
		self.minimapButton.icon:SetTexture("Interface\\AddOns\\CoordinationCloakUtility\\media\\ccu")
		return
	end

	local backSlotID = GetInventorySlotInfo("BackSlot")
	local equippedCloakID = GetInventoryItemID("player", backSlotID)
	local cloakIcon = "Interface\\AddOns\\CoordinationCloakUtility\\media\\ccu"

	if equippedCloakID and self.usableCloaks[equippedCloakID] then
		local start, duration = GetItemCooldown(equippedCloakID)
		if duration == 0 then
			self:ConfigureSecureTeleportButton(self.minimapButton, equippedCloakID, false)
		else
			self:ClearSecureTeleportButton(self.minimapButton)
		end
		cloakIcon = GetItemIcon(equippedCloakID) or cloakIcon
	else
		self:ClearSecureTeleportButton(self.minimapButton)
	end

	self.minimapButton.icon:SetTexture(cloakIcon)
end

-- Format time
function CCU:FormatTime(seconds)
	local hours = math.floor(seconds / 3600)
	local mins = math.floor((seconds % 3600) / 60)
	local secs = seconds % 60

	local timeStr = ""
	if hours > 0 then
		timeStr = string.format("%s%d|r%s hr %s%02d|r%s min %s%02d|r%s sec", self.colors.highlight, hours, self.colors.info, self.colors.highlight, mins, self.colors.info, self.colors.highlight, secs, self.colors.info)
	elseif mins > 0 then
		timeStr = string.format("%s%d|r%s min %s%02d|r%s sec", self.colors.highlight, mins, self.colors.info, self.colors.highlight, secs, self.colors.info)
	else
		timeStr = string.format("%s%d|r%s sec", self.colors.highlight, secs, self.colors.info)
	end
	return timeStr
end

-- Notify combat lockdown
function CCU:NotifyCombatLockdown()
	self:Print(self.L.COMBAT_ACTIVE)
end

-- Toggle welcome message
function CCU:ToggleWelcomeMessage()
	self.db.showWelcomeMessage = not self.db.showWelcomeMessage
	local status = self.db.showWelcomeMessage and self.L.WELCOME_MSG_ENABLED or self.L.WELCOME_MSG_DISABLED
	self:Print(self.CCU_PREFIX .. status)
end

-- Display help
function CCU:DisplayHelp()
	self:Print(self.L.HELP_COMMAND)
	self:Print(self.CCU_PREFIX .. self.L.HELP_OPTION_PANEL)
	self:Print(self.CCU_PREFIX .. self.L.HELP_WELCOME)
	self:Print(self.CCU_PREFIX .. self.L.HELP_ICON)
	self:Print(self.CCU_PREFIX .. self.L.HELP_HELP)
end