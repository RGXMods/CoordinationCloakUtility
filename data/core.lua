-- CCU | Coordination Cloak Utility - Core bootstrap
local CCU = {}
_G.CCU = CCU

CCU.name = "CoordinationCloakUtility"
CCU.version = C_AddOns.GetAddOnMetadata(CCU.name, "Version")

-- Colors
CCU.colors = {
	prefix = "|cff8b0941",
	success = "|cff00ff00",
	error = "|cffff0000",
	highlight = "|cff8080ff",
	info = "|cffffff00",
	white = "|cffffffff",
	warning = "|cffffcc00",
}

CCU.CCU_PREFIX = "|Tinterface/addons/CoordinationCloakUtility/media/icon:16:16|t - [" .. CCU.colors.prefix .. "CCU|r] "

-- Cloak item IDs
CCU.cloaks = {65274, 65360, 63206, 63207, 63352, 63353}
CCU.usableCloaks = {}

-- State
CCU.originalCloak = nil
CCU.teleportInProgress = false
CCU.waitingToReequip = false
CCU.inCombat = false
CCU.waitingForItemInfo = false
CCU.pendingAction = nil
CCU.cloaksInitialized = false
CCU.forceDefaultMinimapIcon = false
CCU.inLoadingScreen = false
CCU.reEquipAttempted = false
CCU.reEquipStartTime = nil
CCU.reEquipTimeout = 20
CCU.reEquipRetryCount = 0
CCU.reEquipRetryMax = 5
CCU.reEquipRetryDelay = 2
CCU.lastZone = nil
CCU.lastSubZone = nil
CCU.currentCloakID = nil
CCU.lastNonTeleportationCloakID = nil
CCU.reEquipTimer = nil
CCU.minimapRadius = 80
CCU.defaultMinimapAngle = 220
CCU.secureButton = nil
CCU.minimapButton = nil

-- Load RGX
local RGX = assert(_G.RGXFramework, "CCU requires RGX-Framework")

-- Initialize database
CCU.db = RGX:NewDatabase("CCUDB", {
	showWelcomeMessage = true,
	minimapAngle = 220,
	minimapIconEnabled = true,
	lastEquippedCloak = nil,
})

-- Bootstrap RGX Addon
RGX.Addon(CCU.name, {
	db = CCU.db,
	onLoad = function(self)
		self:Initialize()
	end,
})

function CCU:Initialize()
	RGX:Print(self.CCU_PREFIX .. "Initializing...")

	-- Create secure button for cloak usage
	self:CreateSecureButton()

	-- Minimap button via RGX
	self:CreateMinimapButton()

	-- Register events
	self:RegisterEvents()

	-- Register slash commands
	self:RegisterCommands()

	-- Initialize cloaks
	self:InitializeCloaks()

	-- Apply minimap settings
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

	RGX:Print(self.CCU_PREFIX .. "Loaded v" .. self.version)
end

function CCU:Print(msg)
	print(self.CCU_PREFIX .. msg)
end

function CCU:PrintWelcome()
	self:Print(self.L.WELCOME_MSG)
	self:Print(self.L.VERSION .. "|cff8080ff" .. self.version .. "|r")
end