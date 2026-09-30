-- Italian Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- Italian
CCU.Locale["itIT"] = {
    -- Welcome and Version
    WELCOME_MSG = "Benvenuto! Usa /ccu help per i comandi.",
    VERSION = "Versione: ",

    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "Mantello originale salvato: ",
    CLOAK_EQUIPPED = " equipaggiato. Clicca il pulsante per usarlo.",
    CLOAK_ALREADY_EQUIPPED = "Mantello già equipaggiato. Pronto per l'uso.",
    CLOAK_UNEQUIPPED = "Mantello da teletrasporto non equipaggiato.",

    -- Equip Status
    FAILED_EQUIP = "Impossibile equipaggiare il mantello. Riprovo...",
    SUCCESS_EQUIP = "Mantello equipaggiato con successo dopo il nuovo tentativo.",
    FINAL_FAILED_EQUIP = "Impossibile equipaggiare il mantello dopo il nuovo tentativo. Prova manualmente.",

    -- Re-equip Messages
    REEQUIP_CLOAK = "Re-equipaggiamento del mantello originale in corso: ",
    REEQUIP_SUCCESS = "Mantello originale re-equipaggiato con successo: ",
    REEQUIP_FAILED = "Impossibile re-equipaggiare il mantello originale entro il tempo limite. Controlla il tuo inventario.",
    NO_CLOAK_REEQUIP = "Nessun mantello originale da re-equipaggiare.",

    -- Commands and Help
    HELP_COMMAND = "Comandi disponibili:",
    HELP_OPTION_PANEL = " /ccu - Attiva l'utilità del mantello.",
    HELP_WELCOME = " /ccu welcome - Attiva/disattiva il messaggio di benvenuto.",
    HELP_HELP = " /ccu help - Mostra questo messaggio di aiuto.",
    HELP_ICON = " /ccu icon on oppure off - Mostra/nascondi l'icona della minimappa.",
    UNKNOWN_COMMAND = "Comando sconosciuto. Digita /ccu help per un elenco di comandi.",

    -- Cooldown and Combat
    CLOAK_ON_CD = "%s è in tempo di recupero: %s rimanenti.",
    NO_USABLE_CLOAK = "Nessun mantello da teletrasporto utilizzabile trovato o sono tutti in tempo di recupero.",
    COMBAT_ACTIVE = "Combattimento attivo. Riprova dopo aver lasciato il combattimento.",

    -- Settings
    WELCOME_MSG_ENABLED = "Messaggio di benvenuto abilitato.",
    WELCOME_MSG_DISABLED = "Messaggio di benvenuto disabilitato.",

    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "Teletrasporto in corso.",
    PROCESS_STARTED = " processo avviato.",
    HIDING_BUTTON = "Pulsante nascosto.",
    PROCESS_RESET = "Processo di utilizzo del mantello ripristinato.",
    NO_CLOAK_EQUIPPED = "Nessun mantello equipaggiato.",

    -- Minimap
    MINIMAP_ICON_SHOWN = "Icona della minimappa mostrata.",
    MINIMAP_ICON_HIDDEN = "Icona della minimappa nascosta. Usa /ccu icon on per mostrarla di nuovo.",
    MINIMAP_TOOLTIP_INTRO = "Mantieni il flusso del mantello da teletrasporto a un clic di distanza.",

    -- Button Text
    BUTTON_TEXT = "Teletrasporto",
    BUTTON_TOOLTIP = "Clicca per usare il mantello da teletrasporto",
}