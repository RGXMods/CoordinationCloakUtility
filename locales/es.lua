-- Spanish Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- Spanish
CCU.Locale["esES"] = {
    -- Welcome and Version
    WELCOME_MSG = "¡Bienvenido! Usa /ccu help para ver los comandos.",
    VERSION = "Versión: ",
    
    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "Capa original guardada: ",
    CLOAK_EQUIPPED = " equipada. Haz clic en el botón para usarla.",
    CLOAK_ALREADY_EQUIPPED = "La capa ya está equipada. Lista para usar.",
    CLOAK_UNEQUIPPED = "Capa de teletransporte desequipada.",
    
    -- Equip Status
    FAILED_EQUIP = "Error al equipar la capa. Reintentando...",
    SUCCESS_EQUIP = "Capa equipada exitosamente después de reintentar.",
    FINAL_FAILED_EQUIP = "Error al equipar la capa después de reintentar. Por favor, intenta manualmente.",
    
    -- Re-equip Messages
    REEQUIP_CLOAK = "Re-equipando capa original ahora: ",
    REEQUIP_SUCCESS = "Capa original re-equipada exitosamente: ",
    REEQUIP_FAILED = "Error al re-equipar la capa original dentro del tiempo límite. Por favor, revisa tu inventario.",
    NO_CLOAK_REEQUIP = "No hay capa original para re-equipar.",
    
    -- Commands and Help
    HELP_COMMAND = "Comandos disponibles:",
    HELP_OPTION_PANEL = " /ccu - Activar la utilidad de capa.",
    HELP_WELCOME = " /ccu welcome - Activa/desactiva el mensaje de bienvenida.",
    HELP_HELP = " /ccu help - Muestra este mensaje de ayuda.",
    HELP_ICON = " /ccu icon on u off - Mostrar/ocultar el icono del minimapa.",
    UNKNOWN_COMMAND = "Comando desconocido. Escribe /ccu help para ver la lista de comandos.",
    
    -- Cooldown and Combat
    CLOAK_ON_CD = "%s está en tiempo de reutilización: %s restante.",
    NO_USABLE_CLOAK = "No se encontró capa de teletransporte utilizable o todas están en tiempo de reutilización.",
    COMBAT_ACTIVE = "Combate activo. Por favor, intenta de nuevo después de salir del combate.",
    
    -- Settings
    WELCOME_MSG_ENABLED = "Mensaje de bienvenida activado.",
    WELCOME_MSG_DISABLED = "Mensaje de bienvenida desactivado.",
    
    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "Teletransporte en progreso.",
    PROCESS_STARTED = " proceso iniciado.",
    HIDING_BUTTON = "Ocultando botón.",
    PROCESS_RESET = "Proceso de uso de capa reiniciado.",
    NO_CLOAK_EQUIPPED = "No hay capa equipada.",
    
    -- Minimap
    MINIMAP_ICON_SHOWN = "Icono del minimapa visible.",
    MINIMAP_ICON_HIDDEN = "Icono del minimapa oculto. Usa /ccu icon on para mostrarlo de nuevo.",
    MINIMAP_TOOLTIP_INTRO = "Mantén tu flujo de capa de teletransporte a un clic de distancia.",

    -- Button Text
    BUTTON_TEXT = "Teletransportar",
    BUTTON_TOOLTIP = "Clic para usar capa de teletransporte",
}

-- Spanish (Mexico)
CCU.Locale["esMX"] = CCU.Locale["esES"]  -- Use same translations for Mexican Spanish