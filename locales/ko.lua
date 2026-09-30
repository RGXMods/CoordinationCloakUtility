-- Korean Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- Korean
CCU.Locale["koKR"] = {
    -- Welcome and Version
    WELCOME_MSG = "환영합니다! 명령어는 /ccu help를 사용하세요.",
    VERSION = "버전: ",

    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "원래 망토 저장됨: ",
    CLOAK_EQUIPPED = " 착용됨. 버튼을 클릭하여 사용하세요.",
    CLOAK_ALREADY_EQUIPPED = "망토가 이미 착용되었습니다. 사용할 준비가 되었습니다.",
    CLOAK_UNEQUIPPED = "순간이동 망토 착용 해제됨.",

    -- Equip Status
    FAILED_EQUIP = "망토 착용에 실패했습니다. 다시 시도 중...",
    SUCCESS_EQUIP = "재시도 후 망토 착용에 성공했습니다.",
    FINAL_FAILED_EQUIP = "재시도 후 망토 착용에 실패했습니다. 수동으로 시도하십시오.",

    -- Re-equip Messages
    REEQUIP_CLOAK = "원래 망토를 다시 착용 중: ",
    REEQUIP_SUCCESS = "원래 망토를 성공적으로 다시 착용했습니다: ",
    REEQUIP_FAILED = "시간 초과 내에 원래 망토를 다시 착용하지 못했습니다. 인벤토리를 확인하십시오.",
    NO_CLOAK_REEQUIP = "다시 착용할 원래 망토가 없습니다.",

    -- Commands and Help
    HELP_COMMAND = "사용 가능한 명령어:",
    HELP_OPTION_PANEL = " /ccu - 망토 유틸리티를 실행합니다.",
    HELP_WELCOME = " /ccu welcome - 환영 메시지를 켜거나 끕니다.",
    HELP_HELP = " /ccu help - 이 도움말 메시지를 표시합니다.",
    HELP_ICON = " /ccu icon on 또는 off - 미니맵 아이콘 표시/숨기기.",
    UNKNOWN_COMMAND = "알 수 없는 명령어입니다. 명령어 목록은 /ccu help를 입력하세요.",

    -- Cooldown and Combat
    CLOAK_ON_CD = "%s 재사용 대기 중: %s 남음.",
    NO_USABLE_CLOAK = "사용 가능한 순간이동 망토를 찾을 수 없거나 모두 재사용 대기 중입니다.",
    COMBAT_ACTIVE = "전투 중입니다. 전투를 마친 후 다시 시도하십시오.",

    -- Settings
    WELCOME_MSG_ENABLED = "환영 메시지 활성화됨.",
    WELCOME_MSG_DISABLED = "환영 메시지 비활성화됨.",

    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "순간이동 진행 중.",
    PROCESS_STARTED = " 프로세스가 시작되었습니다.",
    HIDING_BUTTON = "버튼 숨기는 중.",
    PROCESS_RESET = "망토 사용 프로세스 재설정됨.",
    NO_CLOAK_EQUIPPED = "착용한 망토가 없습니다.",

    -- Minimap
    MINIMAP_ICON_SHOWN = "미니맵 아이콘이 표시되었습니다.",
    MINIMAP_ICON_HIDDEN = "미니맵 아이콘이 숨겨졌습니다. 다시 표시하려면 /ccu icon on을 사용하세요.",
    MINIMAP_TOOLTIP_INTRO = "순간이동 망토 흐름을 클릭 한 번으로 유지하세요.",

    -- Button Text
    BUTTON_TEXT = "순간이동",
    BUTTON_TOOLTIP = "순간이동 망토를 사용하려면 클릭하세요",
}