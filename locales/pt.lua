-- Portuguese (Brazil) Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- Portuguese (Brazil)
CCU.Locale["ptBR"] = {
    -- Welcome and Version
    WELCOME_MSG = "Bem-vindo! Use /ccu help para comandos.",
    VERSION = "Versão: ",

    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "Manto original salvo: ",
    CLOAK_EQUIPPED = " equipado. Clique no botão para usar.",
    CLOAK_ALREADY_EQUIPPED = "O manto já está equipado. Pronto para usar.",
    CLOAK_UNEQUIPPED = "Manto de teletransporte desequipado.",

    -- Equip Status
    FAILED_EQUIP = "Falha ao equipar o manto. Tentando novamente...",
    SUCCESS_EQUIP = "Manto equipado com sucesso após nova tentativa.",
    FINAL_FAILED_EQUIP = "Falha ao equipar o manto após nova tentativa. Por favor, tente manualmente.",

    -- Re-equip Messages
    REEQUIP_CLOAK = "Re-equipando manto original agora: ",
    REEQUIP_SUCCESS = "Manto original re-equipado com sucesso: ",
    REEQUIP_FAILED = "Falha ao re-equipar o manto original dentro do tempo limite. Por favor, verifique seu inventário.",
    NO_CLOAK_REEQUIP = "Nenhum manto original para re-equipar.",

    -- Commands and Help
    HELP_COMMAND = "Comandos disponíveis:",
    HELP_OPTION_PANEL = " /ccu - Aciona o utilitário de manto.",
    HELP_WELCOME = " /ccu welcome - Ativa/desativa a mensagem de boas-vindas.",
    HELP_HELP = " /ccu help - Exibe esta mensagem de ajuda.",
    HELP_ICON = " /ccu icon on ou off - Mostrar/ocultar o ícone do minimapa.",
    UNKNOWN_COMMAND = "Comando desconhecido. Digite /ccu help para uma lista de comandos.",

    -- Cooldown and Combat
    CLOAK_ON_CD = "%s está em recarga: %s restantes.",
    NO_USABLE_CLOAK = "Nenhum manto de teletransporte utilizável encontrado ou todos estão em recarga.",
    COMBAT_ACTIVE = "Combate ativo. Por favor, tente novamente após sair do combate.",

    -- Settings
    WELCOME_MSG_ENABLED = "Mensagem de boas-vindas ativada.",
    WELCOME_MSG_DISABLED = "Mensagem de boas-vindas desativada.",

    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "Teletransporte em andamento.",
    PROCESS_STARTED = " processo iniciado.",
    HIDING_BUTTON = "Ocultando botão.",
    PROCESS_RESET = "Processo de uso do manto redefinido.",
    NO_CLOAK_EQUIPPED = "Nenhum manto equipado.",

    -- Minimap
    MINIMAP_ICON_SHOWN = "Ícone do minimapa visível.",
    MINIMAP_ICON_HIDDEN = "Ícone do minimapa oculto. Use /ccu icon on para mostrá-lo novamente.",
    MINIMAP_TOOLTIP_INTRO = "Mantenha seu fluxo de manto de teletransporte a um clique de distância.",

    -- Button Text
    BUTTON_TEXT = "Teletransporte",
    BUTTON_TOOLTIP = "Clique para usar o manto de teletransporte",
}