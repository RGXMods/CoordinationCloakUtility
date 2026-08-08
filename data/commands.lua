-- CCU | Commands
local CCU = _G.CCU
local RGX = _G.RGXFramework

function CCU:RegisterCommands()
	RGX:RegisterSlashCommand("ccu", function(input)
		input = input:trim():lower()

		if self.inCombat then
			self:NotifyCombatLockdown()
			return
		end

		if input == "" then
			self:HandleCloakUse("slash")
		elseif input == "welcome" then
			self:ToggleWelcomeMessage()
		elseif input == "icon on" then
			self:ToggleMinimapIcon(true)
		elseif input == "icon off" then
			self:ToggleMinimapIcon(false)
		elseif input == "help" then
			self:DisplayHelp()
		else
			self:Print(self.L.UNKNOWN_COMMAND)
		end
	end)
end