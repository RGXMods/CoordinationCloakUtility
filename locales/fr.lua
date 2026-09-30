-- French Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- French
CCU.Locale["frFR"] = {
    -- Welcome and Version
    WELCOME_MSG = "Bienvenue! Utilisez /ccu help pour les commandes.",
    VERSION = "Version: ",
    
    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "Cape originale sauvegardée: ",
    CLOAK_EQUIPPED = " équipée. Cliquez sur le bouton pour l'utiliser.",
    CLOAK_ALREADY_EQUIPPED = "La cape est déjà équipée. Prête à l'emploi.",
    CLOAK_UNEQUIPPED = "Cape de téléportation déséquipée.",
    
    -- Equip Status
    FAILED_EQUIP = "Échec de l'équipement de la cape. Nouvelle tentative...",
    SUCCESS_EQUIP = "Cape équipée avec succès après nouvelle tentative.",
    FINAL_FAILED_EQUIP = "Échec de l'équipement de la cape après nouvelle tentative. Veuillez essayer manuellement.",
    
    -- Re-equip Messages
    REEQUIP_CLOAK = "Rééquipement de la cape originale maintenant: ",
    REEQUIP_SUCCESS = "Cape originale rééquipée avec succès: ",
    REEQUIP_FAILED = "Échec du rééquipement de la cape originale dans le délai imparti. Veuillez vérifier votre inventaire.",
    NO_CLOAK_REEQUIP = "Aucune cape originale à rééquiper.",
    
    -- Commands and Help
    HELP_COMMAND = "Commandes disponibles:",
    HELP_OPTION_PANEL = " /ccu - Déclencher l'utilitaire de cape.",
    HELP_WELCOME = " /ccu welcome - Active/désactive le message de bienvenue.",
    HELP_HELP = " /ccu help - Affiche ce message d'aide.",
    HELP_ICON = " /ccu icon on ou off - Afficher/masquer l'icône de la minicarte.",
    UNKNOWN_COMMAND = "Commande inconnue. Tapez /ccu help pour une liste des commandes.",
    
    -- Cooldown and Combat
    CLOAK_ON_CD = "%s est en temps de recharge: %s restant.",
    NO_USABLE_CLOAK = "Aucune cape de téléportation utilisable trouvée ou toutes sont en temps de recharge.",
    COMBAT_ACTIVE = "Combat actif. Veuillez réessayer après avoir quitté le combat.",
    
    -- Settings
    WELCOME_MSG_ENABLED = "Message de bienvenue activé.",
    WELCOME_MSG_DISABLED = "Message de bienvenue désactivé.",
    
    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "Téléportation en cours.",
    PROCESS_STARTED = " processus démarré.",
    HIDING_BUTTON = "Masquage du bouton.",
    PROCESS_RESET = "Processus d'utilisation de la cape réinitialisé.",
    NO_CLOAK_EQUIPPED = "Aucune cape équipée.",
    
    -- Minimap
    MINIMAP_ICON_SHOWN = "Icône de la minicarte affichée.",
    MINIMAP_ICON_HIDDEN = "Icône de la minicarte masquée. Utilisez /ccu icon on pour la réafficher.",
    MINIMAP_TOOLTIP_INTRO = "Gardez votre flux de cape de téléportation à un clic.",

    -- Button Text
    BUTTON_TEXT = "Téléporter",
    BUTTON_TOOLTIP = "Cliquez pour utiliser la cape de téléportation",
}