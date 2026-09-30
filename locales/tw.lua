-- Chinese (Traditional) Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- Chinese (Traditional)
CCU.Locale["zhTW"] = {
    -- Welcome and Version
    WELCOME_MSG = "歡迎！使用 /ccu help 查看指令。",
    VERSION = "版本：",

    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "已儲存原始披風：",
    CLOAK_EQUIPPED = " 已裝備。點擊按鈕使用。",
    CLOAK_ALREADY_EQUIPPED = "披風已裝備。準備就緒。",
    CLOAK_UNEQUIPPED = "傳送披風已卸下。",

    -- Equip Status
    FAILED_EQUIP = "裝備披風失敗。正在重試...",
    SUCCESS_EQUIP = "重試後成功裝備披風。",
    FINAL_FAILED_EQUIP = "重試後裝備披風失敗。請手動嘗試。",

    -- Re-equip Messages
    REEQUIP_CLOAK = "正在重新裝備原始披風：",
    REEQUIP_SUCCESS = "成功重新裝備原始披風：",
    REEQUIP_FAILED = "在超時內未能重新裝備原始披風。請檢查您的庫存。",
    NO_CLOAK_REEQUIP = "沒有要重新裝備的原始披風。",

    -- Commands and Help
    HELP_COMMAND = "可用指令：",
    HELP_OPTION_PANEL = " /ccu - 觸發披風實用程式。",
    HELP_WELCOME = " /ccu welcome - 切換歡迎訊息的開/關。",
    HELP_HELP = " /ccu help - 顯示此說明訊息。",
    HELP_ICON = " /ccu icon on 或 off - 顯示/隱藏小地圖圖示。",
    UNKNOWN_COMMAND = "未知指令。輸入 /ccu help 查看指令列表。",

    -- Cooldown and Combat
    CLOAK_ON_CD = "%s 正在冷卻中：%s 剩餘。",
    NO_USABLE_CLOAK = "未找到可用的傳送披風或所有披風都在冷卻中。",
    COMBAT_ACTIVE = "戰鬥中。請在離開戰鬥後重試。",

    -- Settings
    WELCOME_MSG_ENABLED = "歡迎訊息已啟用。",
    WELCOME_MSG_DISABLED = "歡迎訊息已禁用。",

    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "傳送正在進行中。",
    PROCESS_STARTED = " 程序已開始。",
    HIDING_BUTTON = "正在隱藏按鈕。",
    PROCESS_RESET = "披風使用過程已重設。",
    NO_CLOAK_EQUIPPED = "未裝備披風。",

    -- Minimap
    MINIMAP_ICON_SHOWN = "小地圖圖示已顯示。",
    MINIMAP_ICON_HIDDEN = "小地圖圖示已隱藏。使用 /ccu icon on 重新顯示。",
    MINIMAP_TOOLTIP_INTRO = "讓傳送披風一鍵即用。",

    -- Button Text
    BUTTON_TEXT = "傳送",
    BUTTON_TOOLTIP = "點擊使用傳送披風",
}