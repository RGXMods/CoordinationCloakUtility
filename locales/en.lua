-- English Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- English (Default)
CCU.Locale["enUS"] = {
    -- Welcome and Version
    WELCOME_MSG = "Welcome! Use /ccu help for commands.",
    VERSION = "Version: ",
    
    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "Original cloak saved: ",
    CLOAK_EQUIPPED = " equipped. Click the button to use it.",
    CLOAK_ALREADY_EQUIPPED = "Cloak is already equipped. Ready to use.",
    CLOAK_UNEQUIPPED = "Teleportation cloak unequipped.",
    
    -- Equip Status
    FAILED_EQUIP = "Failed to equip the cloak. Retrying...",
    SUCCESS_EQUIP = "Cloak successfully equipped after retry.",
    FINAL_FAILED_EQUIP = "Failed to equip the cloak after retrying. Please try manually.",
    
    -- Re-equip Messages
    REEQUIP_CLOAK = "Re-equipping original cloak now: ",
    REEQUIP_SUCCESS = "Successfully re-equipped original cloak: ",
    REEQUIP_FAILED = "Failed to re-equip original cloak within the timeout period. Please check your inventory.",
    NO_CLOAK_REEQUIP = "No original cloak to re-equip.",
    
    -- Commands and Help
    HELP_COMMAND = "Available commands:",
    HELP_OPTION_PANEL = " /ccu - Trigger the cloak utility.",
    HELP_WELCOME = " /ccu welcome - Toggles the welcome message on/off.",
    HELP_HELP = " /ccu help - Displays this help message.",
    HELP_ICON = " /ccu icon on or off - Show/hide the minimap icon.",
    UNKNOWN_COMMAND = "Unknown command. Type /ccu help for a list of commands.",
    
    -- Cooldown and Combat
    CLOAK_ON_CD = "%s is on cooldown: %s remaining.",
    NO_USABLE_CLOAK = "No usable teleportation cloak found or all are on cooldown.",
    COMBAT_ACTIVE = "Combat is active. Please try again after leaving combat.",
    
    -- Settings
    WELCOME_MSG_ENABLED = "Welcome message enabled.",
    WELCOME_MSG_DISABLED = "Welcome message disabled.",
    
    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "Teleportation in progress.",
    PROCESS_STARTED = " process started.",
    HIDING_BUTTON = "Hiding button.",
    PROCESS_RESET = "Cloak usage process reset.",
    NO_CLOAK_EQUIPPED = "No cloak equipped.",
    
    -- Minimap
    MINIMAP_ICON_SHOWN = "Minimap icon shown.",
    MINIMAP_ICON_HIDDEN = "Minimap icon hidden. Use /ccu icon on to show it again.",
    MINIMAP_TOOLTIP_INTRO = "Keep your teleport cloak flow one click away.",

    -- Button Text
    BUTTON_TEXT = "Teleport",
    BUTTON_TOOLTIP = "Click to use teleportation cloak",
}