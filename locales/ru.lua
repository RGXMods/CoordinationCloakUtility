-- Russian Localization for CCU
local _, CCU = ...

CCU.Locale = CCU.Locale or {}

-- Russian
CCU.Locale["ruRU"] = {
    -- Welcome and Version
    WELCOME_MSG = "Добро пожаловать! Используйте /ccu help для списка команд.",
    VERSION = "Версия: ",

    -- Cloak Management
    ORIGINAL_CLOAK_SAVED = "Оригинальный плащ сохранен: ",
    CLOAK_EQUIPPED = " экипирован. Нажмите кнопку, чтобы использовать.",
    CLOAK_ALREADY_EQUIPPED = "Плащ уже экипирован. Готов к использованию.",
    CLOAK_UNEQUIPPED = "Плащ телепортации снят.",

    -- Equip Status
    FAILED_EQUIP = "Не удалось экипировать плащ. Повторная попытка...",
    SUCCESS_EQUIP = "Плащ успешно экипирован после повторной попытки.",
    FINAL_FAILED_EQUIP = "Не удалось экипировать плащ после повторной попытки. Пожалуйста, попробуйте вручную.",

    -- Re-equip Messages
    REEQUIP_CLOAK = "Переэкипировка оригинального плаща: ",
    REEQUIP_SUCCESS = "Оригинальный плащ успешно переэкипирован: ",
    REEQUIP_FAILED = "Не удалось переэкипировать оригинальный плащ в течение тайм-аута. Пожалуйста, проверьте свой инвентарь.",
    NO_CLOAK_REEQUIP = "Нет оригинального плаща для переэкипировки.",

    -- Commands and Help
    HELP_COMMAND = "Доступные команды:",
    HELP_OPTION_PANEL = " /ccu - Активировать утилиту плаща.",
    HELP_WELCOME = " /ccu welcome - Включить/выключить приветственное сообщение.",
    HELP_HELP = " /ccu help - Показать это справочное сообщение.",
    HELP_ICON = " /ccu icon on или off - Показать/скрыть значок у миникарты.",
    UNKNOWN_COMMAND = "Неизвестная команда. Введите /ccu help для списка команд.",

    -- Cooldown and Combat
    CLOAK_ON_CD = "%s на перезарядке: %s осталось.",
    NO_USABLE_CLOAK = "Нет доступных плащей телепортации или все они на перезарядке.",
    COMBAT_ACTIVE = "Бой активен. Пожалуйста, попробуйте еще раз после выхода из боя.",

    -- Settings
    WELCOME_MSG_ENABLED = "Приветственное сообщение включено.",
    WELCOME_MSG_DISABLED = "Приветственное сообщение отключено.",

    -- Process Messages
    TELEPORTATION_IN_PROGRESS = "Телепортация в процессе.",
    PROCESS_STARTED = " процесс запущен.",
    HIDING_BUTTON = "Скрытие кнопки.",
    PROCESS_RESET = "Процесс использования плаща сброшен.",
    NO_CLOAK_EQUIPPED = "Плащ не экипирован.",

    -- Minimap
    MINIMAP_ICON_SHOWN = "Значок у миникарты показан.",
    MINIMAP_ICON_HIDDEN = "Значок у миникарты скрыт. Используйте /ccu icon on, чтобы снова показать его.",
    MINIMAP_TOOLTIP_INTRO = "Держите процесс телепортации плаща в одном клике.",

    -- Button Text
    BUTTON_TEXT = "Телепорт",
    BUTTON_TOOLTIP = "Нажмите, чтобы использовать плащ телепортации",
}