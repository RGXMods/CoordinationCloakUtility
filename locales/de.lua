-- German Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- German
CCU.Locale["deDE"] = {
    -- Welcome and Version
    WELCOME_MSG = "Willkommen! Benutze /ccu help für Befehle.",
    VERSION = "Version: ",
    
    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "Ursprünglicher Umhang gespeichert: ",
    CLOAK_EQUIPPED = " angelegt. Klicke auf den Knopf, um ihn zu benutzen.",
    CLOAK_ALREADY_EQUIPPED = "Umhang ist bereits angelegt. Bereit zur Benutzung.",
    CLOAK_UNEQUIPPED = "Teleportationsumhang abgelegt.",
    
    -- Equip Status
    FAILED_EQUIP = "Fehler beim Anlegen des Umhangs. Erneuter Versuch...",
    SUCCESS_EQUIP = "Umhang erfolgreich nach erneutem Versuch angelegt.",
    FINAL_FAILED_EQUIP = "Fehler beim Anlegen des Umhangs nach erneutem Versuch. Bitte versuche es manuell.",
    
    -- Re-equip Messages
    REEQUIP_CLOAK = "Lege ursprünglichen Umhang wieder an: ",
    REEQUIP_SUCCESS = "Ursprünglicher Umhang erfolgreich wieder angelegt: ",
    REEQUIP_FAILED = "Fehler beim Wiederanlegen des ursprünglichen Umhangs innerhalb der Zeitgrenze. Bitte überprüfe dein Inventar.",
    NO_CLOAK_REEQUIP = "Kein ursprünglicher Umhang zum Wiederanlegen.",
    
    -- Commands and Help
    HELP_COMMAND = "Verfügbare Befehle:",
    HELP_OPTION_PANEL = " /ccu - Aktiviere das Umhang-Hilfsprogramm.",
    HELP_WELCOME = " /ccu welcome - Schaltet die Willkommensnachricht ein/aus.",
    HELP_HELP = " /ccu help - Zeigt diese Hilfsnachricht an.",
    HELP_ICON = " /ccu icon on oder off - Minimap-Symbol anzeigen/ausblenden.",
    UNKNOWN_COMMAND = "Unbekannter Befehl. Gib /ccu help für eine Liste der Befehle ein.",
    
    -- Cooldown and Combat
    CLOAK_ON_CD = "%s hat Abklingzeit: %s verbleibend.",
    NO_USABLE_CLOAK = "Kein benutzbarer Teleportationsumhang gefunden oder alle haben Abklingzeit.",
    COMBAT_ACTIVE = "Kampf ist aktiv. Bitte versuche es nach Verlassen des Kampfes erneut.",
    
    -- Settings
    WELCOME_MSG_ENABLED = "Willkommensnachricht aktiviert.",
    WELCOME_MSG_DISABLED = "Willkommensnachricht deaktiviert.",
    
    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "Teleportation im Gange.",
    PROCESS_STARTED = " Vorgang gestartet.",
    HIDING_BUTTON = "Verstecke Knopf.",
    PROCESS_RESET = "Umhang-Benutzungsprozess zurückgesetzt.",
    NO_CLOAK_EQUIPPED = "Kein Umhang angelegt.",
    
    -- Minimap
    MINIMAP_ICON_SHOWN = "Minimap-Symbol eingeblendet.",
    MINIMAP_ICON_HIDDEN = "Minimap-Symbol ausgeblendet. Benutze /ccu icon on, um es wieder anzuzeigen.",
    MINIMAP_TOOLTIP_INTRO = "Halte deinen Teleport-Umhang-Fluss nur einen Klick entfernt.",

    -- Button Text
    BUTTON_TEXT = "Teleportieren",
    BUTTON_TOOLTIP = "Klicken, um Teleportationsumhang zu benutzen",
}