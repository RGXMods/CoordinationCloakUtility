-- CCU | Secure Button & Minimap Refresh
local CCU = _G.CCU
local RGX = _G.RGXFramework
local GetItemIcon = RGX.API.GetItemIcon

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
	button:RegisterForClicks("AnyDown", "AnyUp")
	button:Hide()
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
	button:SetAttribute("item", nil)
end

-- Configure secure button
function CCU:ConfigureSecureTeleportButton(button, cloakID, includeEquip)
	if InCombatLockdown() or not button or not cloakID then return end

	button:SetAttribute("type", "item")
	button:SetAttribute("item", "item:" .. cloakID)
	button:SetAttribute("macrotext", nil)
end

-- Configure secure button for back slot
function CCU:ConfigureSecureButtonForBackSlot(cloakID)
	if not self.secureButton then return end

	self:ConfigureSecureTeleportButton(self.secureButton, cloakID, false)
	self.secureButton:SetNormalTexture(GetItemIcon(cloakID))
end

-- Refresh minimap button
function CCU:RefreshMinimapButton()
	if not self.minimapButton then return end

	if self.forceDefaultMinimapIcon then
		self.minimapButton:SetItemAction(nil)
		self.minimapButton.frame.icon:SetTexture("Interface\\AddOns\\CoordinationCloakUtility\\media\\ccu")
		return
	end

	local backSlotID = GetInventorySlotInfo("BackSlot")
	local equippedCloakID = GetInventoryItemID("player", backSlotID)
	local cloakIcon = "Interface\\AddOns\\CoordinationCloakUtility\\media\\ccu"

	if equippedCloakID and self.usableCloaks[equippedCloakID] then
		cloakIcon = GetItemIcon(equippedCloakID) or cloakIcon
	end
	local actionID = self._minimapProcess and equippedCloakID == self._minimapCloakID
		and self.usableCloaks[equippedCloakID] and equippedCloakID or nil
	self.minimapButton:SetItemAction(actionID)

	self.minimapButton.frame.icon:SetTexture(cloakIcon)
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
	self:Print(status)
end

-- Display help
function CCU:DisplayHelp()
	self:Print(self.L.HELP_COMMAND)
	self:Print(self.L.HELP_OPTION_PANEL)
	self:Print(self.L.HELP_WELCOME)
	self:Print(self.L.HELP_ICON)
	self:Print(self.L.HELP_HELP)
end
