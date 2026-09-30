-- Portuguese (Portugal) Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- Portuguese (Portugal)
CCU.Locale["ptPT"] = {
    -- Welcome and Version
    WELCOME_MSG = "Bem-vindo! Usa /ccu help para veres os comandos.",
    VERSION = "Versão: ",

    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "Manto original guardado: ",
    CLOAK_EQUIPPED = " equipado. Clica no botão para usá-lo.",
    CLOAK_ALREADY_EQUIPPED = "O manto já está equipado. Pronto a usar.",
    CLOAK_UNEQUIPPED = "Manto de teletransporte desequipado.",

    -- Equip Status
    FAILED_EQUIP = "Falha ao equipar o manto. A tentar novamente...",
    SUCCESS_EQUIP = "Manto equipado com sucesso após nova tentativa.",
    FINAL_FAILED_EQUIP = "Falha ao equipar o manto após nova tentativa. Por favor, tenta manualmente.",

    -- Re-equip Messages
    REEQUIP_CLOAK = "A re-equipar o manto original agora: ",
    REEQUIP_SUCCESS = "Manto original re-equipado com sucesso: ",
    REEQUIP_FAILED = "Falha ao re-equipar o manto original dentro do tempo limite. Por favor, verifica o teu inventário.",
    NO_CLOAK_REEQUIP = "Nenhum manto original para re-equipar.",

    -- Commands and Help
    HELP_COMMAND = "Comandos disponíveis:",
    HELP_OPTION_PANEL = " /ccu - Aciona o utilitário de manto.",
    HELP_WELCOME = " /ccu welcome - Ativa/desativa a mensagem de boas-vindas.",
    HELP_ICON = " /ccu icon on ou off - Mostrar/ocultar o ícone do minimapa.",
    HELP_HELP = " /ccu help - Exibe esta mensagem de ajuda.",
    UNKNOWN_COMMAND = "Comando desconhecido. Digita /ccu help para uma lista de comandos.",

    -- Cooldown and Combat
    CLOAK_ON_CD = "%s está em recarga: %s restantes.",
    NO_USABLE_CLOAK = "Nenhum manto de teletransporte utilizável encontrado ou todos estão em recarga.",
    COMBAT_ACTIVE = "Combate ativo. Por favor, tenta novamente após saíres do combate.",

    -- Settings
    WELCOME_MSG_ENABLED = "Mensagem de boas-vindas ativada.",
    WELCOME_MSG_DISABLED = "Mensagem de boas-vindas desativada.",

    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "Teletransporte em andamento.",
    PROCESS_STARTED = " processo iniciado.",
    HIDING_BUTTON = "A ocultar o botão.",
    PROCESS_RESET = "Processo de uso do manto reposto.",
    NO_CLOAK_EQUIPPED = "Nenhum manto equipado.",

    -- Minimap
    MINIMAP_ICON_SHOWN = "Ícone do minimapa visível.",
    MINIMAP_ICON_HIDDEN = "Ícone do minimapa oculto. Usa /ccu icon on para o mostrar novamente.",
    MINIMAP_TOOLTIP_INTRO = "Mantém o teu fluxo de manto de teletransporte a um clique de distância.",

    -- Button Text
    BUTTON_TEXT = "Teletransportar",
    BUTTON_TOOLTIP = "Clica para usar o manto de teletransporte",
}
