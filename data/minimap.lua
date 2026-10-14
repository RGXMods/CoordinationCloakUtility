-- CCU | Minimap Button (RGXMinimap)
local CCU = _G.CCU
local RGX = _G.RGXFramework

function CCU:CreateMinimapButton()
	if self.minimapButton then return end

	local iconPath = "Interface\\AddOns\\CoordinationCloakUtility\\media\\ccu"

	self.minimapButton = RGX:GetMinimap():Create({
		name = "CCU_MinimapButton",
		secure = true,
		icon = iconPath,
		iconSize = 19,
		buttonSize = 32,
		defaultAngle = self.defaultMinimapAngle,
		storage = self.db,
		enabledKey = "minimapIconEnabled",
		onLeftClick = function()
			self:HandleMinimapClick()
		end,
		onCtrlRight = function()
			self:ToggleMinimapIcon(false)
		end,
		-- Keep the colored title and usage hints, without the introductory subtext.
		tooltip = {
			title = "|cff8b0941C|r|cffffffffoordination|r |cff8b0941C|r|cffffffffloak|r |cff8b0941U|r|cfffffffftility|r|cff8b0941!|r",
			lines = {
				{left = "|cff8b0941First Left-Click|r", right = "|cffffffffPrepare / equip cloak|r"},
				{left = "|cff8b0941Second Left-Click|r", right = "|cffffffffTeleport using this icon|r"},
				{left = "|cff4ecdc4Left-Drag|r", right = "|cffffffffMove around minimap|r"},
				{left = "|cffe74c3cCtrl+Right-Click|r", right = "|cffffffffHide minimap icon|r"},
			},
		},
	})

	if not self.minimapButton then return end

	-- Apply saved angle
	if self.db.minimapAngle then
		self.minimapButton:SetAngle(self.db.minimapAngle)
	end

	-- Apply saved visibility
	self.minimapButton:SetVisible(self.db.minimapIconEnabled ~= false)
end

function CCU:UpdateMinimapButtonPosition()
	if not self.minimapButton then return end
	self.minimapButton:SetAngle(self.db.minimapAngle or self.defaultMinimapAngle)
	self.minimapButton:PlaceAtAngle()
end

function CCU:ToggleMinimapIcon(show)
	self.db.minimapIconEnabled = show
	if show then
		if self.minimapButton then
			self.minimapButton:Show()
			self:UpdateMinimapButtonPosition()
		end
		self:Print(self.L.MINIMAP_ICON_SHOWN)
	else
		if self.minimapButton then
			self.minimapButton:Hide()
		end
		self:Print(self.L.MINIMAP_ICON_HIDDEN)
	end
end

-- Minimap click handler
function CCU:HandleMinimapClick()
	if self.inCombat then
		self:NotifyCombatLockdown()
		return
	end
	if self.teleportInProgress then return end
	if self._minimapProcess then
		local equipped = GetInventoryItemID("player", GetInventorySlotInfo("BackSlot"))
		if equipped == self._minimapCloakID then return end
	end
	self:HandleCloakUse("minimap")
	self:RefreshMinimapButton()
end

-- Tooltip helpers (RGXMinimap handles tooltip, but we need dynamic content)
function CCU:UpdateMinimapTooltip()
	if not self.minimapButton then return end
	-- RGXMinimap handles tooltip refresh automatically
end
