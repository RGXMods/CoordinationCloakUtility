-- CCU | Minimap Button (RGXMinimap)
local CCU = _G.CCU
local RGX = _G.RGXFramework

function CCU:CreateMinimapButton()
	if self.minimapButton then return end

	local iconPath = "Interface\\AddOns\\CoordinationCloakUtility\\media\\ccu"

	self.minimapButton = RGXMinimap:Create({
		name = "CCU_MinimapButton",
		icon = iconPath,
		iconSize = 19,
		buttonSize = 32,
		angle = self.db.minimapAngle,
		radius = 80,
		draggable = true,
		onClick = function(button, mouseButton)
			if mouseButton == "LeftButton" then
				self:HandleMinimapClick()
			end
		end,
		onRightClick = function(button)
			-- Ctrl+Right-click handled via tooltip/scripts
		end,
		onDragStop = function(btn, angle)
			self.db.minimapAngle = angle
		end,
		tooltip = {
			title = self.MINIMAP_TOOLTIP_TITLE,
			subtitle = self.MINIMAP_TOOLTIP_SUBTITLE,
			lines = {
				"|cffd9c6ffKeep your teleport cloak flow one click away.|r",
				" ",
				{left = "|cff8b0941Left-Click|r", right = "|cffffffffEquip or use your teleport cloak|r"},
				{left = "|cff4ecdc4Left-Drag|r", right = "|cffffffffMove around minimap|r"},
				{left = "|cffe74c3cCtrl+Right-Click|r", right = "|cffffffffHide minimap icon|r"},
			},
		},
	})

	-- Add Ctrl+Right-click to hide
	self.minimapButton:SetScript("OnMouseUp", function(btn, mouseButton)
		if mouseButton == "RightButton" and IsControlKeyDown() then
			self:ToggleMinimapIcon(false)
		end
	end)

	-- Apply saved angle
	if self.db.minimapAngle then
		self.minimapButton:SetAngle(self.db.minimapAngle)
	end

	-- Apply saved visibility
	if not self.db.minimapIconEnabled then
		self.minimapButton:Hide()
	end
end

function CCU:UpdateMinimapButtonPosition()
	if not self.minimapButton then return end
	self.minimapButton:SetAngle(self.db.minimapAngle or self.defaultMinimapAngle)
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
	self:HandleCloakUse("minimap")
	self:RefreshMinimapButton()
end

-- Tooltip helpers (RGXMinimap handles tooltip, but we need dynamic content)
function CCU:UpdateMinimapTooltip()
	if not self.minimapButton then return end
	-- RGXMinimap handles tooltip refresh automatically
end