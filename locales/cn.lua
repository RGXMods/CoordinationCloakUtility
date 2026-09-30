-- Chinese (Simplified) Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- Chinese (Simplified)
CCU.Locale["zhCN"] = {
    -- Welcome and Version
    WELCOME_MSG = "欢迎！使用 /ccu help 查看命令。",
    VERSION = "版本：",

    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "已保存原始披风：",
    CLOAK_EQUIPPED = " 已装备。点击按钮使用。",
    CLOAK_ALREADY_EQUIPPED = "披风已装备。准备就绪。",
    CLOAK_UNEQUIPPED = "传送披风已卸下。",

    -- Equip Status
    FAILED_EQUIP = "装备披风失败。正在重试...",
    SUCCESS_EQUIP = "重试后成功装备披风。",
    FINAL_FAILED_EQUIP = "重试后装备披风失败。请手动尝试。",

    -- Re-equip Messages
    REEQUIP_CLOAK = "正在重新装备原始披风：",
    REEQUIP_SUCCESS = "成功重新装备原始披风：",
    REEQUIP_FAILED = "在超时内未能重新装备原始披风。请检查您的库存。",
    NO_CLOAK_REEQUIP = "没有要重新装备的原始披风。",

    -- Commands and Help
    HELP_COMMAND = "可用命令：",
    HELP_OPTION_PANEL = " /ccu - 触发披风实用程序。",
    HELP_WELCOME = " /ccu welcome - 切换欢迎信息的开/关。",
    HELP_HELP = " /ccu help - 显示此帮助信息。",
    HELP_ICON = " /ccu icon on 或 off - 显示/隐藏小地图图标。",
    UNKNOWN_COMMAND = "未知命令。输入 /ccu help 查看命令列表。",

    -- Cooldown and Combat
    CLOAK_ON_CD = "%s 正在冷却中：%s 剩余。",
    NO_USABLE_CLOAK = "未找到可用的传送披风或所有披风都在冷却中。",
    COMBAT_ACTIVE = "战斗中。请在离开战斗后重试。",

    -- Settings
    WELCOME_MSG_ENABLED = "欢迎信息已启用。",
    WELCOME_MSG_DISABLED = "欢迎信息已禁用。",

    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "传送正在进行中。",
    PROCESS_STARTED = " 进程已开始。",
    HIDING_BUTTON = "正在隐藏按钮。",
    PROCESS_RESET = "披风使用过程已重置。",
    NO_CLOAK_EQUIPPED = "未装备披风。",

    -- Minimap
    MINIMAP_ICON_SHOWN = "小地图图标已显示。",
    MINIMAP_ICON_HIDDEN = "小地图图标已隐藏。使用 /ccu icon on 重新显示。",
    MINIMAP_TOOLTIP_INTRO = "让传送披风一键即用。",

    -- Button Text
    BUTTON_TEXT = "传送",
    BUTTON_TOOLTIP = "点击使用传送披风",
}