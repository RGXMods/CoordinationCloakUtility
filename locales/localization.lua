-- Localization Loader for CCU
local _, CCU = ...

-- Initialize localization tables
CCU.Locale = CCU.Locale or {}
CCU.L = {}

-- Ordered list of every key populated into CCU.L. Any key consumed by the
-- addon must appear exactly once in each locale table and is resolved here.
CCU.localeKeys = {
    "WELCOME_MSG", "VERSION", "ORIGINAL_CLOAK_SAVED", "CLOAK_EQUIPPED",
    "CLOAK_ALREADY_EQUIPPED", "FAILED_EQUIP", "SUCCESS_EQUIP", "FINAL_FAILED_EQUIP",
    "REEQUIP_CLOAK", "REEQUIP_SUCCESS", "REEQUIP_FAILED", "NO_CLOAK_REEQUIP",
    "HELP_COMMAND", "HELP_OPTION_PANEL", "HELP_WELCOME", "HELP_ICON", "HELP_HELP",
    "UNKNOWN_COMMAND", "CLOAK_ON_CD", "NO_USABLE_CLOAK", "COMBAT_ACTIVE",
    "WELCOME_MSG_ENABLED", "WELCOME_MSG_DISABLED", "TELEPORTATION_IN_PROGRESS",
    "PROCESS_STARTED", "CLOAK_UNEQUIPPED", "HIDING_BUTTON", "PROCESS_RESET",
    "NO_CLOAK_EQUIPPED", "MINIMAP_ICON_SHOWN", "MINIMAP_ICON_HIDDEN",
    "MINIMAP_TOOLTIP_INTRO", "BUTTON_TEXT", "BUTTON_TOOLTIP",
}

-- Resolve a raw (uncolored) localized string with enUS fallback
function CCU:GetLocalizedText(key)
    local locale = GetLocale() or "enUS"
    local strings = CCU.Locale[locale]
    if strings and strings[key] ~= nil then
        return strings[key]
    end
    strings = CCU.Locale["enUS"]
    if strings and strings[key] ~= nil then
        return strings[key]
    end
    return key -- render the key itself only if nothing is defined anywhere
end

-- Function to get localized string with color codes
function CCU:GetLocalizedString(key)
    local text = self:GetLocalizedText(key)

    -- Apply colors based on the key type
    if key == "WELCOME_MSG" then
        return CCU.colors.white .. text:gsub("/ccu help", CCU.colors.prefix .. "/ccu help|r")
    elseif key == "VERSION" then
        return CCU.colors.info .. text .. "|r"
    elseif key == "ORIGINAL_CLOAK_SAVED" or key == "REEQUIP_CLOAK" then
        return CCU.colors.info .. text .. "|r"
    elseif key == "CLOAK_EQUIPPED" then
        -- Split on the first sentence terminator; zhCN/zhTW end sentences with
        -- the ideographic full stop U+3002 instead of ASCII "." (a byte-class
        -- find on [%.\227\128\130] would be unsafe, so plain-find both forms
        -- and take the earliest match).
        local startPos, endPos
        local asciiS, asciiE = text:find("%.")
        local ideoS, ideoE = text:find("。", 1, true)
        if asciiS and (not ideoS or asciiS < ideoS) then
            startPos, endPos = asciiS, asciiE
        elseif ideoS then
            startPos, endPos = ideoS, ideoE
        end
        if not startPos then
            return CCU.colors.success .. text .. "|r"
        end
        return CCU.colors.success .. text:sub(1, endPos) .. CCU.colors.info .. text:sub(endPos + 1) .. "|r"
    elseif key == "CLOAK_ALREADY_EQUIPPED" or key == "CLOAK_UNEQUIPPED" or key == "HIDING_BUTTON" or key == "PROCESS_RESET" or key == "PROCESS_STARTED" or key == "NO_CLOAK_EQUIPPED" or key == "MINIMAP_TOOLTIP_INTRO" then
        return CCU.colors.info .. text .. "|r"
    elseif key == "FAILED_EQUIP" or key == "FINAL_FAILED_EQUIP" or key == "REEQUIP_FAILED" or key == "NO_CLOAK_REEQUIP" or key == "NO_USABLE_CLOAK" or key == "COMBAT_ACTIVE" then
        return CCU.colors.error .. text .. "|r"
    elseif key == "SUCCESS_EQUIP" or key == "REEQUIP_SUCCESS" or key == "WELCOME_MSG_ENABLED" or key == "TELEPORTATION_IN_PROGRESS" or key == "MINIMAP_ICON_SHOWN" or key == "MINIMAP_ICON_HIDDEN" then
        return CCU.colors.success .. text .. "|r"
    elseif key == "WELCOME_MSG_DISABLED" then
        return CCU.colors.error .. text .. "|r"
    elseif key == "HELP_COMMAND" then
        return CCU.colors.info .. text
    elseif key == "HELP_OPTION_PANEL" or key == "HELP_WELCOME" or key == "HELP_ICON" or key == "HELP_HELP" then
        local cmd = text:match("(/ccu[^%s]*)")
        if cmd then
            return " " .. CCU.colors.prefix .. cmd .. "|r" .. text:sub(#cmd + 1)
        end
        return text
    elseif key == "UNKNOWN_COMMAND" then
        return CCU.colors.warning .. text:gsub("/ccu help", CCU.colors.prefix .. "/ccu help|r") .. "|r"
    elseif key == "CLOAK_ON_CD" then
        return CCU.colors.error .. text .. "|r"
    else
        return text
    end
end

-- Load localization strings after all locale files are loaded
function CCU:InitializeLocalization()
    -- Build the CCU.L table with colored strings
    CCU.L = {}
    for _, key in ipairs(CCU.localeKeys) do
        CCU.L[key] = CCU:GetLocalizedString(key)
    end
end
