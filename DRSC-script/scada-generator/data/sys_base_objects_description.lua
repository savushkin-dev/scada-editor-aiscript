-- Шаблон файла, описывающего базовую функциональность.
-- В этом файле описан один пустой базовый объект, для примера.

-- Базовый объект (название таблицы - eplanName т.е LUA-имя объекта, пишется в любых регистрах):
-- 1. s88Level - уровень объекта по ISA-88 (1 - для юнитов, аппаратов. 2 - для агрегатов).
-- 2. name - русскоязычное название объекта.
-- 3. baseOperations - описание базовых операций объекта.
-- 4. basicName - англоязычное имя объекта, которое фигурирует в функциональности (add_functionality).
-- Это имя должно содержать имя без приписки "basic_"
-- 5. equipment - оборудование базового объекта.
-- 6. aggregateParameters - параметры объекта, который является агрегатом (которые будут добавлены
-- в аппарат, при привязке агрегата к аппарату).
-- 7. bindingName - имя агрегата, используемое при привязке его к аппарату (для аппаратов не обязательно).
-- 8. isPID - является ли объект ПИД-регулятором.
-- 9. objectGroups - группы объектов (танки, линии и др).
-- 10. system_params - системные параметры объекта.
-- 11. parameters - указываются параметры объекта (float_runtime и float). Можно указать в виде ссылки на другую переменную,
-- которая представляет параметр, или же описать самому в виде lua-таблицы. При описании в виде
-- ссылки на переменную, параметры будут идти по порядку (по индексам), а если описывать через
-- Lua-таблицы, то по ключу Lua-таблицы. Предпочтительный первый вариант, он описан ниже по файлу,
-- а именно, там где определена переменная object_float_parameters. Указываются float параметры в таблице float, или float runtime
-- в таблица float_runtime.
-- 12. luaModuleName - имя модуля Lua, в котором описана логика работы базового объекта. Обычно описана
-- в скриптах, которые идут в поставке вместе с этим файлом. На основании этого имени в prg.lua
-- будет генерироваться заголовок подключаемого модуля - require( "luaModuleName").
-- Пустое или отсутствующее значение - модуль не будет подключен.
-- 13. monitorName - имя объекта Monitor, которое будет задаваться при автоматической настройке объекта
-- при его добавлении в дерево. Если не задано - будет задаваться стандартное значение - TankObj.
-- 14. baseProperties - базовые (дополнительные) свойства объекта. Добавляются также, как и параметры
-- базовой операции. Полная доступность active и bool параметров.
-- 15. deprecated - устарел объект или нет. Если устарел - не будет показан в списке базовых объектов,
-- но его можно использовать в уже существующих проектах, где такие объекты используются. Для этого
-- надо добавлять его через Insert в группе объектов.
-- 16. denyBindingToUnit - указывает, запрещена ли привязки агрегата к аппарату (юниту). По-умолчанию разрешена (false).

-- Базовые операции (baseOperations) (название таблицы - это Lua-имя операции, пишется в верхнем регистре):
-- 1. name - русскоязычное название операции.
-- 2. params - параметры операции, могут быть активными, булевыми и вложенными (групповые).
-- 3. state - состояние базовой операции, в котором находятся шаги.
-- 4. defaultPosition - позиция операции при автоматической настройке, когда осуществляется вставка
-- объекта. Если поле отсутствует - операция не будет настраиваться автоматически.
-- Значения этого поля должны быть от 1 и не пересекаться (опционально).

-- Базовое состояние (state) - название таблицы, это LUA-имя состояния. Пока что это весь функционал
-- состояния. Внутри состояния указываются базовые шаги (steps).
-- Существующие состояния: RUN (Выполнение), PAUSE (Пауза), STOP (Остановка).
-- Если какое-то состояние не имеет базовой функциональности, его можно опустить и не записывать.

-- Базовые шаги - шаг базовой операции (steps). Название таблицы - LUA-имя базового шага, в верхнем регистре.
-- Внутри таблицы указываются следующие поля:
-- 1. name = строковое обозначение имени шага.
-- 2. defaultPosition - по аналогии с defaultPosition в базовой операции, только относится
-- к базовому шагу (опционально).

-- Активные параметры (active) - параметры, которые отображаются и сохраняются, имеют общую обработку,
-- которая характерна для всех таких параметров (название таблицы - это Lua-имя параметра,
-- пишется в верхнем регистре):
-- 1. luaName - LUA-название (Пишется в верхнем регистре. Может записываться как ключ таблицы, так и в свойство, если нужен определенный порядок)
-- 2. name - русскоязычное имя параметра.
-- 3. defaultValue - значение по-умолчанию (опционально).
-- 4. displayObjects - список параметров, указывающий, что будет отображаться в окне
-- графической настройки параметра (окно "Устройства"), при настройке параметра.
-- Таблица displayObjects может отсутствовать.
-- Допустимые свойства: signals - будут добавлены сигналы AO, AI, DO, DI;
-- parameters - будут добавлены все параметры объекта.
-- Пример: displayObjects = { "signals", "parameters" } - будут добавлены сигналы и параметры.

-- Булевые параметры (bool) - аналог активных параметров, только имеют два значения - да или нет
-- (название таблицы - это Lua-имя параметра, пишется в верхнем регистре):
-- 1. luaName - LUA-название (Пишется в верхнем регистре. Может записываться как ключ таблицы, так и в свойство, если нужен определенный порядок)
-- 2. name - русскоязычное имя параметра.
-- 3. defaultValue - значение по-умолчанию.

-- Групповые параметры (group) - для создания иерархии параметров.
-- 1. luaName - LUA-название (Пишется в верхнем регистре. Может записываться как ключ таблицы, так и в свойство, если нужен определенный порядок)
-- 2. name - отображаемое название
-- 3. main - основной параметр (если true, то параметр регулирует вложенность и сохраняется в файлы)
-- 4. ignoreCompoundName - игнорировать композитное имя (по-умолчанию false: имя родительского параметра переходит в часть имени вложенного параметра)
-- 5. active/bool/group - вложенные параметры

-- Главный параметр агрегата (main) - аналог булевого параметра. Является главным управляющим
-- параметром агрегата (управляет доступностью параметров). Имеет только два значения - да или нет
-- (название таблицы - это Lua-имя параметра, пишется в верхнем регистре):
-- 1. name - русскоязычное имя параметра.
-- 2. defaultValue - значение по-умолчанию.

-- Параметр оборудования (equipment) - параметр для оборудования. Обработка схожая с действиями
-- в шагах операции. Этот тип параметра создается, когда заполняется equipment в объекте.
-- Создается таблице equipment. Имеет общую обработку,которая характерна для
-- всех таких параметров (название таблицы - это Lua-имя параметра,
-- пишется в верхнем регистре):
-- 1. name - русскоязычное имя параметра.
-- 2. defaultValue - значение по-умолчанию (опционально).

-- Группы объектов (objectGroups) - группы объектов (в основном для линий). Внутри этой переменной
-- указываются группы объектов, которые нужны в объекте.
-- Название таблицы - Lua-имя группы, пишется в любом регистре:
-- 1. name - русскоязычное название группы.
-- 2. allowedObjects - указывается один из доступных типов объекта в виде строки (units, aggregates, all).
-- Стандартное значение - aggregates, оно будет использоваться, если не указать это поле.

-- Оборудование - параметр оборудования.
-- Параметры объекта, как агрегата - по аналогии с активными и булевскими параметрами и
-- главным параметром агрегата, он является обязательным для агрегата. main-параметр задается только один!

-- Системные параметры объекта (systemParams) - системные параметры объекта, которые используются
-- в контроллере. Доступны только для чтения, можно менять только значение.
-- Индекс таблицы - указывает его номер в списке параметров.
-- 1. name - русскоязычное название параметра
-- 2. meter - единица измерения параметра
-- 3. defaultValue - стандартное значение параметра
-- 4. nameLua - LUA-имя параметра

base_tech_objects = function()
    local object_float_parameters = get_objects_float_parameters()
    local object_float_runtime_parameters = get_runtime_float_parameters()
    return
    {
        automat = {
            name = "Автомат",
            s88Level = 2,
            basicName = "automat",
            bindingName = "automat",
            luaModuleName = "automat",
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            DI_CIP_FREE =
                            {
                                name = "МСА свободна DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            MEDIUM_CHANGE_REQUEST =
                            {
                                name = "Запрос смены среды DI",
                                displayObjects = { "signals" },
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 3,
                                },
                                MEDIUM_CHANGE = { name = "Смена среды" },
                                OBJECT_EMPTY = { name = "Объект опорожнен" },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
            },
        },
        _tank = {
            name = "Бачок откачки",
            s88Level = 2,
            basicName = "ice_water_pump_tank",
            bindingName = "ice_water_pump_tank",
            luaModuleName = "cooler",
            denyBindingToUnit = true,
            baseOperations =
            {
                COOLING = {
                    name = "Охлаждение",
                    params =
                    {
                        bool =
                        {
                            ACTIVE_WORKING = { name = "Активная работа", defaultValue = "false" },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING_HI_LS = {
                                    name = "Ожидание появления ВУ",
                                    defaultPosition = 1,
                                },
                                WAITING_LOW_LS = {
                                    name = "Ожидание пропадания НУ",
                                    defaultPosition = 2,
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
            },
            equipment =
            {
                M1 = { name = "Насос", defaultValue = "M1" },
                LS_up = { name = "Датчик верхнего уровня", defaultValue = "LS2" },
                LS_down = { name = "Датчик нижнего уровня", defaultValue = "LS1" },
                LT = { name = "Датчик текущего уровня", defaultValue = "LT1" },
                UPPER_SET_VALUE = { name = "Верхний предел текущего уровня" },
                LOWER_SET_VALUE = { name = "Нижний предел текущего уровня" },
            },
            aggregateParameters =
            {
                main =
                {
                    NEED_ICE_WATER_PUMP_TANK = { name = "Использовать бачок откачки", defaultValue = "false" },
                },
                bool =
                {
                    NEED_PAUSE_ICE_WATER_PUMP_TANK = { name = "Пауза при аварии бачка откачки", defaultValue = "true" },
                },
            },
        },
        _tank_PID = {
            name = "Бачок откачки лёдводы ПИД",
            s88Level = 2,
            baseOperations =
            {
                COOLING = {
                    name = "Охлаждение",
                    params =
                    {
                        bool =
                        {
                            ACTIVE_WORKING = { name = "Активная работа", defaultValue = "false" },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING_HI_LS = {
                                    name = "Ожидание появления ВУ",
                                    defaultPosition = 1,
                                },
                                WAITING_LOW_LS = {
                                    name = "Ожидание пропадания НУ",
                                    defaultPosition = 2,
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
            },
            basicName = "ice_water_pump_tank_PID",
            equipment =
            {
                M1 = { name = "Насос", defaultValue = "M1" },
                LS_up = { name = "Датчик верхнего уровня", defaultValue = "LS2" },
                LS_down = { name = "Датчик нижнего уровня", defaultValue = "LS1" },
                LT = { name = "Датчик текущего уровня", defaultValue = "LT1" },
                SET_VALUE = { name = "Задание"},
            },
            bindingName = "ice_water_pump_tank",
            isPID = true,
            systemParams =
            {
                [ 1 ] = {
                    name = "Параметр k",
                    defaultValue = 1,
                    nameLua = "P_k",
                },
                [ 2 ] = {
                    name = "Параметр Ti",
                    defaultValue = 15,
                    nameLua = "P_Ti",
                },
                [ 3 ] = {
                    name = "Параметр Td",
                    defaultValue = 0.01,
                    nameLua = "P_Td",
                },
                [ 4 ] = {
                    name = "Интервал расчёта",
                    meter = "мс",
                    defaultValue = 1000,
                    nameLua = "P_dt",
                },
                [ 5 ] = {
                    name = "Максимальное значение входной величины",
                    meter = "%",
                    defaultValue = 100,
                    nameLua = "P_max",
                },
                [ 6 ] = {
                    name = "Минимальное значение входной величины",
                    meter = "%",
                    defaultValue = 0,
                    nameLua = "P_min",
                },
                [ 7 ] = {
                    name = "Время выхода на режим регулирования",
                    meter = "с",
                    defaultValue = 30,
                    nameLua = "P_acceleration_time",
                },
                [ 8 ] = {
                    name = "Ручной режим",
                    meter = "№ режима",
                    defaultValue = 0, -- Ручной режим, 0 - авто, 1 - ручной
                    nameLua = "P_is_manual_mode",
                },
                [ 9 ] = {
                    name = "Заданное ручное значение выходного сигнала",
                    meter = "%",
                    defaultValue = 65,
                    nameLua = "P_U_manual",
                },
                [ 10 ] = {
                    name = "Параметр k2",
                    defaultValue = 0,
                    nameLua = "P_k2",
                },
                [ 11 ] = {
                    name = "Параметр Ti2",
                    defaultValue = 0,
                    nameLua = "P_Ti2",
                },
                [ 12 ] = {
                    name = "Параметр Td2",
                    defaultValue = 0,
                    nameLua = "P_Td2",
                },
                [ 13 ] = {
                    name = "Максимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 100,
                    nameLua = "P_out_max",
                },
                [ 14 ] = {
                    name = "Минимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 0,
                    nameLua = "P_out_min",
                },
            },
            luaModuleName = "cooler",
            deprecated = true,
        },
        boiler_PID = {
            name = "Бойлер ПИД",
            s88Level = 2,
            baseOperations =
            {
                HEATING = {
                    name = "Нагрев",
                    params =
                    {
                        active =
                        {
                            AUTO_DI =
                            {
                                name = "Сигнал автоматического включения/выключения",
                                displayObjects = { "signals" },
                            },
                            MAX_TEMPERATURE =
                            {
                                name = "Температура нагрева",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING_LOW_LS = {
                                    name = "Ожидание пропадания нижнего уровня",
                                    defaultPosition = 1,
                                },
                                WATER_2_LOW_LS = {
                                    name = "Наполнение до нижнего уровня",
                                    defaultPosition = 2,
                                },
                                WATER_2_HI_LS = {
                                    name = "Наполнение до верхнего уровня",
                                    defaultPosition = 3,
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
            },
            basicName = "boiler_PID",
            aggregateParameters =
            {
                active =
                {
                    HEATING_WATER_TEMPERATURE =
                    {
                        name = "Температура нагревания воды",
                        displayObjects = { "parameters" },
                    },
                },
                bool =
                {
                    NEED_PAUSE_BOILER = { name = "Пауза при аварии бойлера", defaultValue = "true" },
                },
                main =
                {
                    NEED_BOILER = { name = "Использовать бойлер", defaultValue = "false" },
                },
            },
            bindingName = "boiler",
            equipment =
            {
                LS_up = { name = "Датчик верхнего уровня", defaultValue = "LS2" },
                LS_down = { name = "Датчик нижнего уровня", defaultValue = "LS1" },
                VC1 = { name = "Регулирующий клапан пара", defaultValue = "VC1" },
                valve = { name = "Клапан подпитки воды", defaultValue = "V1" },
                TE = { name = "Датчик температуры", defaultValue = "TE1" },
                M1 = { name = "Насос воды", defaultValue = "M1" },
                steam_valve = { name = "Запорный клапан пара", defaultValue = "V2" },
            },
            isPID = true,
            systemParams =
            {
                [ 1 ] = {
                    name = "Параметр k",
                    defaultValue = 1,
                    nameLua = "P_k",
                },
                [ 2 ] = {
                    name = "Параметр Ti",
                    defaultValue = 15,
                    nameLua = "P_Ti",
                },
                [ 3 ] = {
                    name = "Параметр Td",
                    defaultValue = 0.01,
                    nameLua = "P_Td",
                },
                [ 4 ] = {
                    name = "Интервал расчёта",
                    meter = "мс",
                    defaultValue = 1000,
                    nameLua = "P_dt",
                },
                [ 5 ] = {
                    name = "Максимальное значение входной величины",
                    meter = "%",
                    defaultValue = 100,
                    nameLua = "P_max",
                },
                [ 6 ] = {
                    name = "Минимальное значение входной величины",
                    meter = "%",
                    defaultValue = 0,
                    nameLua = "P_min",
                },
                [ 7 ] = {
                    name = "Время выхода на режим регулирования",
                    meter = "с",
                    defaultValue = 30,
                    nameLua = "P_acceleration_time",
                },
                [ 8 ] = {
                    name = "Ручной режим",
                    meter = "№ режима",
                    defaultValue = 0, -- Ручной режим, 0 - авто, 1 - ручной
                    nameLua = "P_is_manual_mode",
                },
                [ 9 ] = {
                    name = "Заданное ручное значение выходного сигнала",
                    meter = "%",
                    defaultValue = 65,
                    nameLua = "P_U_manual",
                },
                [ 10 ] = {
                    name = "Максимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 100,
                    nameLua = "P_out_max",
                },
                [ 11 ] = {
                    name = "Минимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 0,
                    nameLua = "P_out_min",
                },
            },
            luaModuleName = "boiler",
            deprecated = true,
        },
        boiler = {
            name = "Бойлер",
            s88Level = 2,
            basicName = "boiler",
            bindingName = "boiler",
            luaModuleName = "boiler",
            denyBindingToUnit = true,
            baseOperations =
            {
                HEATING = {
                    name = "Нагрев",
                    params =
                    {
                        active =
                        {
                            AUTO_DI =
                            {
                                name = "Сигнал автоматического включения/выключения",
                                displayObjects = { "signals" },
                            },
                            MAX_TEMPERATURE =
                            {
                                name = "Температура нагрева",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING_LOW_LS = {
                                    name = "Ожидание пропадания нижнего уровня",
                                    defaultPosition = 1,
                                },
                                WATER_2_LOW_LS = {
                                    name = "Наполнение до нижнего уровня",
                                    defaultPosition = 2,
                                },
                                WATER_2_HI_LS = {
                                    name = "Наполнение до верхнего уровня",
                                    defaultPosition = 3,
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
            },
            aggregateParameters =
            {
                active =
                {
                    HEATING_WATER_TEMPERATURE =
                    {
                        name = "Температура нагревания воды",
                        displayObjects = { "parameters" },
                    },
                },
                bool =
                {
                    NEED_PAUSE_BOILER = { name = "Пауза при аварии бойлера", defaultValue = "true" },
                },
                main =
                {
                    NEED_BOILER = { name = "Использовать бойлер", defaultValue = "false" },
                },
            },
            equipment =
            {
                LS_up = { name = "Датчик верхнего уровня", defaultValue = "LS2" },
                LS_down = { name = "Датчик нижнего уровня", defaultValue = "LS1" },
                valve = { name = "Клапан подпитки воды", defaultValue = "V1" },
                TE = { name = "Датчик температуры", defaultValue = "TE1" },
                M1 = { name = "Насос воды", defaultValue = "M1" },
                steam_valve = { name = "Запорный клапан пара", defaultValue = "V2" },
            },
        },
        master = {
            name = "Ячейка процесса",
            s88Level = 0, -- Не относится к s88Level, находится выше 1 уровня.
            basicName = "master",
            bindingName = "master",
            systemParams =
            {
                [ 1 ] = {
                    name = "Интервал промывки седел клапанов",
                    meter = "с",
                    defaultValue = 180,
                    nameLua = "P_MIX_FLIP_PERIOD",
                },
                [ 2 ] = {
                    name = "Время промывки верхних седел клапанов",
                    meter = "мс",
                    defaultValue = 2000,
                    nameLua = "P_MIX_FLIP_UPPER_TIME",
                },
                [ 3 ] = {
                    name = "Время промывки нижних седел клапанов",
                    meter = "мс",
                    defaultValue = 1000,
                    nameLua = "P_MIX_FLIP_LOWER_TIME",
                },
                [ 4 ] = {
                    name = "Время задержки закрытия клапанов",
                    meter = "мс",
                    defaultValue = 1000,
                    nameLua = "P_V_OFF_DELAY_TIME",
                },
                [ 5 ] = {
                    name = "Время задержки закрытия донных клапанов",
                    meter = "мс",
                    defaultValue = 1200,
                    nameLua = "P_V_BOTTOM_OFF_DELAY_TIME",
                },
                [ 6 ] = {
                    name = "Среднее время задержки получения ответа от узла I/O",
                    meter = "мс",
                    defaultValue = 50,
                    nameLua = "P_WAGO_TCP_NODE_WARN_ANSWER_AVG_TIME",
                },
                [ 7 ] = {
                    name = "Среднее время цикла программы",
                    meter = "мс",
                    defaultValue = 300,
                    nameLua = "P_MAIN_CYCLE_WARN_ANSWER_AVG_TIME",
                },
                [ 8 ] = {
                    name = "Работа модуля ограничений",
                    meter = "№ режима",
                    defaultValue = 0,
                    -- 0 - авто, 1 - ручной, 2 - полуавтоматический (через
                    -- время @P_RESTRICTIONS_MANUAL_TIME вернется в
                    -- автоматический режим).
                    nameLua = "P_RESTRICTIONS_MODE",
                },
                [ 9 ] = {
                    name = "Работа модуля ограничений в ручном режиме заданное время",
                    meter = "мс",
                    defaultValue = 120000, -- 2 * 60 * 1000 мс
                    nameLua = "P_RESTRICTIONS_MANUAL_TIME",
                },
                [ 10 ] = {
                    name = "Переход на паузу операции при ошибке устройств",
                    meter = "(0 - авто, 1 - ручной)",
                    defaultValue = 0, -- 0 - авто (есть), 1 - ручной (нет).
                    nameLua = "P_AUTO_PAUSE_OPER_ON_DEV_ERR",
                },
            },
            luaModuleName = "master",
        },
        line = {
            name = "Линия",
            s88Level = 2,
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                            DES_SIGNAL =
                            {
                                name = "Дезинфекция активна DI",
                                displayObjects = { "signals" },
                            },
                            INCORRECT_CIP =
                            {
                                name = "Некорректная мойка DI",
                                displayObjects = { "signals" },
                            },
                        },
                        bool =
                            {
                            IGNORE_WATER_FLAG = { name = "Игнорировать наличие продукта", defaultValue = "false" },
                            },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 2,
                                },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                FILL = {
                    name = "Наполнение",
                    params =
                    {
                        active =
                        {
                            TOTAL_VOLUME_AI =
                            {
                                name = "Объем линии",
                                displayObjects = { "signals" },
                            },
                            clean_water_DI =
                            {
                                name = "В дренаж DI",
                                displayObjects = { "signals" },
                            },
                            key_lamp =
                            {
                                name = "Диод",
                                displayObjects = { "signals" },
                            },
                            product_DI =
                            {
                                name = "В приемник DI",
                                displayObjects = { "signals" },
                            },
                            source_ready =
                            {
                                name = "Источник готов DI",
                                displayObjects = { "signals" },
                            },
                        },
                        bool =
                        {
                            IS_END_ON_FULL_TANK =
                            {
                                name = "Автоматическое выключение по наполнению крайнего танка",
                                defaultValue = "false",
                            },
                            CONTINUE_PRODUCT_PUSH =
                            {
                                name = "Продолжать проталкивание при появлении воды",
                                defaultValue = "false",
                            },
                            MOVE_TO_STEP_WAITING_BY_SIGNALS =
                            {
                                name = "При отсутствии сигналов переходить в ожидание",
                                defaultValue = "false",
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                IN_DRAINAGE = {
                                    name = "В дренаж",
                                    defaultPosition = 2,
                                },
                                IN_TANK = {
                                    name = "В приемник",
                                    defaultPosition = 3,
                                },
                                WAITING_KEY = {
                                    name = "Ожидание",
                                    defaultPosition = 1,
                                },
                                IN_LINE = {
                                    name = "В линию",
                                },
                                IN_LINE_FERMENTING = {
                                    name = "В линию заквасочной",
                                },
                                PRODUCT_PUSH = {
                                    name = "Проталкивание продукта",
                                }
                            },
                        },
                    },
                    defaultPosition = 2,
                },
                OUT = {
                    name = "Выдача",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                OUT_WATER = {
                                    name = "Проталкивание",
                                    defaultPosition = 2,
                                },
                                OUT_TANK = {
                                    name = "Из источника",
                                    defaultPosition = 3,
                                },
                                WAITING_KEY = {
                                    name = "Ожидание",
                                    defaultPosition = 1,
                                },
                            },
                        },
                    },
                    defaultPosition = 3,
                },
                WORK = {
                    name = "Работа",
                    params =
                    {
                        active =
                        {
                            AUTO_DI =
                            {
                                name = "Сигнал автоматического включения/выключения",
                                displayObjects = { "signals" },
                            },
                        }
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING = { name = "Ожидание" },
                                OUT_WATER = { name = "Проталкивание" },
                                OUT_TANK = { name = "Из источника" },
                                IN_TANK = { name = "В приемник" },
                                IN_DRAINAGE = { name = "В дренаж" },
                            },
                        },
                    },
                },
            },
            basicName = "line",
            equipment =
            {
                product_CTR = { name = "Счетчик", defaultValue = "FQT1" },
                QT = { name = "Концентратомер", defaultValue = "QT1" },
            },
            bindingName = "line",
            objectGroups =
            {
                tanks = { name = "Группа танков", allowedObjects = "units" },
            },
            luaModuleName = "line",
        },
        line_in = {
            name = "Линия наполнения",
            s88Level = 2,
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                            DES_SIGNAL =
                            {
                                name = "Дезинфекция активна DI",
                                displayObjects = { "signals" },
                            },
                            INCORRECT_CIP =
                            {
                                name = "Некорректная мойка DI",
                                displayObjects = { "signals" },
                            },
                        },
                        bool =
                        {
                            IGNORE_WATER_FLAG = { name = "Игнорировать наличие продукта", defaultValue = "false" },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE =
                                {
                                    name = "Дренаж",
                                    defaultPosition = 2,
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                FILL = {
                    name = "Наполнение",
                    params =
                    {
                        active =
                        {
                            CONCENTRATION =
                            {
                                name = "Концентрация продукта",
                                displayObjects = { "parameters" },
                            },
                            DELTA_CONCENTRATION =
                            {
                                name = "Дельта концентрации продукта",
                                displayObjects = { "parameters" },
                            },
                            TOTAL_VOLUME_AI =
                            {
                                name = "Объем линии",
                                displayObjects = { "signals" },
                            },
                            MIN_FLOW =
                            {
                                name = "Минимальный расход для завершения наполнения",
                                displayObjects = { "parameters" },
                            },
                            NO_FLOW_TIME =
                            {
                                name = "Время отсутствия расхода для завершения наполнения",
                                displayObjects = { "parameters" },
                            },
                            post_clean_water_DI =
                            {
                                name = "Проталкивание поста идет DI",
                                displayObjects = { "signals" },
                            },
                            clean_water_DI =
                            {
                                name = "В дренаж DI",
                                displayObjects = { "signals" },
                            },
                            product_DI =
                            {
                                name = "В приемник DI",
                                displayObjects = { "signals" },
                            },
                            source_ready =
                            {
                                name = "Источник готов DI",
                                displayObjects = { "signals" },
                            },
                            white_water_DI =
                            {
                                name = "В танк ополосок DI",
                                displayObjects = { "signals" },
                            },
                            RINSE_CONCENTRATION =
                            {
                                name = "Концентрация ополосок",
                                displayObjects = { "parameters" },
                            },
                        },
                        bool =
                        {
                            IS_END_ON_FULL_TANK =
                            {
                                name = "Автоматическое выключение по наполнению крайнего танка",
                                defaultValue = "false",
                            },
                            CONTINUE_PRODUCT_PUSH =
                            {
                                name = "Продолжать проталкивание при появлении воды",
                                defaultValue = "false",
                            },
                            MOVE_TO_STEP_WAITING_BY_SIGNALS =
                            {
                                name = "При отсутствии сигналов переходить в ожидание",
                                defaultValue = "false",
                            },
                            NEED_PAUSE_AFTER_FULL_LAST_TANK =
                            {
                                name = "Пауза после наполнения крайнего танка в очереди",
                                defaultValue = "false",
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                IN_DRAINAGE = {
                                    name = "В дренаж",
                                    defaultPosition = 2,
                                },
                                IN_TANK = {
                                    name = "В приемник",
                                    defaultPosition = 3,
                                },
                                WAITING_KEY = {
                                    name = "Ожидание",
                                    defaultPosition = 1,
                                },
                                IN_LINE = {
                                    name = "В линию",
                                },
                                IN_LINE_FERMENTING = {
                                    name = "В линию заквасочной",
                                },
                                PRODUCT_PUSH = {
                                    name = "Проталкивание продукта",
                                },
                                IN_RINSE_TANK = {
                                    name = "В танк ополосок",
                                }
                            },
                        },
                    },
                    defaultPosition = 2,
                },
                WORK = {
                    name = "Работа",
                    params =
                    {
                        active =
                        {
                            AUTO_DI =
                            {
                                name = "Сигнал автоматического включения/выключения",
                                displayObjects = { "signals" },
                            },
                        }
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING = { name = "Ожидание" },
                                OUT_WATER = { name = "Проталкивание" },
                                OUT_TANK = { name = "Из источника" },
                                IN_TANK = { name = "В приемник" },
                                IN_DRAINAGE = { name = "В дренаж" },
                            },
                        },
                    },
                },
            },
            basicName = "line",
            equipment =
            {
                product_CTR = { name = "Счетчик", defaultValue = "FQT1" },
                QT = { name = "Концентратомер", defaultValue = "QT1" },
            },
            aggregateParameters = { },
            bindingName = "line_in",
            objectGroups =
            {
                tanks = { name = "Группа танков", allowedObjects = "units" },
            },
            luaModuleName = "line",
        },
        line_out = {
            name = "Линия выдачи",
            s88Level = 2,
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                            DES_SIGNAL =
                            {
                                name = "Дезинфекция активна DI",
                                displayObjects = { "signals" },
                            },
                            INCORRECT_CIP =
                            {
                                name = "Некорректная мойка DI",
                                displayObjects = { "signals" },
                            },
                        },
                        bool =
                        {
                            IGNORE_WATER_FLAG =
                            {
                                name = "Игнорировать наличие продукта",
                                defaultValue = "false"
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 2,
                                },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                OUT = {
                    name = "Выдача",
                    params =
                    {
                        group =
                        {
                            NEED_PAUSE_AFTER_EMPTY_LAST_TANK =
                            {
                                name = "Пауза после опустошения крайнего танка в очереди",
                                defaultValue = "false",
                                main = true,
                                ignoreCompoundName = true,
                                bool =
                                {
                                    WAITING_WATER_REQUEST =
                                    {
                                        name = "Ожидать запрос воды или добавление нового танка",
                                        defaultValue = "false",
                                    },
                                }
                            },
                        },
                        bool =
                        {
                            USE_VOLUME =
                            {
                                name = "Выдача линией заданного объема",
                                defaultValue = "false",
                            },
                            CONTINUE_WATER_PUSH =
                            {
                                name = "Продолжать проталкивание после прохождения заданного объёма",
                                defaultValue = "false",
                            },
                        },
                        active =
                        {
                            CONCENTRATION =
                            {
                                name = "Концентрация продукта",
                                displayObjects = { "parameters" },
                            },
                            DELTA_CONCENTRATION =
                            {
                                name = "Дельта концентрации продукта",
                                displayObjects = { "parameters" },
                            },
                            product_request =
                            {
                                name = "Запрос продукта от приемника DI",
                                displayObjects = { "signals" },
                            },
                            water_request =
                            {
                                name = "Запрос воды от приемника DI",
                                displayObjects = { "signals" },
                            },
                            product_DO =
                            {
                                name = "Продукт в трубе DO",
                                displayObjects = { "signals" },
                            },
                            water_DO =
                            {
                                name = "Вода в трубе DO",
                                displayObjects = { "signals" },
                            },
                            water_for_stabilization_request =
                            {
                                name = "Запрос воды для стабилизации",
                                displayObjects = { "signals" },
                            },
                        }
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                OUT_WATER = {
                                    name = "Проталкивание",
                                    defaultPosition = 2,
                                },
                                OUT_TANK = {
                                    name = "Из источника",
                                    defaultPosition = 3,
                                },
                                WAITING_KEY = {
                                    name = "Ожидание",
                                    defaultPosition = 1,
                                },
                                IN_DRAINAGE = {
                                    name = "В дренаж",
                                },
                                IN_DESTINATION = {
                                    name = "В приемник",
                                },
                                OUT_WATER_FOR_STABILIZATION = {
                                    name = "Выдача воды для производства",
                                },
                            },
                        },
                    },
                    defaultPosition = 2,
                },
                WORK = {
                    name = "Работа",
                    params =
                    {
                        active =
                        {
                            AUTO_DI =
                            {
                                name = "Сигнал автоматического включения/выключения",
                                displayObjects = { "signals" },
                            },
                        }
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING = { name = "Ожидание" },
                                OUT_WATER = { name = "Проталкивание" },
                                OUT_TANK = { name = "Из источника" },
                                IN_TANK = { name = "В приемник" },
                                IN_DRAINAGE = { name = "В дренаж" },
                            },
                        },
                    },
                },
            },
            basicName = "line",
            equipment =
            {
                product_CTR = { name = "Счетчик", defaultValue = "FQT1" },
                water_V = { name = "Клапан(-ы) подачи воды" },
                QT = { name = "Концентратомер", defaultValue = "QT1" },
            },
            bindingName = "line_out",
            objectGroups =
            {
                tanks = { name = "Группа танков", allowedObjects = "units" },
            },
            luaModuleName = "line",
        },
        line_pumping = {
            name = "Линия перекачки",
            s88Level = 2,
            baseOperations =
            {
                WASHING_CIP =
                {
                    name = "Мойка",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 6
                                },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                            DES_SIGNAL =
                            {
                                name = "Дезинфекция активна DI",
                                displayObjects = { "signals" },
                            },
                            INCORRECT_CIP =
                            {
                                name = "Некорректная мойка DI",
                                displayObjects = { "signals" },
                            },
                        },
                        bool =
                        {
                            IGNORE_WATER_FLAG =
                            {
                                name = "Игнорировать наличие продукта",
                                defaultValue = "false"
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                PUMPING =
                {
                    name = "Перекачивание",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING = {
                                    name = "Ожидание",
                                    defaultPosition = 1,
                                },
                                OUT_WATER = {
                                    name = "Проталкивание",
                                    defaultPosition = 2,
                                },
                                OUT_TANK = {
                                    name = "Из источника",
                                    defaultPosition = 3,
                                },
                                IN_DRAINAGE = {
                                    name = "В дренаж",
                                    defaultPosition = 4,
                                },
                                IN_TANK = {
                                    name = "В приемник",
                                    defaultPosition = 5,
                                },
                            },
                        },
                    },
                    params =
                    {
                        active =
                        {
                            SRC =
                            {
                                name = "Параметр источника",
                                displayObjects = { "parameters" },
                            },
                            DST =
                            {
                                name = "Параметр приемника",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                    defaultPosition = 2,
                },
            },
            basicName = "line",
            equipment =
            {
                product_CTR = { name = "Счетчик", defaultValue = "FQT1" },
            },
            bindingName = "line_pumping",
            objectGroups =
            {
                src_tanks = { name = "Источники", allowedObjects = "units" },
                dst_tanks = { name = "Приемники", allowedObjects = "units" },
            },
            luaModuleName = "line",
        },
        pasteurizator = {
            name = "Пастеризатор",
            s88Level = 2,
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            DI_CIP_FREE =
                            {
                                name = "МСА свободна DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            MEDIUM_CHANGE_REQUEST =
                            {
                                name = "Запрос смены среды DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                            DES_SIGNAL =
                            {
                                name = "Дезинфекция активна DI",
                                displayObjects = { "signals" },
                            },
                            INCORRECT_CIP =
                            {
                                name = "Некорректная мойка DI",
                                displayObjects = { "signals" },
                            },
                        },
                        bool =
                        {
                            IGNORE_WATER_FLAG = { name = "Игнорировать наличие продукта", defaultValue = "false" },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 1,
                                },
                                MEDIUM_CHANGE = { name = "Смена среды" },
                                OBJECT_EMPTY = { name = "Объект опорожнен" },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                INNER_WASHING_CIP = {
                    name = "Внутренняя мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            DI_CIP_FREE =
                            {
                                name = "МСА свободна DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            MEDIUM_CHANGE_REQUEST =
                            {
                                name = "Запрос смены среды DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                            DES_SIGNAL =
                            {
                                name = "Дезинфекция активна DI",
                                displayObjects = { "signals" },
                            },
                            INCORRECT_CIP =
                            {
                                name = "Некорректная мойка DI",
                                displayObjects = { "signals" },
                            },
                        },
                        bool =
                        {
                            IGNORE_WATER_FLAG = { name = "Игнорировать наличие продукта", defaultValue = "false" },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                },
                                MEDIUM_CHANGE = { name = "Смена среды" },
                                OBJECT_EMPTY = { name = "Объект опорожнен" },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                },
                STERILIZATION = {
                    name = "Стерилизация",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Стерилизация завершена",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение стерилизации",
                                displayObjects = { "signals" },
                            },
                        },
                        bool =
                        {
                            IGNORE_WATER_FLAG = { name = "Игнорировать наличие продукта", defaultValue = "false" },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                },
                                MEDIUM_CHANGE = { name = "Смена среды" },
                                OBJECT_EMPTY = { name = "Объект опорожнен" },
                            },
                        },
                    },
                },
                WORK = {
                    name = "Работа",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING = { name = "Ожидание", defaultPosition = 1 },
                                SRC_WATER_PUSHING = { name = "Вытеснение источника", defaultPosition = 2 },
                                WATER_PUSHING = { name = "Вытеснение ПОУ", defaultPosition = 3 },
                                WORK = { name = "Работа", defaultPosition = 4 },
                                SRC_PRODUCT_PUSHING = { name = "Проталкивание источника", defaultPosition = 5 },
                                PRODUCT_PUSHING = { name = "Проталкивание ПОУ", defaultPosition = 6 },
                                TEMPERATURE_STABILIZATION = { name = "Стабилизация температуры" },
                                IN_HEATER = { name = "В теплообменник" },
                                IN_BYPASS = { name = "В байпас теплообменника" },
                                HEAT = { name = "Нагрев" },
                            }
                        }
                    },
                    params =
                    {
                        active =
                        {
                            VOLUME = { name = "Объем ПОУ", displayObjects = { "signals", "parameters" } },
                            WATER_DO = { name = "Вода в ПОУ DO", displayObjects = { "signals" } },
                            PRODUCT_DO = { name = "Продукт в ПОУ DO", displayObjects = { "signals" } },
                            SRC_WATER_DI = { name = "Источник, вода в трубе DI", displayObjects = { "signals" } },
                            SRC_PRODUCT_DI = { name = "Источник, продукт в трубе DI", displayObjects = { "signals" } },
                            DST_PRODUCT_PUSHING_DI = { name = "Приёмник, запрос проталкивания DI", displayObjects = { "signals" } },
                            PRODUCT_REQUEST_DI = { name = "Запрос продукта DI", displayObjects = { "signals" } },
                        },
                        bool =
                        {
                            USE_SRC_FQT = { name = "Использовать счетчик источника", defaultValue = "false"},
                        }
                    },
                    defaultPosition = 2,
                },
            },
            basicName = "pasteurizator",
            bindingName = "pasteurizator",
            luaModuleName = "pasteurizator",
            equipment =
            {
                hatch = { name = "Датчик крышки люка", defaultValue = "GS1" },
                LS_up = { name = "Датчик верхнего уровня", defaultValue = "LS2" },
                LS_down = { name = "Датчик нижнего уровня", defaultValue = "LS1" },
                LT = { name = "Датчик текущего уровня", defaultValue = "LT1" },
                out_pump = { name = "Откачивающий насос CIP" },
                signal_column = { name = "Сигнальная колонна" },
                FQT = { name = "Счетчик", defaultValue = "FQT1" },
                TE = { name = "Датчик температуры", defaultValue = "TE1" },
            },
            parameters =
            {
                float =
                {
                    object_float_parameters.WATER_FLAG,
                    object_float_parameters.HEAT_TEMPERATURE,
                    object_float_parameters.TE_HEAT_DELTA,
                    object_float_parameters.STABILIZATION_TIME,
                },
            },
        },
        post = {
            name = "Пост",
            s88Level = 2,
            basicName = "post",
            bindingName = "post"
        },
        tank = {
            name = "Танк",
            s88Level = 1,
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            DI_CIP_FREE =
                            {
                                name = "МСА свободна DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            MEDIUM_CHANGE_REQUEST =
                            {
                                name = "Запрос смены среды DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                            DES_SIGNAL =
                            {
                                name = "Дезинфекция активна DI",
                                displayObjects = { "signals" },
                            },
                            INCORRECT_CIP =
                            {
                                name = "Некорректная мойка DI",
                                displayObjects = { "signals" },
                            },
                        },
                        float =
                        {
                            object_float_parameters.WASH_STEP1_TIME,
                            object_float_parameters.WASH_DRAINAGE_TIME,
                            object_float_parameters.WASH_DRAINAGE_TIME_MAX,
                            object_float_parameters.WASH_MAX_LT,
                            object_float_parameters.OUT_PUMP_WASH_LS_WORK,
                            object_float_parameters.OUT_PUMP_WASH_LS_DELAY,
                            object_float_parameters.DES_FLAG,
                            object_float_parameters.DES_LIM_TIME,
                            object_float_parameters.DES_TIME,
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 3,
                                },
                                MEDIUM_CHANGE = { name = "Смена среды" },
                                OBJECT_EMPTY = { name = "Объект опорожнен" },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                EMPTY_TANK_HEATING = {
                    name = "Нагрев пустого танка",
                    params =
                    {
                        active =
                        {
                            OPERATION_AFTER = { name = "Номер последующей операции" },
                        },
                    },
                },
                FILL = {
                    name = "Наполнение",
                    params =
                    {
                        active =
                        {
                            OPERATION_AFTER_FILL = { name = "Номер последующей операции" },
                        },
                        float =
                        {
                            object_float_parameters.MIX_MIN_LT,
                            object_float_parameters.MIX_DELTA_LT,
                            object_float_parameters.V_ACCEPTING_SET,
                            object_float_parameters.V_ACCEPTING_CURRENT,
                        },
                    },
                    defaultPosition = 2,
                },
                FILL_2 = {
                    name = "Наполнение 2",
                    params =
                    {
                        active =
                        {
                            OPERATION_AFTER_FILL = { name = "Номер последующей операции" },
                        },
                    },
                },
                ADDITION_OF_STARTER = {
                    name = "Внесение закваски",
                    params =
                    {
                        active =
                        {
                            OPERATION_AFTER = { name = "Номер последующей операции" },
                        },
                    },
                },
                LEAVENING = {
                    name = "Заквашивание",
                    params =
                    {
                        active =
                        {
                            LEAVENING_TIME =
                            {
                                name = "Время заквашивания (мин)",
                                displayObjects = { "parameters" },
                            },
                            OPERATION_AFTER = { name = "Номер последующей операции" },
                        },
                    },
                },
                READY_FOR_PRODUCTION = {
                    name = "Готов к производству",
                    params =
                    {
                    },
                },
                SOURING = {
                    name = "Сквашивание",
                    params =
                    {
                        active =
                        {
                            OPERATION_AFTER = { name = "Номер последующей операции" },
                        },
                    },
                },
                WHEY_SEPARATION_PRE = {
                    name = "Отделение сыворотки (нагрев)",
                    params =
                    {
                        active =
                        {
                            OPERATION_AFTER_HEATING = { name = "Номер последующей операции" },
                        },
                    },
                },
                STORING = {
                    name = "Хранение",
                    defaultPosition = 3,
                },
                OUT = {
                    name = "Выдача",
                    params =
                    {
                        bool =
                        {
                            NEED_STORING_AFTER = { name = "Включить хранение после выдачи", defaultValue = "true" },
                        },
                        float =
                        {
                            object_float_parameters.MIX_MIN_LT,
                            object_float_parameters.MIX_DELTA_LT,
                            object_float_parameters.DELAY_OUT_OFF_TIME,
                        },
                    },
                    defaultPosition = 4,
                },
                SLOW_HEATING = {
                    name = "Томление",
                    params =
                    {
                        bool =
                        {
                            AUTO_COOLING_BEFORE_LEAVENING =
                            {
                                name = "Автоматический переход к охлаждению для заквашивания",
                                defaultValue = "true",
                            },
                        },
                        active =
                        {
                            BAKE_TIME =
                            {
                                name = "Время нагрева (2-го шага)",
                                displayObjects = { "parameters" },
                            },
                            OPERATION_AFTER = { name = "Номер последующей операции" },
                        },
                        float =
                        {
                            object_float_parameters.SLOW_HEATING_BAKE_TIME,
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                TO_START_TEMPERATURE = { name = "Нагрев до заданной температуры" },
                                SLOW_HEATING = { name = "Нагрев заданное время" },
                            },
                        },
                    },
                },
                COOLING_BEFORE_LEAVENING = {
                    name = "Охлаждение перед заквашиванием",
                    params =
                    {
                        active =
                        {
                            MIXING_CHECK_TIME =
                            {
                                name = "Время проверки температуры",
                                displayObjects = { "parameters" },
                            },
                            OPERATION_AFTER = { name = "Номер следующей операции" },
                        },
                        float =
                        {
                            object_float_parameters.LEAV_MIXING_CHECK_TIME,
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                COOLING = { name = "Охлаждение" },
                                CHECKING_TEMPERATURE = { name = "Проверка заданной температуры" },
                            },
                        },
                    },
                },
                COOLING_AFTER_SOURING = {
                    name = "Охлаждение после сквашивания",
                    params =
                    {
                        active =
                        {
                            OPERATION_TIME =
                            {
                                name = "Время операции",
                                displayObjects = { "parameters" },
                            },
                            COOLING_TIME =
                            {
                                name = "Время охлаждения (1-го шага)",
                                displayObjects = { "parameters" },
                            },
                            MIXING_CHECK_TIME =
                            {
                                name = "Время проверки температуры (3-го шага)",
                                displayObjects = { "parameters" },
                            },
                            OPERATION_AFTER = { name = "Номер последующей операции" },
                        },
                        float =
                        {
                            object_float_parameters.COOLING_AS_TIME,
                            object_float_parameters.MIXING_AS_CHECK_TIME,
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                COOLING = { name = "Охлаждение" },
                                MIXING = { name = "Охлаждение и перемешивание" },
                                CHECKING_TEMPERATURE = { name = "Проверка заданной температуры" },
                            },
                        },
                    },
                },
                WORK = {
                    name = "Работа",
                    params =
                    {
                        bool =
                        {
                            WORK_FILL_AND_OUT =
                            {
                                name = "Совместная работа наполнения и выдачи",
                                defaultValue = "false",
                            },
                        },
                        active =
                        {
                            AUTO_DI =
                            {
                                name = "Сигнал автоматического включения/выключения",
                                displayObjects = { "signals" },
                            },
                            OPERATION_AFTER = { name = "Номер последующей операции" },
                        }
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAIT = { name = "Ожидание" },
                                IN_TANK = { name = "В танк" },
                                OUT_TANK = { name = "Из танка" },
                            },
                        },
                    },
                },
                MIXING_AFTER_SOURING = {
                    name = "Перемешивание после сквашивания",
                    params =
                    {
                        active =
                        {
                            OPERATION_AFTER =
                            {
                                name = "Номер следующей операции",
                            },
                            MIXING_AFTER_SOURING_TIME =
                            {
                                name = "Время операции",
                                displayObjects = { "parameters" },
                            }
                        },
                        float =
                        {
                            object_float_parameters.MIX_AFTER_SOURING_TIME,
                        },
                    }
                },
                HEATING = {
                    name = "Нагревание основы",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                HEATING = { name = "Нагрев" },
                                CHECKING_TEMPERATURE = { name = "Проверка температуры" },
                            },
                        },
                    },
                    params =
                    {
                        active =
                        {
                            MAX_TIME =
                            {
                                name = "Максимальное время операции",
                                displayObjects = { "parameters" },
                            },
                            TEMPERATURE_VERIFICATION_TIME =
                            {
                                name = "Время стабилизации температуры",
                                displayObjects = { "parameters" },
                            },
                            OPERATION_AFTER_HEATING =
                            {
                                name = "Номер следующей операции",
                            }
                        },
                    },
                },
                WHEY_SEPARATION_TURNOVER = {
                    name = "Отделение сыворотки по оборотам",
                    params =
                    {
                        active =
                        {
                            MAX_TIME =
                            {
                                name = "Максимальное время операции",
                                displayObjects = { "parameters" },
                            },
                            CURRENT_STEP =
                            {
                                name = "Текущий шаг",
                                displayObjects = { "parameters" },
                            },
                            STEP1_SPEED =
                            {
                                name = "Скорость перемешивания для шага 1 (об/мин)",
                                displayObjects = { "parameters" },
                            },
                            STEP1_DIRECTION =
                            {
                                name = "Направление перемешивания для 1 шага",
                                displayObjects = { "parameters" },
                            },
                            STEP1_COUNT =
                            {
                                name = "Количество оборотов для шага 1",
                                displayObjects = { "parameters" },
                            },
                            STEP1_WAIT =
                            {
                                name = "Время ожидания после перемешивания (мин)",
                                displayObjects = { "parameters" },
                            },
                            HEAT_TEMPERATURE =
                            {
                                name = "Температура нагревания",
                                displayObjects = { "parameters" },
                            },
                            MAX_STEP =
                            {
                                name = "Максимальный шаг",
                                displayObjects = { "parameters" },
                            },
                        },
                        float =
                        {
                            object_float_parameters.WST_CURRENT_STEP,
                            object_float_parameters.WST_MAX_STEP,
                            -- Шаг 1
                            object_float_parameters.MIX_SPEED_RPM_WST1,
                            object_float_parameters.DIRECTION_WST1,
                            object_float_parameters.SET_CNT_WST1,
                            object_float_parameters.WAIT_TIME_WST1,
                            -- Шаг 2
                            object_float_parameters.MIX_SPEED_RPM_WST2,
                            object_float_parameters.DIRECTION_WST2,
                            object_float_parameters.SET_CNT_WST2,
                            object_float_parameters.WAIT_TIME_WST2,
                            -- Шаг 3
                            object_float_parameters.MIX_SPEED_RPM_WST3,
                            object_float_parameters.DIRECTION_WST3,
                            object_float_parameters.SET_CNT_WST3,
                            object_float_parameters.WAIT_TIME_WST3,
                            -- Шаг 4
                            object_float_parameters.MIX_SPEED_RPM_WST4,
                            object_float_parameters.DIRECTION_WST4,
                            object_float_parameters.SET_CNT_WST4,
                            object_float_parameters.WAIT_TIME_WST4,
                            -- Шаг 5
                            object_float_parameters.MIX_SPEED_RPM_WST5,
                            object_float_parameters.DIRECTION_WST5,
                            object_float_parameters.SET_CNT_WST5,
                            object_float_parameters.WAIT_TIME_WST5,
                            -- Шаг 6
                            object_float_parameters.MIX_SPEED_RPM_WST6,
                            object_float_parameters.DIRECTION_WST6,
                            object_float_parameters.SET_CNT_WST6,
                            object_float_parameters.WAIT_TIME_WST6,
                            -- Шаг 7
                            object_float_parameters.MIX_SPEED_RPM_WST7,
                            object_float_parameters.DIRECTION_WST7,
                            object_float_parameters.SET_CNT_WST7,
                            object_float_parameters.WAIT_TIME_WST7,
                            -- Шаг 8
                            object_float_parameters.MIX_SPEED_RPM_WST8,
                            object_float_parameters.DIRECTION_WST8,
                            object_float_parameters.SET_CNT_WST8,
                            object_float_parameters.WAIT_TIME_WST8,
                            -- Шаг 9
                            object_float_parameters.MIX_SPEED_RPM_WST9,
                            object_float_parameters.DIRECTION_WST9,
                            object_float_parameters.SET_CNT_WST9,
                            object_float_parameters.WAIT_TIME_WST9,
                            -- Шаг 10
                            object_float_parameters.MIX_SPEED_RPM_WST10,
                            object_float_parameters.DIRECTION_WST10,
                            object_float_parameters.SET_CNT_WST10,
                            object_float_parameters.WAIT_TIME_WST10,
                        },
                    },
                },
                WHEY_PUMPDOWN =
                {
                    name = "Откачка сыворотки",
                    params =
                    {
                        float =
                        {
                            object_float_parameters.WHEY_OUT_START_DELAY_TIME,
                            object_float_parameters.PUMPDOWN_MAX_TIME,
                            object_float_parameters.SET_V_PUMPDOWN,
                            object_float_parameters.V_PUMPDOWN,
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                UPPER_STEP = { name = "Откачка из верхней части" },
                                MIDDLE_STEP = { name = "Откачка из средней части" },
                                LOWER_STEP = { name = "Откачка из нижней части" },
                            },
                        },
                    },
                },
                CRYSTALLIZING =
                {
                    name = "Кристаллизация",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                CRYSTALLIZING1 = { name = "Этап 1" },
                                CRYSTALLIZING2 = { name = "Этап 2" },
                                CRYSTALLIZING3 = { name = "Этап 3" },
                            },
                        },
                    },
                    params =
                    {
                        active =
                        {
                            OPERATION_AFTER = { name = "Номер следующей операции" },
                        },
                        float =
                        {   --Этап 1
                            object_float_parameters.CRYST1_MIX_SPEED,
                            object_float_parameters.CRYST1_MIX_TIME_ON,
                            object_float_parameters.CRYST1_MIX_TIME_OFF,
                            object_float_parameters.CRYST1_TEMPERATURE,
                            object_float_parameters.CRYST1_DELTA_TE,
                            object_float_parameters.CRYST1_TIME,
                            object_float_parameters.CRYST1_TE_MAX_DIFF,
                            --Этап 2
                            object_float_parameters.CRYST2_TEMPERATURE,
                            object_float_parameters.CRYST2_DELTA_TE,
                            object_float_parameters.CRYST2_TIME,
                            object_float_parameters.CRYST2_TE_MAX_DIFF,
                            --Этап 3
                            object_float_parameters.CRYST3_TEMPERATURE,
                            object_float_parameters.CRYST3_DELTA_TE,
                            object_float_parameters.CRYST3_TIME,
                            object_float_parameters.CRYST3_TE_MAX_DIFF,
                        },
                    },
                },
                RIPENING =
                {
                    name = "Созревание",
                    params =
                    {
                        active =
                        {
                            RIPENING_TIME = { name = "Время созревания" },
                        }
                    }
                },
                HEATING_CURD =
                {
                    name = "Нагревание сгустка",
                    params =
                    {
                        active =
                        {
                            OPERATION_AFTER_HEATING =
                            {
                                name = "Номер следующей операции",
                            }
                        },
                    },
                }
            },
            basicName = "tank",
            equipment =
            {
                hatch = { name = "Датчик крышки люка", defaultValue = "GS1" },
                hatch2 = { name = "Датчик крышки люка 2", defaultValue = "GS2" },
                LS_up = { name = "Датчик верхнего уровня", defaultValue = "LS2" },
                LS_down = { name = "Датчик нижнего уровня", defaultValue = "LS1" },
                LT = { name = "Датчик текущего уровня", defaultValue = "LT1" },
                TE = { name = "Датчик температуры", defaultValue = "TE1" },
                -- out_pump defaultValue пустое т.к по другому происходит
                -- обработка ОУ. Обрабатывается не объект, а устройство.
                out_pump = { name = "Откачивающий насос CIP" },
                lamp = { name = "Лампа освещения", defaultValue = "HL1" },
                signal_column = { name = "Сигнальная колонна" },
            },
            parameters =
            {
                float =
                {
                    object_float_parameters.OPERATION_TIME,
                    object_float_parameters.STEP_TIME,
                    object_float_parameters.IN_LINE_OBJ_NUMBER,
                    object_float_parameters.OUT_LINE_OBJ_NUMBER,
                    object_float_parameters.MASTER_MANUAL,
                    object_float_parameters.PRODUCT_TYPE,
                    object_float_parameters.PART_NUMB,
                    object_float_parameters.V_ACCEPTING_SET,
                    object_float_parameters.V_ACCEPTING_CURRENT,
                    object_float_parameters.MIX_MIN_LT,
                    object_float_parameters.MIX_DELTA_LT,
                },
            },
            luaModuleName = "tank",
            baseProperties =
            {
                bool =
                {
                    IGNORE_LEVELS_ERROR = { name = "Игнорировать ошибку предельных уровней", defaultValue = "true"},
                    IGNORE_LS_DOWN = { name = "Игнорировать нижний уровень при запуске выдачи", defaultValue = "false"},
                    NO_CHECK_CURRENT_LEVEL = { name = "Не проверять текущий уровень при наполнении", defaultValue = "false"},
                }
            }
        },
        pressure_node = {
            name = "Узел давления",
            s88Level = 2,
            baseOperations =
            {
                WORKING = {
                    name = "Работа",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING_TO_WORK_REQUEST = {
                                    name = "Ожидание запроса работы",
                                    defaultPosition = 1,
                                },
                                WORKING = {
                                    name = "Работа",
                                    defaultPosition = 2,
                                },
                                WAITING = {
                                    name = "Ожидание",
                                    defaultPosition = 3,
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
            },
            basicName = "pressure_node",
            equipment =
            {
                PT = { name = "Датчик давления", defaultValue = "PT1" },
            },
            aggregateParameters =
            {
                active =
                {
                    PRESSURE_VALUE =
                    {
                        name = "Заданное давление",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.PRESSURE_VALUE
                    },
                    PRESSURE_DELTA =
                    {
                        name = "Дельта давления",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.PRESSURE_DELTA
                    },
                    POWER_PUMP_WORK =
                    {
                        name = "Производительность насоса",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.POWER_PUMP_WORK
                    },
                    WORK_REQUEST =
                    {
                        name = "Сигнал включения шага \"Работа\"",
                        displayObjects = { "signals" }
                    },
                },
                main =
                {
                    NEED_PRESSURE_CONTROL = { name = "Использовать узел давления", defaultValue = "false" },
                },
                bool =
                {
                    NEED_PAUSE_PRESSURE_CONTROL = { name = "Пауза при аварии узла давления", defaultValue = "true" },
                },
            },
            bindingName = "pressure_node",
            luaModuleName = "pressure",
            parameters =
            {
                float =
                {
                    object_float_parameters.PRESSURE_VALUE,
                    object_float_parameters.PRESSURE_DELTA,
                    object_float_parameters.POWER_PUMP_WORK,
                },
            }
        },
        pressure_node_PID = {
            name = "Узел давления ПИД",
            s88Level = 2,
            baseOperations =
            {
                WORKING = {
                    name = "Работа",
                    params =
                    {
                        active =
                        {
                            product_request =
                            {
                                name = "Запрос продукта DI",
                                displayObjects = { "signals" },
                            }
                        },
                        bool =
                        {
                            is_reverse = { name = "Обратного (реверсивного) действия", defaultValue = "false" },
                            is_zero_start = { name = "Нулевое стартовое значение", defaultValue = "true" }
                        },
                    },
                    defaultPosition = 1,
                },
            },
            basicName = "pressure_node_PID",
            equipment =
            {
                M1 = { name = "Мотор", defaultValue = "M1" },
                PT = { name = "Датчик давления", defaultValue = "PT1" },
                PT2 = { name = "Датчик давления 2 (разностное задание)" },
                SET_VALUE = { name = "Задание", defaultValue = "" },
            },
            aggregateParameters =
            {
                main =
                {
                    NEED_PRESSURE_CONTROL = { name = "Использовать узел давления", defaultValue = "false" },
                },
                bool =
                {
                    NEED_PAUSE_PRESSURE_CONTROL = { name = "Пауза при аварии узла давления", defaultValue = "true" },
                },
            },
            bindingName = "pressure_node",
            isPID = true,
            systemParams =
            {
                [ 1 ] = {
                    name = "Параметр k",
                    defaultValue = 1,
                    nameLua = "P_k",
                },
                [ 2 ] = {
                    name = "Параметр Ti",
                    defaultValue = 15,
                    nameLua = "P_Ti",
                },
                [ 3 ] = {
                    name = "Параметр Td",
                    defaultValue = 0.01,
                    nameLua = "P_Td",
                },
                [ 4 ] = {
                    name = "Интервал расчёта",
                    meter = "мс",
                    defaultValue = 1000,
                    nameLua = "P_dt",
                },
                [ 5 ] = {
                    name = "Максимальное значение входной величины",
                    meter = "бар",
                    defaultValue = 100,
                    nameLua = "P_max",
                },
                [ 6 ] = {
                    name = "Минимальное значение входной величины",
                    meter = "бар",
                    defaultValue = 0,
                    nameLua = "P_min",
                },
                [ 7 ] = {
                    name = "Время выхода на режим регулирования",
                    meter = "с",
                    defaultValue = 30,
                    nameLua = "P_acceleration_time",
                },
                [ 8 ] = {
                    name = "Ручной режим",
                    meter = "№ режима",
                    defaultValue = 0, -- Ручной режим, 0 - авто, 1 - ручной
                    nameLua = "P_is_manual_mode",
                },
                [ 9 ] = {
                    name = "Заданное ручное значение выходного сигнала",
                    meter = "%",
                    defaultValue = 65,
                    nameLua = "P_U_manual",
                },
                [ 10 ] = {
                    name = "Параметр k2",
                    defaultValue = 0,
                    nameLua = "P_k2",
                },
                [ 11 ] = {
                    name = "Параметр Ti2",
                    defaultValue = 0,
                    nameLua = "P_Ti2",
                },
                [ 12 ] = {
                    name = "Параметр Td2",
                    defaultValue = 0,
                    nameLua = "P_Td2",
                },
                [ 13 ] = {
                    name = "Максимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 100,
                    nameLua = "P_out_max",
                },
                [ 14 ] = {
                    name = "Минимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 0,
                    nameLua = "P_out_min",
                },
            },
            luaModuleName = "pressure",
            deprecated = true,
        },
        heater_node = {
            name = "Узел нагревания",
            s88Level = 2,
            baseOperations =
            {
                HEATING = {
                    name = "Нагрев",
                    params =
                    {
                        active =
                        {
                            WORK_REQUEST =
                            {
                                name = "Сигнал включения шага \"Работа\" DI",
                                displayObjects = { "signals" }
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WORKING = {
                                    name = "Работа",
                                    defaultPosition = 1,
                                },
                                WAITING = {
                                    name = "Ожидание",
                                    defaultPosition = 2,
                                },
                                WAITING_TO_WORK_REQUEST = {
                                    name = "Ожидание запроса работы"
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
            },
            basicName = "heater_node",
            equipment =
            {
                TE = { name = "Датчик температуры", defaultValue = "TE1" },
            },
            aggregateParameters =
            {
                active =
                {
                    HEATING_TEMPERATURE =
                    {
                        name = "Температура нагревания",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.HEATING_TEMPERATURE
                    },
                    HEATING_TEMPERATURE_DELTA =
                    {
                        name = "Дельта температуры нагревания",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.HEATING_TEMPERATURE_DELTA
                    },
                    WATER_TEMPERATURE =
                    {
                        name = "Температура греющей воды",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.WATER_TEMPERATURE
                    },
                },
                bool =
                {
                    NEED_PAUSE_HEATER_NODE = { name = "Пауза при аварии узла нагревания", defaultValue = "true" },
                },
                main =
                {
                    NEED_HEATER_NODE = { name = "Использовать узел нагревания", defaultValue = "false" },
                },
            },
            bindingName = "heater_node",
            luaModuleName = "boiler",
            parameters =
            {
                float =
                {
                    object_float_parameters.HEAT_TEMPERATURE,
                    object_float_parameters.TE_HEAT_DELTA,
                },
            },
        },
        heater_node_PID = {
            name = "Узел нагревания ПИД",
            s88Level = 2,
            baseOperations =
            {
                HEATING = {
                    name = "Нагрев",
                    luaName = "",
                    params =
                    {
                        active =
                        {
                            WORK_REQUEST =
                            {
                                name = "Сигнал включения шага \"Работа\" DI",
                                displayObjects = { "signals" }
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WORKING = {
                                    name = "Работа",
                                    defaultPosition = 1,
                                },
                                WAITING = {
                                    name = "Ожидание",
                                    defaultPosition = 2,
                                },
                                WAITING_TO_WORK_REQUEST = {
                                    name = "Ожидание запроса работы"
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
            },
            basicName = "heater_node_PID",
            equipment =
            {
                TE = { name = "Датчик температуры", defaultValue = "TE1" },
                VC = { name = "Регулирующий клапан", defaultValue = "VC1" },
                FQT1 = { name = "Расходомер", defaultValue = "FQT1" },
                SET_VALUE = { name = "Задание"},
            },
            aggregateParameters =
            {
                main =
                {
                    NEED_HEATER_NODE = { name = "Использовать узел нагревания", defaultValue = "false" },
                },
                bool =
                {
                    NEED_PAUSE_HEATER_NODE = { name = "Пауза при аварии узла нагревания", defaultValue = "true" },
                },
            },
            bindingName = "heater_node",
            isPID = true,
            systemParams =
            {
                [ 1 ] = {
                    name = "Параметр k",
                    defaultValue = 1,
                    nameLua = "P_k",
                },
                [ 2 ] = {
                    name = "Параметр Ti",
                    defaultValue = 15,
                    nameLua = "P_Ti",
                },
                [ 3 ] = {
                    name = "Параметр Td",
                    defaultValue = 0.01,
                    nameLua = "P_Td",
                },
                [ 4 ] = {
                    name = "Интервал расчёта",
                    meter = "мс",
                    defaultValue = 1000,
                    nameLua = "P_dt",
                },
                [ 5 ] = {
                    name = "Максимальное значение входной величины",
                    meter = "°C",
                    defaultValue = 100,
                    nameLua = "P_max",
                },
                [ 6 ] = {
                    name = "Минимальное значение входной величины",
                    meter = "°C",
                    defaultValue = 0,
                    nameLua = "P_min",
                },
                [ 7 ] = {
                    name = "Время выхода на режим регулирования",
                    meter = "с",
                    defaultValue = 30,
                    nameLua = "P_acceleration_time",
                },
                [ 8 ] = {
                    name = "Ручной режим",
                    meter = "№ режима",
                    defaultValue = 0, -- Ручной режим, 0 - авто, 1 - ручной
                    nameLua = "P_is_manual_mode",
                },
                [ 9 ] = {
                    name = "Заданное ручное значение выходного сигнала",
                    meter = "%",
                    defaultValue = 65,
                    nameLua = "P_U_manual",
                },
                [ 10 ] = {
                    name = "Параметр k2",
                    defaultValue = 0,
                    nameLua = "P_k2",
                },
                [ 11 ] = {
                    name = "Параметр Ti2",
                    defaultValue = 0,
                    nameLua = "P_Ti2",
                },
                [ 12 ] = {
                    name = "Параметр Td2",
                    defaultValue = 0,
                    nameLua = "P_Td2",
                },
                [ 13 ] = {
                    name = "Максимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 100,
                    nameLua = "P_out_max",
                },
                [ 14 ] = {
                    name = "Минимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 0,
                    nameLua = "P_out_min",
                },
            },
            luaModuleName = "boiler",
            parameters =
            {
                float =
                {
                    object_float_parameters.HEAT_TEMPERATURE,
                    object_float_parameters.MIN_FLOW_FOR_WORK,
                },
            },
            deprecated = true,
        },
        flow_node_PID = {
            name = "Узел расхода ПИД",
            s88Level = 2,
            baseOperations =
            {
                WORKING = {
                    name = "Работа",
                    defaultPosition = 1,
                    params =
                    {
                        active =
                        {
                            WORK_REQUEST =
                            {
                                name = "Сигнал включения шага \"Работа\" DI",
                                displayObjects = { "signals" }
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING = {
                                    name = "Ожидание",
                                    defaultPosition = 1,
                                },
                                WORKING = {
                                    name = "Работа",
                                    defaultPosition = 2,
                                },
                                WAITING_TO_WORK_REQUEST = {
                                    name = "Ожидание сигнала",
                                    defaultPosition = 3,
                                },
                            },
                        },
                    },
                },
            },
            basicName = "flow_node_PID",
            equipment =
            {
                FQT1 = { name = "Счетчик", defaultValue = "FQT1" },
                M1 = { name = "Насос", defaultValue = "M1" },
                SET_VALUE = { name = "Задание"},
            },
            aggregateParameters =
            {
                main =
                {
                    NEED_FLOW_CONTROL = { name = "Использовать узел расхода", defaultValue = "false" },
                },
                bool =
                {
                    NEED_PAUSE_FLOW_CONTROL = { name = "Пауза при аварии узла расхода", defaultValue = "true" },
                },
            },
            bindingName = "flow_node",
            isPID = true,
            systemParams =
            {
                [ 1 ] = {
                    name = "Параметр k",
                    defaultValue = 1,
                    nameLua = "P_k",
                },
                [ 2 ] = {
                    name = "Параметр Ti",
                    defaultValue = 15,
                    nameLua = "P_Ti",
                },
                [ 3 ] = {
                    name = "Параметр Td",
                    defaultValue = 0.01,
                    nameLua = "P_Td",
                },
                [ 4 ] = {
                    name = "Интервал расчёта",
                    meter = "мс",
                    defaultValue = 1000,
                    nameLua = "P_dt",
                },
                [ 5 ] = {
                    name = "Максимальное значение входной величины",
                    meter = "м3/ч",
                    defaultValue = 100,
                    nameLua = "P_max",
                },
                [ 6 ] = {
                    name = "Минимальное значение входной величины",
                    meter = "м3/ч",
                    defaultValue = 0,
                    nameLua = "P_min",
                },
                [ 7 ] = {
                    name = "Время выхода на режим регулирования",
                    meter = "с",
                    defaultValue = 30,
                    nameLua = "P_acceleration_time",
                },
                [ 8 ] = {
                    name = "Ручной режим",
                    meter = "№ режима",
                    defaultValue = 0, -- Ручной режим, 0 - авто, 1 - ручной
                    nameLua = "P_is_manual_mode",
                },
                [ 9 ] = {
                    name = "Заданное ручное значение выходного сигнала",
                    meter = "%",
                    defaultValue = 65,
                    nameLua = "P_U_manual",
                },
                [ 10 ] = {
                    name = "Параметр k2",
                    defaultValue = 0,
                    nameLua = "P_k2",
                },
                [ 11 ] = {
                    name = "Параметр Ti2",
                    defaultValue = 0,
                    nameLua = "P_Ti2",
                },
                [ 12 ] = {
                    name = "Параметр Td2",
                    defaultValue = 0,
                    nameLua = "P_Td2",
                },
                [ 13 ] = {
                    name = "Максимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 100,
                    nameLua = "P_out_max",
                },
                [ 14 ] = {
                    name = "Минимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 0,
                    nameLua = "P_out_min",
                },
            },
            luaModuleName = "flow",
            deprecated = true,
        },
        cooler_node = {
            name = "Узел охлаждения",
            s88Level = 2,
            baseOperations =
            {
                COOLING = {
                    name = "Охлаждение",
                    params =
                    {
                        active =
                        {
                            FINISH_COLD_WATER_PUSHING_TEMPERATURE =
                            {
                                name = "Температура завершения вытеснения горячей воды",
                                displayObjects = { "parameters" },
                            },
                            COOL_TEMPERATURE =
                            {
                                name = "Температура охлаждения",
                                displayObjects = { "parameters" },
                            },
                            COOL_DELTA_TEMPERATURE =
                            {
                                name = "Дельта температуры охлаждения",
                                displayObjects = { "parameters" },
                            },
                            WORK_REQUEST =
                            {
                                name = "Сигнал включения шага \"Работа\" DI",
                                displayObjects = { "signals" }
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                HOT_WATER_PUSHING = {
                                    name = "Вытеснение горячей воды",
                                    defaultPosition = 1,
                                },
                                WORKING = {
                                    name = "Работа",
                                    defaultPosition = 2,
                                },
                                WAITING = {
                                    name = "Ожидание",
                                    defaultPosition = 3,
                                },
                                WAITING_TO_WORK_REQUEST = {
                                    name = "Ожидание запроса работы"
                                },
                                SWITCHING_OFF_SUPPLY_VALVE = {
                                    name = "Выключение подающего клапана"
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
            },
            basicName = "cooler_node",
            equipment =
            {
                TE = { name = "Датчик температуры", defaultValue = "TE1" },
                TE2 = { name = "Датчик температуры рубашки", defaultValue = "TE2" },
            },
            aggregateParameters =
            {
                active =
                {
                    COOLING_TEMPERATURE =
                    {
                        name = "Температура охлаждения",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.COOL_TEMPERATURE,
                    },
                    COOLING_TEMPERATURE_DELTA =
                    {
                        name = "Дельта температуры охлаждения",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.COOL_TEMPERATURE_DELTA
                    },
                },
                main =
                {
                    NEED_COOLING = { name = "Использовать узел охлаждения", defaultValue = "false" },
                },
                bool =
                {
                    NEED_PAUSE_COOLING = { name = "Пауза при аварии узла охлаждения", defaultValue = "true" },
                },
            },
            bindingName = "cooler_node",
            luaModuleName = "cooler",
            parameters =
            {
                float =
                {
                    object_float_parameters.COOL_TEMPERATURE,
                    object_float_parameters.TE_COOL_DELTA,
                    object_float_parameters.FINISH_COLD_WATER_PUSHING_TEMPERATURE,
                }
            }
        },
        cooler_node_PID = {
            name = "Узел охлаждения ПИД",
            s88Level = 2,
            baseOperations =
            {
                COOLING = {
                    name = "Охлаждение",
                    params =
                    {
                        active =
                        {
                            COOL_TEMPERATURE =
                            {
                                name = "Температура охлаждения",
                                displayObjects = { "parameters" },
                            },
                            COOL_TEMPERATURE_DELTA =
                            {
                                name = "Дельта температуры охлаждения",
                                displayObjects = { "parameters" },
                            },
                            WORK_REQUEST =
                            {
                                name = "Сигнал включения шага \"Работа\" DI",
                                displayObjects = { "signals" }
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WORKING = {
                                    name = "Работа",
                                    defaultPosition = 1,
                                },
                                WAITING = {
                                    name = "Ожидание",
                                    defaultPosition = 2,
                                },
                                WAITING_TO_WORK_REQUEST = {
                                    name = "Ожидание запроса работы"
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
            },
            basicName = "cooler_node_PID",
            equipment =
            {
                TE = { name = "Датчик температуры", defaultValue = "TE1" },
                VC = { name = "Регулирующий клапан", defaultValue = "VC1" },
                SET_VALUE = { name = "Задание"},
            },
            aggregateParameters =
            {
                active =
                {
                    COOLING_TEMPERATURE =
                    {
                        name = "Температура охлаждения",
                        displayObjects = { "parameters" },
                    },
                    COOLING_TEMPERATURE_DELTA =
                    {
                        name = "Дельта температуры охлаждения",
                        displayObjects = { "parameters" },
                    },
                },
                main =
                {
                    NEED_COOLING = { name = "Использовать узел охлаждения ПИД", defaultValue = "false" },
                },
                bool =
                {
                    NEED_PAUSE_COOLING = { name = "Пауза при аварии узла охлаждения ПИД", defaultValue = "true" },
                },
            },
            bindingName = "cooler_node",
            isPID = true,
            systemParams =
            {
                [ 1 ] = {
                    name = "Параметр k",
                    defaultValue = 1,
                    nameLua = "P_k",
                },
                [ 2 ] = {
                    name = "Параметр Ti",
                    defaultValue = 15,
                    nameLua = "P_Ti",
                },
                [ 3 ] = {
                    name = "Параметр Td",
                    defaultValue = 0.01,
                    nameLua = "P_Td",
                },
                [ 4 ] = {
                    name = "Интервал расчёта",
                    meter = "мс",
                    defaultValue = 1000,
                    nameLua = "P_dt",
                },
                [ 5 ] = {
                    name = "Максимальное значение входной величины",
                    meter = "°C",
                    defaultValue = 100,
                    nameLua = "P_max",
                },
                [ 6 ] = {
                    name = "Минимальное значение входной величины",
                    meter = "°C",
                    defaultValue = 0,
                    nameLua = "P_min",
                },
                [ 7 ] = {
                    name = "Время выхода на режим регулирования",
                    meter = "с",
                    defaultValue = 30,
                    nameLua = "P_acceleration_time",
                },
                [ 8 ] = {
                    name = "Ручной режим",
                    meter = "№ режима",
                    defaultValue = 0, -- Ручной режим, 0 - авто, 1 - ручной
                    nameLua = "P_is_manual_mode",
                },
                [ 9 ] = {
                    name = "Заданное ручное значение выходного сигнала",
                    meter = "%",
                    defaultValue = 65,
                    nameLua = "P_U_manual",
                },
                [ 10 ] = {
                    name = "Параметр k2",
                    defaultValue = 0,
                    nameLua = "P_k2",
                },
                [ 11 ] = {
                    name = "Параметр Ti2",
                    defaultValue = 0,
                    nameLua = "P_Ti2",
                },
                [ 12 ] = {
                    name = "Параметр Td2",
                    defaultValue = 0,
                    nameLua = "P_Td2",
                },
                [ 13 ] = {
                    name = "Максимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 100,
                    nameLua = "P_out_max",
                },
                [ 14 ] = {
                    name = "Минимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 0,
                    nameLua = "P_out_min",
                },
            },
            luaModuleName = "cooler",
            parameters =
            {
                float =
                {
                    object_float_parameters.COOL_TEMPERATURE,
                    object_float_parameters.TE_COOL_DELTA,
                },
            },
            deprecated = true,
        },
        mix_node = {
            name = "Узел перемешивания",
            s88Level = 2,
            baseOperations =
            {
                MIXING = {
                    name = "Перемешивание",
                    defaultPosition = 1,
                    params =
                    {
                        group = {
                            WORK_WITH_SECTIONS = {
                                name = "Работа по секциям",
                                main = true,
                                ignoreCompoundName = true,
                                group = {
                                    {
                                        luaName = "PART1",
                                        name = "Секция 1",
                                        active = {
                                            {
                                                luaName = "LT_MIN",
                                                name = "Минимальный уровень",
                                                displayObjects = { "parameters" },
                                            },
                                            {
                                                luaName = "LT_MAX",
                                                name = "Максимальный уровень",
                                                displayObjects = { "parameters" },
                                            },
                                            {
                                                luaName = "MAX_SPEED",
                                                name = "Производительность",
                                                displayObjects = { "parameters" },
                                            }
                                        }
                                    },
                                    {
                                        luaName = "PART2",
                                        name = "Секция 2",
                                        active = {
                                            {
                                                luaName = "LT_MIN",
                                                name = "Минимальный уровень",
                                                displayObjects = { "parameters" },
                                            },
                                            {
                                                luaName = "LT_MAX",
                                                name = "Максимальный уровень",
                                                displayObjects = { "parameters" },
                                            },
                                            {
                                                luaName = "MAX_SPEED",
                                                name = "Производительность",
                                                displayObjects = { "parameters" },
                                            }
                                        }
                                    },
                                    {
                                        luaName = "PART3",
                                        name = "Секция 3",
                                        active = {
                                            {
                                                luaName = "LT_MIN",
                                                name = "Минимальный уровень",
                                                displayObjects = { "parameters" },
                                            },
                                            {
                                                luaName = "LT_MAX",
                                                name = "Максимальный уровень",
                                                displayObjects = { "parameters" },
                                            },
                                            {
                                                luaName = "MAX_SPEED",
                                                name = "Производительность",
                                                displayObjects = { "parameters" },
                                            }
                                        }
                                    },
                                },
                            },
                        }
                    },
                },
                MIXING_LEFT = {
                    name = "Перемешивание влево",
                },
                MIXING_RIGHT = {
                    name = "Перемешивание вправо",
                },
                POSITION_MIX = {
                    name = "Позиционирование мешалки",
                    params =
                    {
                        active =
                        {
                            MAX_TIME =
                            {
                                name = "Максимальное время позиционирования (мин)",
                                displayObjects = { "parameters" },
                            },
                            MIX_SPEED_RPM =
                            {
                                name = "Скорость позиционирования (об/мин)",
                                displayObjects = { "parameters" },
                            },
                        }
                    },
                },
                MIXING_REVOL = {
                    name = "Перемешивание по оборотам",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                INIT = {
                                    name = "Определение положения",
                                },
                                FROM_SENSOR_TO_LEFT = {
                                    name = "Соскальзывание влево с датчика верхнего положения",
                                },
                                TO_SENSOR_TO_LEFT = {
                                    name = "Движение влево до верхнего положения",
                                },
                                FROM_SENSOR_TO_RIGHT = {
                                    name = "Соскальзывание вправо с датчика верхнего положения",
                                },
                                TO_SENSOR_TO_RIGHT = {
                                    name = "Движение вправо до верхнего положения",
                                },
                            },
                        },
                    },
                    params =
                    {   active =
                        {
                            DIRECTION =
                            {
                                name = "Направление вращения (влево/вправо)",
                                displayObjects = { "parameters" },
                            },
                            MIX_SPEED_RPM =
                            {
                                name = "Заданная скорость (об/мин)",
                                displayObjects = { "parameters" },
                            },
                            MAX_TIME =
                            {
                                name = "Максимальное время перемешивания",
                                displayObjects = { "parameters" },
                            },
                            SET_CNT =
                            {
                                name = "Задано оборотов",
                                displayObjects = { "parameters" },
                            },
                            DONE_CNT =
                            {
                                name = "Сделано оборотов",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                },
                MIXING_AUTO = {
                    name = "Перемешивание авто",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                INIT = { name = "Определение положения" },
                                FROM_LEFT_SENSOR = { name = "Движение от левого положения" },
                                TO_RIGHT_SENSOR = { name = "Движение к правому положению" },
                                FROM_RIGHT_SENSOR = { name = "Движение от правого положения" },
                                TO_LEFT_SENSOR = { name = "Движение к левому положению" },
                            },
                        },
                    },
                    params =
                    {
                        active =
                        {
                            MIX_SPEED_RPM = {
                                name = "Заданная скорость (об/мин)",
                                displayObjects = { "parameters" }
                            },
                            MAX_TIME = {
                                name = "Максимальное время перемешивания (мин)",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                },
            },
            basicName = "mix_node",
            equipment =
            {
                mix = { name = "Мешалка", defaultValue = "M1" },
                bar = { name = "Датчик решетки люка", defaultValue = "GS2" },
                hatch = { name = "Датчик крышки люка", defaultValue = "GS1" },
                hatch2 = { name = "Датчик крышки люка 2" },
                LT = { name = "Датчик текущего уровня", defaultValue = "LT1" },
                high_mix_lvl = { name = "Датчик верхнего положения мешалки" },
                left_mix_lvl = { name = "Датчик левого положения мешалки" },
                right_mix_lvl = { name = "Датчик правого положения мешалки" },
            },
            aggregateParameters =
            {
                active =
                {
                    MIX_NODE_MIX_OPERATION =
                    {
                        name = "Используемая операция узла перемешивания",
                        defaultValue = 1
                    },
                    MIX_NODE_MIX_ON_TIME =
                    {
                        name = "Время работы",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.MIX_NODE_MIX_ON_TIME
                    },
                    MIX_NODE_MIX_OFF_TIME =
                    {
                        name = "Время простоя",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.MIX_NODE_MIX_OFF_TIME
                    },
                    MIX_NODE_MIX_SPEED =
                    {
                        name = "Скорость",
                        displayObjects = { "parameters" },
                        defaultValue = object_float_parameters.MIX_NODE_MIX_SPEED
                    },
                },
                main =
                {
                    NEED_MIXING = { name = "Использовать узел перемешивания", defaultValue = "true" },
                },
            },
            bindingName = "mix_node",
            luaModuleName = "mixer",
        },
        sterile_air_node = {
            name = "Узел стерильного воздуха",
            s88Level = 2,
            baseOperations =
            {
                WORKING =
                {
                    name = "Работа",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WORKING = {
                                    name = "Работа",
                                    defaultPosition = 1,
                                },
                                WAITING = {
                                    name = "Ожидание",
                                    defaultPosition = 2,
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                STERILIZATION =
                {
                    name = "Стерилизация",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                HEATING = {
                                    name = "Нагрев",
                                    defaultPosition = 1,
                                },
                                STERILIZATION = {
                                    name = "Стерилизация",
                                    defaultPosition = 2,
                                },
                                COOLING = {
                                    name = "Охлаждение",
                                    defaultPosition = 3,
                                },
                            },
                        },
                    },
                    params =
                    {
                        active =
                        {
                            STERILIZATION_TEMPERATURE =
                            {
                                name = "Температура стерилизации",
                                displayObjects = { "parameters" },
                            },
                            MIN_STERILIZATION_TEMPERATURE =
                            {
                                name = "Минимальная температура стерилизации",
                                displayObjects = { "parameters" },
                            },
                            COOL_TEMPERATURE =
                            {
                                name = "Температура охлаждения",
                                displayObjects = { "parameters" },
                            },
                            MAX_OPERATION_TIME =
                            {
                                name = "Максимальное время операции",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                    defaultPosition = 2,
                },
            },
            basicName = "sterile_air_node",
            equipment =
            {
                TE1 = { name = "Датчик температуры", defaultValue = "TE1" },
            },
            aggregateParameters =
            {
                main =
                {
                    NEED_STERILE_AIR_NODE =
                    {
                        name = "Использовать узел стерильного воздуха",
                        defaultValue = "false"
                    },
                },
            },
            bindingName = "sterile_air_node",
            luaModuleName = "sterile_air",
        },
        steam_blast_node = {
            name = "Узел продувания",
            s88Level = 2,
            baseOperations =
            {
                WORKING = {
                    name = "Работа",
                    defaultPosition = 1,
                },
            },
            basicName = "steam_blast_node",
            equipment =
            {
                GS = { name = "Датчик(и) люка", defaultValue = "GS1" },
            },
            aggregateParameters =
            {
                main =
                {
                    NEED_STEAM_BLAST_NODE =
                    {
                        name = "Использовать узел продувания",
                        defaultValue = "false"
                    },
                },
            },
            bindingName = "steam_blast_node",
            luaModuleName = "steam_blast_node",
        },
        tank_level_node_PID = {
            name = "Узел текущего уровня ПИД",
            s88Level = 2,
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 2,
                                },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                WORKING = {
                    name = "Работа",
                    defaultPosition = 2,
                },
            },
            basicName = "tank_level_node_PID",
            equipment =
            {
                LT = { name = "Датчик текущего уровня", defaultValue = "LT1" },
                M1 = { name = "Насос (AO)", defaultValue = "M1" },
                SET_VALUE = { name = "Задание" },
            },
            bindingName = "tank_level_node_PID",
            isPID = true,
            systemParams =
            {
                [ 1 ] = {
                    name = "Параметр k",
                    defaultValue = 1,
                    nameLua = "P_k",
                },
                [ 2 ] = {
                    name = "Параметр Ti",
                    defaultValue = 15,
                    nameLua = "P_Ti",
                },
                [ 3 ] = {
                    name = "Параметр Td",
                    defaultValue = 0.01,
                    nameLua = "P_Td",
                },
                [ 4 ] = {
                    name = "Интервал расчёта",
                    meter = "мс",
                    defaultValue = 1000,
                    nameLua = "P_dt",
                },
                [ 5 ] = {
                    name = "Максимальное значение входной величины",
                    meter = "%",
                    defaultValue = 100,
                    nameLua = "P_max",
                },
                [ 6 ] = {
                    name = "Минимальное значение входной величины",
                    meter = "%",
                    defaultValue = 0,
                    nameLua = "P_min",
                },
                [ 7 ] = {
                    name = "Время выхода на режим регулирования",
                    meter = "с",
                    defaultValue = 30,
                    nameLua = "P_acceleration_time",
                },
                [ 8 ] = {
                    name = "Ручной режим",
                    meter = "№ режима",
                    defaultValue = 0, -- Ручной режим, 0 - авто, 1 - ручной
                    nameLua = "P_is_manual_mode",
                },
                [ 9 ] = {
                    name = "Заданное ручное значение выходного сигнала",
                    meter = "%",
                    defaultValue = 65,
                    nameLua = "P_U_manual",
                },
                [ 10 ] = {
                    name = "Параметр k2",
                    defaultValue = 0,
                    nameLua = "P_k2",
                },
                [ 11 ] = {
                    name = "Параметр Ti2",
                    defaultValue = 0,
                    nameLua = "P_Ti2",
                },
                [ 12 ] = {
                    name = "Параметр Td2",
                    defaultValue = 0,
                    nameLua = "P_Td2",
                },
                [ 13 ] = {
                    name = "Максимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 100,
                    nameLua = "P_out_max",
                },
                [ 14 ] = {
                    name = "Минимальное значение выходной величины",
                    meter = "%",
                    defaultValue = 0,
                    nameLua = "P_out_min",
                },
            },
            aggregateParameters =
            {
                main =
                {
                    NEED_TANK_LEVEL_NODE_PID =
                    {
                        name = "Использовать узел текущего уровня ПИД",
                        defaultValue = "false"
                    },
                },
            },
            luaModuleName = "tank_level_node",
            deprecated = true,
        },
        tank_level_node = {
            name = "Узел текущего уровня",
            s88Level = 2,
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 2,
                                },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                WORKING = {
                    name = "Работа",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING_LOW_LS = {
                                    name = "Ожидание пропадания нижнего уровня",
                                    defaultPosition = 1,
                                },
                                FEEDING_HI_LS = {
                                    name = "Пополнение до появления верхнего уровня",
                                    defaultPosition = 2
                                },
                            },
                        },
                    },
                    defaultPosition = 2,
                },
            },
            basicName = "tank_level_node",
            equipment =
            {
                LS_up = { name = "Датчик верхнего уровня", defaultValue = "LS2" },
                LS_down = { name = "Датчик нижнего уровня", defaultValue = "LS1" },
                LT = { name = "Датчик текущего уровня", defaultValue = "LT1" },
            },
            bindingName = "tank_level_node",
            aggregateParameters =
            {
                main =
                {
                    NEED_TANK_LEVEL_NODE =
                    {
                        name = "Использовать узел текущего уровня",
                        defaultValue = "false"
                    },
                },
            },
            luaModuleName = "tank_level_node",
        },
        main_cip_module = {
            name = "Главный модуль мойки",
            s88Level = 2,
            basicName = "main_cip_module",
            bindingName = "main_cip_module",
            luaModuleName = "cip_module",
            systemParams =
            {
                [ 1 ] = {
                    name = "Концентрация рабочего раствора щелочи",
                    meter = "%",
                    defaultValue = 1.5,
                    nameLua = "CONCENTRATION_ALKALI",
                },
                [ 2 ] = {
                    name = "Минимально допустимая концентрация рабочего раствора щелочи",
                    meter = "%",
                    defaultValue = 0.4,
                    nameLua = "MIN_CONC_ALKALI",
                },
                [ 3 ] = {
                    name = "Максимальная концентрация раствора щелочи для канализации",
                    meter = "%",
                    defaultValue = 0.2,
                    nameLua = "MAX_CONCENTRATION_ALKALI",
                },
                [ 4 ] = {
                    name = "Концентрация рабочего раствора кислоты",
                    meter = "%",
                    defaultValue = 1.2,
                    nameLua = "CONCENTRATION_ACID",
                },
                [ 5 ] = {
                    name = "Минимально допустимая концентрация рабочего раствора кислоты",
                    meter = "%",
                    defaultValue = 0.4,
                    nameLua = "MIN_CONCENTRATION_ACID",
                },
                [ 6 ] = {
                    name = "Максимальная концентрация раствора кислоты для канализации",
                    meter = "%",
                    defaultValue = 0.1,
                    nameLua = "MAX_CONCENTRATION_ACID",
                },
                [ 7 ] = {
                    name = "Перерегулирование концентрации при наведении растворов",
                    meter = "%",
                    defaultValue = 10,
                    nameLua = "CONCENTRATION_OVERSHOOT",
                },
                [ 8 ] = {
                    name = "Допуск концентрации растворов при наведении",
                    meter = "%",
                    defaultValue = 5,
                    nameLua = "ALLOWANCE_CONCENTRATION",
                },
                [ 9 ] = {
                    name = "Резервный",
                    meter = "",
                    defaultValue = 0,
                    nameLua = "RESERVE",
                },
                [ 10 ] = {
                    name = "Флаг отключения игнорирования ошибок уровня",
                    meter = "№",
                    defaultValue = 0,
                    nameLua = "FLAG_ACTIVITY",
                },
                [ 11 ] = {
                    name = "Коэффициент температурной зависимости кислоты",
                    meter = "%/°C",
                    defaultValue = 1.51,
                    nameLua = "FACTOR_ACID",
                },
                [ 12 ] = {
                    name = "Коэффициент температурной зависимости щелочи",
                    meter = "%/°C",
                    defaultValue = 1.8,
                    nameLua = "FACTOR_ALKALI",
                },
                [ 13 ] = {
                    name = "Концентрация концентрированной щелочи 25 °C",
                    meter = "%",
                    defaultValue = 40,
                    nameLua = "CONCENTATION_WORK_ALKALI",
                },
                [ 14 ] = {
                    name = "Концентрация концентрированной кислоты 25 °C",
                    meter = "%",
                    defaultValue = 57,
                    nameLua = "CONCENTATION_WORK_ACID",
                },
                [ 15 ] = {
                    name = "Плотность концентрированной щелочи",
                    meter = "т/м3",
                    defaultValue = 1.47,
                    nameLua = "DENSITY_WORK_ALKALI",
                },
                [ 16 ] = {
                    name = "Плотность концентрированной кислоты",
                    meter = "т/м3",
                    defaultValue = 1.45,
                    nameLua = "DENSITY_WORK_ACID",
                },
                [ 17 ] = {
                    name = "Концентрация щелочи в заданной точке 25 °C",
                    meter = "%",
                    defaultValue = 1,
                    nameLua = "CONCENTATION_WORK_ALKALI_POINT",
                },
                [ 18 ] = {
                    name = "Проводимость щелочи в заданной точке 25 °C",
                    meter = "mSm/cm2",
                    defaultValue = 52,
                    nameLua = "CONDUCTION_WORK_ALKALI_POINT",
                },
                [ 19 ] = {
                    name = "Концентрация кислоты в заданной точке 25 °C",
                    meter = "%",
                    defaultValue = 0.5,
                    nameLua = "CONCENTATION_WORK_ACID_POINT",
                },
                [ 20 ] = {
                    name = "Проводимость кислоты в заданной точке 25 °C",
                    meter = "mSm/cm2",
                    defaultValue = 30.8,
                    nameLua = "CONDUCTION_WORK_ACID_POINT",
                },
                [ 21 ] = {
                    name = "Проводимость воды в заданной точке 25°C",
                    meter = "mSm/cm2",
                    defaultValue = 0.4,
                    nameLua = "CONDUCTION_WATER_POINT",
                },
                [ 22 ] = {
                    name = "Время измерения концентрации",
                    meter = "с",
                    defaultValue = 30,
                    nameLua = "CONCENTRATION_MEASUREMENT_TIME",
                },
                [ 23 ] = {
                    name = "Время циркуляции перед изменением концентрации",
                    meter = "с",
                    defaultValue = 120,
                    nameLua = "CIRCULATION_TIME",
                },
                [ 24 ] = {
                    name = "Температура растворов",
                    meter = "°C",
                    defaultValue = 50,
                    nameLua = "SOLUTION_TEMPERATURE",
                },
                [ 25 ] = {
                    name = "Объем танка щелочи",
                    meter = "л",
                    defaultValue = 10000,
                    nameLua = "VALUE_ALKALI_TANK",
                },
                [ 26 ] = {
                    name = "Объем танка кислоты",
                    meter = "л",
                    defaultValue = 10000,
                    nameLua = "VALUE_ACID_TANK",
                },
                [ 27 ] = {
                    name = "Объем танка воды",
                    meter = "л",
                    defaultValue = 10000,
                    nameLua = "VALUE_WATER_TANK",
                },
                [ 28 ] = {
                    name = "Производительность дозатора кислоты",
                    meter = "л/ч",
                    defaultValue = 1200,
                    nameLua = "PRODUCTIVITY_ACID",
                },
                [ 29 ] = {
                    name = "Производительность дозатора щелочи",
                    meter = "л/ч",
                    defaultValue = 1200,
                    nameLua = "PRODUCTIVITY_ALKALI",
                },
                [ 30 ] = {
                    name = "Производительность при перемешивании растворов",
                    meter = "м3/ч",
                    defaultValue = 40,
                    nameLua = "PRODUCTIVITY_SOLUTION",
                },
                [ 31 ] = {
                    name = "Максимальный аналоговый уровень при наполнении танка щелочи при наведении",
                    meter = "",
                    defaultValue = 60,
                    nameLua = "MAX_LEVEL_ALKALI",
                },
                [ 32 ] = {
                    name = "Максимальный аналоговый уровень при наполнении танка кислоты при наведении",
                    meter = "",
                    defaultValue = 60,
                    nameLua = "MAX_LEVEL_ACID",
                },
                [ 33 ] = {
                    name = "Тип щелочного раствора",
                    meter = "",
                    defaultValue = 0,
                    nameLua = "ALKALINE_SOLUTION_TYPE",
                },
                [ 34 ] = {
                    name = "Тип кислотного раствора",
                    meter = "",
                    defaultValue = 0,
                    nameLua = "ACID_SOLUTION_TYPE",
                },
                [ 35 ] = {
                    name = "Тип дезинфецирующего раствора",
                    meter = "",
                    defaultValue = 0,
                    nameLua = "DISINFECTION_SOLUTION_TYPE",
                },
            },
            parameters =
            {
                float_runtime =
                {
                    [ 1 ] = object_float_runtime_parameters.P_CONC_RATE,
                    [ 2 ] = object_float_runtime_parameters.P_ZAD_PODOGR,
                    [ 3 ] = object_float_runtime_parameters.P_ZAD_FLOW,
                    [ 4 ] = object_float_runtime_parameters.P_VRAB,
                    [ 5 ] = object_float_runtime_parameters.P_MAX_OPER_TM,
                    [ 6 ] = object_float_runtime_parameters.P_OP_TIME_LEFT,
                    [ 7 ] = object_float_runtime_parameters.P_CONC,
                    [ 8 ] = object_float_runtime_parameters.P_SUM_OP,
                    [ 9 ] = object_float_runtime_parameters.P_ZAD_CONC,
                    [ 10 ] = object_float_runtime_parameters.P_LOADED_RECIPE,
                    [ 11 ] = object_float_runtime_parameters.P_PROGRAM,
                    [ 12 ] = object_float_runtime_parameters.P_CUR_REC,
                    [ 13 ] = object_float_runtime_parameters.P_RET_STATE,
                    [ 14 ] = object_float_runtime_parameters.P_SELECT_REC,
                    [ 15 ] = object_float_runtime_parameters.P_SELECT_PRG,
                    [ 16 ] = object_float_runtime_parameters.PV1,
                    [ 17 ] = object_float_runtime_parameters.PV2,
                    [ 18 ] = object_float_runtime_parameters.P_OBJ_TYPE,
                    [ 19 ] = object_float_runtime_parameters.P_FLOW,
                    [ 20 ] = object_float_runtime_parameters.P_PODP_CIRC,
                    [ 21 ] = object_float_runtime_parameters.P_DELTA_TR,
                    [ 22 ] = object_float_runtime_parameters.P_T_WP,
                    [ 23 ] = object_float_runtime_parameters.P_T_WSP,
                    [ 24 ] = object_float_runtime_parameters.P_T_WKP,
                    [ 25 ] = object_float_runtime_parameters.P_T_WOP,
                    [ 26 ] = object_float_runtime_parameters.P_T_S,
                    [ 27 ] = object_float_runtime_parameters.P_T_K,
                    [ 28 ] = object_float_runtime_parameters.P_T_D,
                    [ 29 ] = object_float_runtime_parameters.P_T_SANITIZER,
                    [ 30 ] = object_float_runtime_parameters.P_DOP_V_PR_OP,
                    [ 31 ] = object_float_runtime_parameters.P_DOP_V_AFTER_S,
                    [ 32 ] = object_float_runtime_parameters.P_DOP_V_AFTER_K,
                    [ 33 ] = object_float_runtime_parameters.P_DOP_V_OK_OP,
                    [ 34 ] = object_float_runtime_parameters.P_RET_STOP,
                    [ 35 ] = object_float_runtime_parameters.P_V_RAB_ML,
                    [ 36 ] = object_float_runtime_parameters.PV_RET_DEL,
                    [ 37 ] = object_float_runtime_parameters.PTM_OP,
                    [ 38 ] = object_float_runtime_parameters.PTM_S,
                    [ 39 ] = object_float_runtime_parameters.PTM_K,
                    [ 40 ] = object_float_runtime_parameters.PTM_S_SK,
                    [ 41 ] = object_float_runtime_parameters.PTM_K_SK,
                    [ 42 ] = object_float_runtime_parameters.PTM_D,
                    [ 43 ] = object_float_runtime_parameters.PTM_SANITIZER,
                    [ 44 ] = object_float_runtime_parameters.PTM_SANITIZER_INJECT,
                    [ 45 ] = object_float_runtime_parameters.P_N_RET,
                    [ 46 ] = object_float_runtime_parameters.P_N_UPR,
                    [ 47 ] = object_float_runtime_parameters.P_OS,
                    [ 48 ] = object_float_runtime_parameters.P_OBJ_EMPTY,
                    [ 49 ] = object_float_runtime_parameters.P_PROGRAM_MASK,
                    [ 50 ] = object_float_runtime_parameters.P_T_CLEAN_RINSING,
                    [ 51 ] = object_float_runtime_parameters.P_V_CLEAN_RINSING,
                    [ 52 ] = object_float_runtime_parameters.P_T_SANITIZER_RINSING,
                    [ 53 ] = object_float_runtime_parameters.P_V_SANITIZER_RINSING,
                    [ 54 ] = object_float_runtime_parameters.P_TM_MAX_TIME_OPORBACHOK,
                    [ 55 ] = object_float_runtime_parameters.P_TM_RET_IS_EMPTY,
                    [ 56 ] = object_float_runtime_parameters.P_V_LL_BOT,
                    [ 57 ] = object_float_runtime_parameters.P_R_NO_FLOW,
                    [ 58 ] = object_float_runtime_parameters.P_TM_R_NO_FLOW,
                    [ 59 ] = object_float_runtime_parameters.P_TM_NO_FLOW_R,
                    [ 60 ] = object_float_runtime_parameters.P_TM_NO_CONC,
                    [ 61 ] = object_float_runtime_parameters.P61_RESERV,
                    [ 62 ] = object_float_runtime_parameters.PIDP_k,
                    [ 63 ] = object_float_runtime_parameters.PIDP_Ti,
                    [ 64 ] = object_float_runtime_parameters.PIDP_Td,
                    [ 65 ] = object_float_runtime_parameters.PIDP_dt,
                    [ 66 ] = object_float_runtime_parameters.PIDP_dmax,
                    [ 67 ] = object_float_runtime_parameters.PIDP_dmin,
                    [ 68 ] = object_float_runtime_parameters.PIDP_AccelTime,
                    [ 69 ] = object_float_runtime_parameters.PIDP_IsManualMode,
                    [ 70 ] = object_float_runtime_parameters.PIDP_UManual,
                    [ 71 ] = object_float_runtime_parameters.PIDP_Uk,
                    [ 72 ] = object_float_runtime_parameters.P72_RESERV,
                    [ 73 ] = object_float_runtime_parameters.PIDF_k,
                    [ 74 ] = object_float_runtime_parameters.PIDF_Ti,
                    [ 75 ] = object_float_runtime_parameters.PIDF_Td,
                    [ 76 ] = object_float_runtime_parameters.PIDF_dt,
                    [ 77 ] = object_float_runtime_parameters.PIDF_dmax,
                    [ 78 ] = object_float_runtime_parameters.PIDF_dmin,
                    [ 79 ] = object_float_runtime_parameters.PIDF_AccelTime,
                    [ 80 ] = object_float_runtime_parameters.PIDF_IsManualMode,
                    [ 81 ] = object_float_runtime_parameters.PIDF_UManual,
                    [ 82 ] = object_float_runtime_parameters.PIDF_Uk,
                    [ 83 ] = object_float_runtime_parameters.P_TM_MAX_TIME_OPORCIP,
                    [ 84 ] = object_float_runtime_parameters.P_SIGNAL_MEDIUM_CHANGE,
                    [ 85 ] = object_float_runtime_parameters.P_SIGNAL_CAUSTIC,
                    [ 86 ] = object_float_runtime_parameters.P_SIGNAL_ACID,
                    [ 87 ] = object_float_runtime_parameters.P_SIGNAL_CIP_IN_PROGRESS,
                    [ 88 ] = object_float_runtime_parameters.P_SIGNAL_CIPEND,
                    [ 89 ] = object_float_runtime_parameters.P_SIGNAL_CIP_READY,
                    [ 90 ] = object_float_runtime_parameters.P_SIGNAL_OBJECT_READY,
                    [ 91 ] = object_float_runtime_parameters.P_SIGNAL_SANITIZER_PUMP,
                    [ 92 ] = object_float_runtime_parameters.P_RESUME_CIP_ON_SIGNAL,
                    [ 93 ] = object_float_runtime_parameters.P_SIGNAL_PUMP_CONTROL,
                    [ 94 ] = object_float_runtime_parameters.P_SIGNAL_DESINSECTION,
                    [ 95 ] = object_float_runtime_parameters.P_SIGNAL_OBJECT_PAUSE,
                    [ 96 ] = object_float_runtime_parameters.P_SIGNAL_CIRCULATION,
                    [ 97 ] = object_float_runtime_parameters.P_SIGNAL_PUMP_CAN_RUN,
                    [ 98 ] = object_float_runtime_parameters.P_SIGNAL_PUMP_CONTROL_FEEDBACK,
                    [ 99 ] = object_float_runtime_parameters.P_SIGNAL_RET_PUMP_SENSOR,
                    [ 100 ] = object_float_runtime_parameters.P_RET_PUMP_SENSOR_DELAY,
                    [ 101 ] = object_float_runtime_parameters.P_SIGNAL_IN_CIP_READY,
                    [ 102 ] = object_float_runtime_parameters.P_SIGNAL_CIPEND2,
                    [ 103 ] = object_float_runtime_parameters.P_SIGNAL_CAN_CONTINUE,
                    [ 104 ] = object_float_runtime_parameters.P_SIGNAL_WATER,
                    [ 105 ] = object_float_runtime_parameters.P_SIGNAL_PRERINSE,
                    [ 106 ] = object_float_runtime_parameters.P_SIGNAL_INTERMEDIATE_RINSE,
                    [ 107 ] = object_float_runtime_parameters.P_SIGNAL_POSTRINSE,
                    [ 108 ] = object_float_runtime_parameters.P_SIGNAL_PUMP_STOPPED,
                    [ 109 ] = object_float_runtime_parameters.P_SIGNAL_FLOW_TASK,
                    [ 110 ] = object_float_runtime_parameters.P_SIGNAL_TEMP_TASK,
                    [ 111 ] = object_float_runtime_parameters.P_SIGNAL_WASH_ABORTED,
                    [ 112 ] = object_float_runtime_parameters.P_PRESSURE_CONTROL,
                    [ 113 ] = object_float_runtime_parameters.P_DONT_USE_WATER_TANK,
                    [ 114 ] = object_float_runtime_parameters.P_PIDP_MAX_OUT,
                    [ 115 ] = object_float_runtime_parameters.P_PIDF_MAX_OUT,
                    [ 116 ] = object_float_runtime_parameters.P_RESERV_START,
                    [ 117 ] = object_float_runtime_parameters.P117_RESERV,
                    [ 118 ] = object_float_runtime_parameters.P118_RESERV,
                    [ 119 ] = object_float_runtime_parameters.STP_QAVS,
                    [ 120 ] = object_float_runtime_parameters.STP_QAVK,
                    [ 121 ] = object_float_runtime_parameters.STP_WC,
                    [ 122 ] = object_float_runtime_parameters.STP_WS,
                    [ 123 ] = object_float_runtime_parameters.STP_LV,
                    [ 124 ] = object_float_runtime_parameters.STP_WC_INST_WS,
                    [ 125 ] = object_float_runtime_parameters.STP_WASH_START,
                    [ 126 ] = object_float_runtime_parameters.STP_STEPS_OVER,
                    [ 127 ] = object_float_runtime_parameters.STP_RESETSTEP,
                    [ 128 ] = object_float_runtime_parameters.STP_ERRCOUNT,
                    [ 129 ] = object_float_runtime_parameters.STP_USED_CAUSTIC,
                    [ 130 ] = object_float_runtime_parameters.STP_USED_ACID,
                    [ 131 ] = object_float_runtime_parameters.STP_LAST_STEP_COUNTER,
                    [ 132 ] = object_float_runtime_parameters.STP_LAST_STEP,
                    [ 133 ] = object_float_runtime_parameters.STP_USED_HOTWATER,
                    [ 134 ] = object_float_runtime_parameters.STP_PODP_CAUSTIC,
                    [ 135 ] = object_float_runtime_parameters.STP_PODP_ACID,
                    [ 136 ] = object_float_runtime_parameters.STP_PODP_WATER,
                    [ 137 ] = object_float_runtime_parameters.P137_RESERV,
                    [ 138 ] = object_float_runtime_parameters.P138_RESERV,
                    [ 139 ] = object_float_runtime_parameters.P139_RESERV,
                    [ 140 ] = object_float_runtime_parameters.P140_RESERV,
                },
            },
        },
        aux_cip_module = {
            name = "Вспомогательный модуль мойки",
            s88Level = 2,
            basicName = "aux_cip_module",
            bindingName = "aux_cip_module",
            luaModuleName = "cip_module",
            parameters =
            {
                float_runtime =
                {
                    [ 1 ] = object_float_runtime_parameters.P_CONC_RATE,
                    [ 2 ] = object_float_runtime_parameters.P_ZAD_PODOGR,
                    [ 3 ] = object_float_runtime_parameters.P_ZAD_FLOW,
                    [ 4 ] = object_float_runtime_parameters.P_VRAB,
                    [ 5 ] = object_float_runtime_parameters.P_MAX_OPER_TM,
                    [ 6 ] = object_float_runtime_parameters.P_OP_TIME_LEFT,
                    [ 7 ] = object_float_runtime_parameters.P_CONC,
                    [ 8 ] = object_float_runtime_parameters.P_SUM_OP,
                    [ 9 ] = object_float_runtime_parameters.P_ZAD_CONC,
                    [ 10 ] = object_float_runtime_parameters.P_LOADED_RECIPE,
                    [ 11 ] = object_float_runtime_parameters.P_PROGRAM,
                    [ 12 ] = object_float_runtime_parameters.P_CUR_REC,
                    [ 13 ] = object_float_runtime_parameters.P_RET_STATE,
                    [ 14 ] = object_float_runtime_parameters.P_SELECT_REC,
                    [ 15 ] = object_float_runtime_parameters.P_SELECT_PRG,
                    [ 16 ] = object_float_runtime_parameters.PV1,
                    [ 17 ] = object_float_runtime_parameters.PV2,
                    [ 18 ] = object_float_runtime_parameters.P_OBJ_TYPE,
                    [ 19 ] = object_float_runtime_parameters.P_FLOW,
                    [ 20 ] = object_float_runtime_parameters.P_PODP_CIRC,
                    [ 21 ] = object_float_runtime_parameters.P_DELTA_TR,
                    [ 22 ] = object_float_runtime_parameters.P_T_WP,
                    [ 23 ] = object_float_runtime_parameters.P_T_WSP,
                    [ 24 ] = object_float_runtime_parameters.P_T_WKP,
                    [ 25 ] = object_float_runtime_parameters.P_T_WOP,
                    [ 26 ] = object_float_runtime_parameters.P_T_S,
                    [ 27 ] = object_float_runtime_parameters.P_T_K,
                    [ 28 ] = object_float_runtime_parameters.P_T_D,
                    [ 29 ] = object_float_runtime_parameters.P_T_SANITIZER,
                    [ 30 ] = object_float_runtime_parameters.P_DOP_V_PR_OP,
                    [ 31 ] = object_float_runtime_parameters.P_DOP_V_AFTER_S,
                    [ 32 ] = object_float_runtime_parameters.P_DOP_V_AFTER_K,
                    [ 33 ] = object_float_runtime_parameters.P_DOP_V_OK_OP,
                    [ 34 ] = object_float_runtime_parameters.P_RET_STOP,
                    [ 35 ] = object_float_runtime_parameters.P_V_RAB_ML,
                    [ 36 ] = object_float_runtime_parameters.PV_RET_DEL,
                    [ 37 ] = object_float_runtime_parameters.PTM_OP,
                    [ 38 ] = object_float_runtime_parameters.PTM_S,
                    [ 39 ] = object_float_runtime_parameters.PTM_K,
                    [ 40 ] = object_float_runtime_parameters.PTM_S_SK,
                    [ 41 ] = object_float_runtime_parameters.PTM_K_SK,
                    [ 42 ] = object_float_runtime_parameters.PTM_D,
                    [ 43 ] = object_float_runtime_parameters.PTM_SANITIZER,
                    [ 44 ] = object_float_runtime_parameters.PTM_SANITIZER_INJECT,
                    [ 45 ] = object_float_runtime_parameters.P_N_RET,
                    [ 46 ] = object_float_runtime_parameters.P_N_UPR,
                    [ 47 ] = object_float_runtime_parameters.P_OS,
                    [ 48 ] = object_float_runtime_parameters.P_OBJ_EMPTY,
                    [ 49 ] = object_float_runtime_parameters.P_PROGRAM_MASK,
                    [ 50 ] = object_float_runtime_parameters.P_T_CLEAN_RINSING,
                    [ 51 ] = object_float_runtime_parameters.P_V_CLEAN_RINSING,
                    [ 52 ] = object_float_runtime_parameters.P_T_SANITIZER_RINSING,
                    [ 53 ] = object_float_runtime_parameters.P_V_SANITIZER_RINSING,
                    [ 54 ] = object_float_runtime_parameters.P_TM_MAX_TIME_OPORBACHOK,
                    [ 55 ] = object_float_runtime_parameters.P_TM_RET_IS_EMPTY,
                    [ 56 ] = object_float_runtime_parameters.P_V_LL_BOT,
                    [ 57 ] = object_float_runtime_parameters.P_R_NO_FLOW,
                    [ 58 ] = object_float_runtime_parameters.P_TM_R_NO_FLOW,
                    [ 59 ] = object_float_runtime_parameters.P_TM_NO_FLOW_R,
                    [ 60 ] = object_float_runtime_parameters.P_TM_NO_CONC,
                    [ 61 ] = object_float_runtime_parameters.P61_RESERV,
                    [ 62 ] = object_float_runtime_parameters.PIDP_k,
                    [ 63 ] = object_float_runtime_parameters.PIDP_Ti,
                    [ 64 ] = object_float_runtime_parameters.PIDP_Td,
                    [ 65 ] = object_float_runtime_parameters.PIDP_dt,
                    [ 66 ] = object_float_runtime_parameters.PIDP_dmax,
                    [ 67 ] = object_float_runtime_parameters.PIDP_dmin,
                    [ 68 ] = object_float_runtime_parameters.PIDP_AccelTime,
                    [ 69 ] = object_float_runtime_parameters.PIDP_IsManualMode,
                    [ 70 ] = object_float_runtime_parameters.PIDP_UManual,
                    [ 71 ] = object_float_runtime_parameters.PIDP_Uk,
                    [ 72 ] = object_float_runtime_parameters.P72_RESERV,
                    [ 73 ] = object_float_runtime_parameters.PIDF_k,
                    [ 74 ] = object_float_runtime_parameters.PIDF_Ti,
                    [ 75 ] = object_float_runtime_parameters.PIDF_Td,
                    [ 76 ] = object_float_runtime_parameters.PIDF_dt,
                    [ 77 ] = object_float_runtime_parameters.PIDF_dmax,
                    [ 78 ] = object_float_runtime_parameters.PIDF_dmin,
                    [ 79 ] = object_float_runtime_parameters.PIDF_AccelTime,
                    [ 80 ] = object_float_runtime_parameters.PIDF_IsManualMode,
                    [ 81 ] = object_float_runtime_parameters.PIDF_UManual,
                    [ 82 ] = object_float_runtime_parameters.PIDF_Uk,
                    [ 83 ] = object_float_runtime_parameters.P_TM_MAX_TIME_OPORCIP,
                    [ 84 ] = object_float_runtime_parameters.P_SIGNAL_MEDIUM_CHANGE,
                    [ 85 ] = object_float_runtime_parameters.P_SIGNAL_CAUSTIC,
                    [ 86 ] = object_float_runtime_parameters.P_SIGNAL_ACID,
                    [ 87 ] = object_float_runtime_parameters.P_SIGNAL_CIP_IN_PROGRESS,
                    [ 88 ] = object_float_runtime_parameters.P_SIGNAL_CIPEND,
                    [ 89 ] = object_float_runtime_parameters.P_SIGNAL_CIP_READY,
                    [ 90 ] = object_float_runtime_parameters.P_SIGNAL_OBJECT_READY,
                    [ 91 ] = object_float_runtime_parameters.P_SIGNAL_SANITIZER_PUMP,
                    [ 92 ] = object_float_runtime_parameters.P_RESUME_CIP_ON_SIGNAL,
                    [ 93 ] = object_float_runtime_parameters.P_SIGNAL_PUMP_CONTROL,
                    [ 94 ] = object_float_runtime_parameters.P_SIGNAL_DESINSECTION,
                    [ 95 ] = object_float_runtime_parameters.P_SIGNAL_OBJECT_PAUSE,
                    [ 96 ] = object_float_runtime_parameters.P_SIGNAL_CIRCULATION,
                    [ 97 ] = object_float_runtime_parameters.P_SIGNAL_PUMP_CAN_RUN,
                    [ 98 ] = object_float_runtime_parameters.P_SIGNAL_PUMP_CONTROL_FEEDBACK,
                    [ 99 ] = object_float_runtime_parameters.P_SIGNAL_RET_PUMP_SENSOR,
                    [ 100 ] = object_float_runtime_parameters.P_RET_PUMP_SENSOR_DELAY,
                    [ 101 ] = object_float_runtime_parameters.P_SIGNAL_IN_CIP_READY,
                    [ 102 ] = object_float_runtime_parameters.P_SIGNAL_CIPEND2,
                    [ 103 ] = object_float_runtime_parameters.P_SIGNAL_CAN_CONTINUE,
                    [ 104 ] = object_float_runtime_parameters.P_SIGNAL_WATER,
                    [ 105 ] = object_float_runtime_parameters.P_SIGNAL_PRERINSE,
                    [ 106 ] = object_float_runtime_parameters.P_SIGNAL_INTERMEDIATE_RINSE,
                    [ 107 ] = object_float_runtime_parameters.P_SIGNAL_POSTRINSE,
                    [ 108 ] = object_float_runtime_parameters.P_SIGNAL_PUMP_STOPPED,
                    [ 109 ] = object_float_runtime_parameters.P_SIGNAL_FLOW_TASK,
                    [ 110 ] = object_float_runtime_parameters.P_SIGNAL_TEMP_TASK,
                    [ 111 ] = object_float_runtime_parameters.P_SIGNAL_WASH_ABORTED,
                    [ 112 ] = object_float_runtime_parameters.P_PRESSURE_CONTROL,
                    [ 113 ] = object_float_runtime_parameters.P_DONT_USE_WATER_TANK,
                    [ 114 ] = object_float_runtime_parameters.P_PIDP_MAX_OUT,
                    [ 115 ] = object_float_runtime_parameters.P_PIDF_MAX_OUT,
                    [ 116 ] = object_float_runtime_parameters.P_RESERV_START,
                    [ 117 ] = object_float_runtime_parameters.P117_RESERV,
                    [ 118 ] = object_float_runtime_parameters.P118_RESERV,
                    [ 119 ] = object_float_runtime_parameters.STP_QAVS,
                    [ 120 ] = object_float_runtime_parameters.STP_QAVK,
                    [ 121 ] = object_float_runtime_parameters.STP_WC,
                    [ 122 ] = object_float_runtime_parameters.STP_WS,
                    [ 123 ] = object_float_runtime_parameters.STP_LV,
                    [ 124 ] = object_float_runtime_parameters.STP_WC_INST_WS,
                    [ 125 ] = object_float_runtime_parameters.STP_WASH_START,
                    [ 126 ] = object_float_runtime_parameters.STP_STEPS_OVER,
                    [ 127 ] = object_float_runtime_parameters.STP_RESETSTEP,
                    [ 128 ] = object_float_runtime_parameters.STP_ERRCOUNT,
                    [ 129 ] = object_float_runtime_parameters.STP_USED_CAUSTIC,
                    [ 130 ] = object_float_runtime_parameters.STP_USED_ACID,
                    [ 131 ] = object_float_runtime_parameters.STP_LAST_STEP_COUNTER,
                    [ 132 ] = object_float_runtime_parameters.STP_LAST_STEP,
                    [ 133 ] = object_float_runtime_parameters.STP_USED_HOTWATER,
                    [ 134 ] = object_float_runtime_parameters.STP_PODP_CAUSTIC,
                    [ 135 ] = object_float_runtime_parameters.STP_PODP_ACID,
                    [ 136 ] = object_float_runtime_parameters.STP_PODP_WATER,
                    [ 137 ] = object_float_runtime_parameters.P137_RESERV,
                    [ 138 ] = object_float_runtime_parameters.P138_RESERV,
                    [ 139 ] = object_float_runtime_parameters.P139_RESERV,
                    [ 140 ] = object_float_runtime_parameters.P140_RESERV,
                },
            },
        },
        user_object = {
            name = "Пользовательский объект",
            s88Level = 3, -- Не относится к s88Level.
            basicName = "user_object",
            bindingName = "user_object",
        },
        CIP_node = {
            name = "Линия мойки",
            s88Level = 2,
            basicName = "line",
            bindingName = "CIP_line",
            baseOperations =
            {
                WASHING_CIP =
                {
                    name = "Мойка",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 2
                                },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                }
            },
            objectGroups =
            {
                CIP_objects = { name = "Моющиеся объекты", allowedObjects = "all" },
            },
            luaModuleName = "line",
        },
        sterile_air_line = {
            name = "Линия стерильного воздуха",
            s88Level = 2,
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 2,
                                },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                WORK = {
                    name = "Работа",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WORK = {
                                    name = "Работа",
                                    defaultPosition = 1,
                                },
                                WAIT = {
                                    name = "Ожидание",
                                    defaultPosition = 2,
                                },
                                STERILE = {
                                    name = "Стерильный",
                                    defaultPosition = 3,
                                },
                                WAIT_STERILE = {
                                    name = "Ожидание включения стерилизации",
                                    defaultPosition = 4,
                                },
                            },
                        },
                    },
                    defaultPosition = 2,
                },
                STERILIZATION_LINE = {
                    name = "Стерилизация",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                CONDENSATION = {
                                    name = "Слив конденсата",
                                    defaultPosition = 1,
                                },
                                HEATING_FILTER = {
                                    name = "Нагрев фильтра",
                                    defaultPosition = 2,
                                },
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 3,
                                },
                                HEATING_LINE = {
                                    name = "Нагрев линии",
                                    defaultPosition = 4,
                                },
                                STERILIZATION = {
                                    name = "Стерилизация",
                                    defaultPosition = 5,
                                },
                                COOLING = {
                                    name = "Охлаждение",
                                    defaultPosition = 6,
                                },
                                EMPTYING = {
                                    name = "Опорожнение",
                                    defaultPosition = 7,
                                },
                                STERILE = {
                                    name = "Стерильный",
                                    defaultPosition = 8,
                                },
                            },
                        },
                    },
                    defaultPosition = 3,
                },
            },
            basicName = "sterile_air_line",
            equipment =
            {
                TE = { name = "Датчик температуры", defaultValue = "TE1" },
                PT = { name = "Датчик давления", defaultValue = "PT1" },
            },
            bindingName = "sterile_air_line",
            luaModuleName = "sterile_air_line",
            parameters =
            {
                float =
                {
                    object_float_parameters.CONDENSATION_TEMPERATURE,
                    object_float_parameters.STEP_TIME_CONDENSATION,
                    object_float_parameters.HEATING_FILTER_TEMPERATURE,
                    object_float_parameters.STEP_TIME_HEATING_FILTER,
                    object_float_parameters.STEP_TIME_DRAINAGE,
                    object_float_parameters.HEATING_LINE_TEMPERATURE,
                    object_float_parameters.STEP_TIME_HEATING_LINE,
                    object_float_parameters.STERILIZATION_TEMPERATURE,
                    object_float_parameters.STEP_TIME_STERILIZATION,
                    object_float_parameters.COOLING_TEMPERATURE,
                    object_float_parameters.STEP_TIME_COOLING,
                    object_float_parameters.STEP_TIME_EMPTYING,
                    object_float_parameters.STEP_TIME_STERILE,
                    object_float_parameters.TE_STERILIZATION_DELTA,
                },
            },
        },
        deaerator = {
            name = "Деаэратор",
            s88Level = 2,
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            MEDIUM_CHANGE_REQUEST =
                            {
                                name = "Запрос смены среды DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 2,
                                },
                                MEDIUM_CHANGE = { name = "Смена среды" },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                WORK = {
                    name = "Работа",
                    params =
                    {
                        bool =
                        {
                            PAUSE_LOW_PRESSURE = { name = "Пауза при давлении ниже минимально допустимого значения", defaultValue = "false" },
                        },
                        active =
                        {
                            PRESSURE_DEAERATOR =
                            {
                                name = "Минимальное допустимое давления деаэратора",
                                displayObjects = { "parameters" },
                            },
                            DELTA_PRESSURE =
                            {
                                name = "Дельта давления",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAIT = {
                                    name = "Ожидание",
                                    defaultPosition = 1,
                                },
                                WORK = {
                                    name = "Работа",
                                    defaultPosition = 2,
                                },
                            },
                        },
                    },
                    defaultPosition = 2,
                },
                IN_BYPATH = {
                    name = "В байпас",
                    params =
                    {
                        active =
                        {
                            AUTO_DI =
                            {
                                name = "Сигнал автоматического включения/выключения",
                                displayObjects = { "signals" },
                            },
                        }
                    },
                    defaultPosition = 3,
                },
            },
            basicName = "deaerator",
			aggregateParameters =
            {
                main =
                    {
                        USE_DEAERATOR = { name = "Использовать деаэратор", defaultValue = "false" },
                    },
            },
            bindingName = "deaerator",
            equipment =
            {
                LS_down = { name = "Датчик нижнего уровня", defaultValue = "LS1" },
                PT = { name = "Датчик давления", defaultValue = "PT1" },
                M1 = { name = "Насос отрицательного давления", defaultValue = "M1" },
            },
            luaModuleName = "deaerator",
            parameters =
            {
                float =
                {
                    object_float_parameters.PRESSURE_VALUE,
                    object_float_parameters.PRESSURE_DELTA,
                },
            },
        },

        water_push_line = {
            name = "Линия проталкивания танков",
            s88Level = 2,
            baseOperations =
            {
                WASHING_CIP = {
                    name = "Мойка",
                    params =
                    {
                        active =
                        {
                            CIP_WASH_END =
                            {
                                name = "Мойка завершена DI",
                                displayObjects = { "signals" },
                            },
                            CIP_WASH_REQUEST =
                            {
                                name = "Автоматическое включение мойки DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_ENABLE =
                            {
                                name = "Флипы разрешены DI",
                                displayObjects = { "signals" },
                            },
                            FLIP_END =
                            {
                                name = "Флипы завершены DO",
                                displayObjects = { "signals" },
                            },
                            COUNT_FLIPS =
                            {
                                name = "Количество флипов",
                                displayObjects = { "parameters" },
                            },
                        },
                    },
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                DRAINAGE = {
                                    name = "Дренаж",
                                    defaultPosition = 2,
                                },
                                START_WASH = {
                                    name = "Начало мойки",
                                },
                                FLIP_ENABLE = {
                                    name = "Флипование",
                                },
                            },
                        },
                    },
                    defaultPosition = 1,
                },
                PUSH = {
                    name = "Проталкивание",
                    state =
                    {
                        RUN =
                        {
                            steps =
                            {
                                WAITING = { name = "Ожидание" },
                                TANK_LINE_PUSH = { name = "Проталкивание линии танка" },
                                TANK_LINE_PUSH_STOP = { name = "Завершение проталкивания" },
                                TANK_LINE_RINSE = { name = "Промывка линии танка" },
                            },
                        },
                    },
                },
            },
            basicName = "water_push_line",
            equipment =
            {
                water_FQT = { name = "Счетчик", defaultValue = "FQT1" },
            },
            bindingName = "water_push_line",
            luaModuleName = "water_push_line",
            parameters =
                {
                float =
                    {
                        object_float_parameters.TANK_LINE_PUSH_VOLUME,
                        object_float_parameters.TANK_LINE_PUSH_TIME,
                        object_float_parameters.TANK_LINE_PUSH_STOP_TIME,
                        object_float_parameters.TANK_LINE_RINSE_VOLUME,
                        object_float_parameters.TANK_LINE_RINSE_TIME,
                    }
                }
        },
    }
end

-- Здесь содержится общий пул float параметров, для базовых объектов. Параметры
-- настраиваются следующим образом:
-- 1. luaName - указывается строковое Lua-имя параметра. Это Lua-имя дублируется
-- в названии переменной (таблицы) параметра.
-- 2. name - указывается строковое отображаемое название.
-- 3. value - указывается начальное значение параметра.
-- (целое число или число с плавающей запятой).
-- 4. meter - указывается единица измерения в виде строки.
get_objects_float_parameters = function()
    return
    {   --Общие параметры
        OPERATION_TIME = {
            luaName = "OPERATION_TIME",
            name = "Время активной операции",
            value = 0,
            meter = "мсек",
        },
        STEP_TIME = {
            luaName = "STEP_TIME",
            name = "Время активного шага",
            value = 0,
            meter = "мсек",
        },
        IN_LINE_OBJ_NUMBER = {
            luaName = "IN_LINE_OBJ_NUMBER",
            name = "Номер линии наполнения",
            value = 0,
            meter = "№",
        },
        OUT_LINE_OBJ_NUMBER = {
            luaName = "OUT_LINE_OBJ_NUMBER",
            name = "Номер линии выдачи",
            value = 0,
            meter = "№",
        },
        MASTER_MANUAL = {
            luaName = "MASTER_MANUAL",
            name = "Ручной режим (операции управляются мастером (0) или вручную (1))",
            value = 0,
            meter = "0/1",
        },
        PRODUCT_TYPE = {
            luaName = "PRODUCT_TYPE",
            name = "Тип продукта",
            value = 0,
            meter = "№",
        },
        PART_NUMB = {
            luaName = "PART_NUMB",
            name = "Номер партии",
            value = 0,
            meter = "№",
        },
        V_ACCEPTING_SET = {
            luaName = "V_ACCEPTING_SET",
            name = "Заданный объем при наполнении",
            value = 0,
            meter = "л",
        },
        V_ACCEPTING_CURRENT = {
            luaName = "V_ACCEPTING_CURRENT",
            name = "Текущий объем при наполнении",
            value = 0,
            meter = "л",
        },
        --Общие параметры

        --Мойка
        WASH_STEP1_TIME = {
            luaName = "WASH_STEP1_TIME",
            name = "Мойка. Время шага на МГ",
            value = 120,
            meter = "сек",
        },
        WASH_DRAINAGE_TIME = {
            luaName = "WASH_DRAINAGE_TIME",
            name = "Мойка. Время шага 'Дренаж' после пропадания НУ",
            value = 60,
            meter = "сек",
        },
        WASH_DRAINAGE_TIME_MAX = {
            luaName = "WASH_DRAINAGE_TIME_MAX",
            name = "Мойка. Максимальное время шага 'Дренаж'",
            value = 90,
            meter = "сек",
        },
        WASH_MAX_LT = {
            luaName = "WASH_MAX_LT",
            name = "Мойка. Максимальный уровень для включения",
            value = 10,
            meter = "%",
        },
        OUT_PUMP_WASH_LS_WORK = {
            luaName = "OUT_PUMP_WASH_LS_WORK",
            name = "Мойка. Работа возвратного насоса по нижнему уровню",
            value = 0,
            meter = "0/1",
        },
        OUT_PUMP_WASH_LS_DELAY = {
            luaName = "OUT_PUMP_WASH_LS_DELAY",
            name = "Мойка. Задержка включения возвратного насоса по нижнему уровню",
            value = 0,
            meter = "сек",
        },
        DES_FLAG = {
            luaName = "DES_FLAG",
            name = "Дезинфекция активна",
            value = 0,
            meter = "0-3",
        },
        DES_TIME = {
            luaName = "DES_TIME",
            name = "Время следующей дезинфекции",
            value = 0,
            meter = "мин",
        },
        DES_LIM_TIME = {
            luaName = "DES_LIM_TIME",
            name = "Период дезинфекции",
            value = 360,
            meter = "мин",
        },
        --Мойка

        --Наполнение
        MIX_MIN_LT = {
            luaName = "MIX_MIN_LT",
            name = "Минимальный уровень для работы мешалки",
            value = 3,
            meter = "%",
        },
        MIX_DELTA_LT = {
            luaName = "MIX_DELTA_LT",
            name = "Дельта мин. уровня для включения мешалки",
            value = 1,
            meter = "%",
        },
        --Наполнение

        --Выдача
        DELAY_OUT_OFF_TIME = {
            luaName = "DELAY_OUT_OFF_TIME",
            name = "Задержка выключения выдачи по НУ",
            value = 3,
            meter = "сек",
        },
        --Выдача

        --Томление
        SLOW_HEATING_BAKE_TIME = {
            luaName = "SLOW_HEATING_BAKE_TIME",
            name = "Томление. Время томления",
            value = 60,
            meter = "мин",
        },
        --Томление

        --Созревание
        RIPENING_TIME = {
            luaName = "RIPENING_TIME",
            name = "Созревание. Время созревания",
            value = 60,
            meter = "мин",
        },
        --Созревание

        --Охлаждение перед закваш.
        LEAV_MIXING_CHECK_TIME = {
            luaName = "LEAV_MIXING_CHECK_TIME",
            name = "Охл. перед заквашиванием. Время проверки температуры",
            value = 60,
            meter = "сек",
        },
        --Охлаждение перед закваш.

        --Внесение закваски
        LEAVENING_TIME_MAX = {
            luaName = "LEAVENING_TIME_MAX",
            name = "Внесение закваски. Максимальное время",
            value = 60,
            meter = "мин",
        },
        --Внесение закваски

        --Заквашивание
        LEAVENING_TIME = {
            luaName = "LEAVENING_TIME",
            name = "Заквашивание. Время заквашивания",
            value = 10,
            meter = "мин",
        },
        --Заквашивание

        --Сквашивание
        SOURING_TIME = {
            luaName = "SOURING_TIME",
            name = "Сквашивание. Время сквашивания",
            value = 600,
            meter = "мин",
        },
        --Сквашивание

        --Перемешивание после скваш.
        MIX_AFTER_SOURING_TIME = {
            luaName = "MIX_AFTER_SOURING_TIME",
            name = "Перемешивание после сквашивания. Время операции",
            value = 20,
            meter = "мин",
        },
        --Перемешивание после скваш.

        --Охлаждение после сквашивания
        COOLING_AS_TIME = {
            luaName = "COOLING_AS_TIME",
            name = "Охл. после сквашивания. Время охлаждения",
            value = 20,
            meter = "мин",
        },
        MIXING_AS_CHECK_TIME = {
            luaName = "MIXING_AS_CHECK_TIME",
            name = "Охл. после сквашивания. Время проверки температуры",
            value = 60,
            meter = "сек",
        },
        --Охлаждение после сквашивания

        --Отделение сыворотки по оборотам
        WST_CURRENT_STEP = {
            luaName = "WST_CURRENT_STEP",
            name = "Отд. сыв. по оборотам. Текущий шаг",
            value = 0,
            meter = "№",
        },
        WST_MAX_STEP = {
            luaName = "WST_MAX_STEP",
            name = "Отд. сыв. по оборотам. Максимальный шаг",
            value = 10,
            meter = "№",
        },
        MIX_SPEED_RPM_WST1 = {
            luaName = "MIX_SPEED_RPM_WST1",
            name = "Отд. сыв. по оборотам. Шаг 1. Скорость мешалки",
            value = 1,
            meter = "об/мин",
        },
        DIRECTION_WST1 = {
            luaName = "DIRECTION_WST1",
            name = "Отд. сыв. по оборотам. Шаг 1. Направление мешалки",
            value = 1,
            meter = "0/1",
        },
        SET_CNT_WST1 = {
            luaName = "SET_CNT_WST1",
            name = "Отд. сыв. по оборотам. Шаг 1. Число оборотов мешалки",
            value = 4,
            meter = "об",
        },
        WAIT_TIME_WST1 = {
            luaName = "WAIT_TIME_WST1",
            name = "Отд. сыв. по оборотам. Шаг 1. Время паузы мешалки",
            value = 5,
            meter = "мин",
        },
        MIX_SPEED_RPM_WST2 = {
            luaName = "MIX_SPEED_RPM_WST2",
            name = "Отд. сыв. по оборотам. Шаг 2. Скорость мешалки",
            value = 1,
            meter = "об/мин",
        },
        DIRECTION_WST2 = {
            luaName = "DIRECTION_WST2",
            name = "Отд. сыв. по оборотам. Шаг 2. Направление мешалки",
            value = 1,
            meter = "0/1",
        },
        SET_CNT_WST2 = {
            luaName = "SET_CNT_WST2",
            name = "Отд. сыв. по оборотам. Шаг 2. Число оборотов мешалки",
            value = 4,
            meter = "об",
        },
        WAIT_TIME_WST2 = {
            luaName = "WAIT_TIME_WST2",
            name = "Отд. сыв. по оборотам. Шаг 2. Время паузы мешалки",
            value = 5,
            meter = "мин",
        },
        MIX_SPEED_RPM_WST3 = {
            luaName = "MIX_SPEED_RPM_WST3",
            name = "Отд. сыв. по оборотам. Шаг 3. Скорость мешалки",
            value = 1,
            meter = "об/мин",
        },
        DIRECTION_WST3 = {
            luaName = "DIRECTION_WST3",
            name = "Отд. сыв. по оборотам. Шаг 3. Направление мешалки",
            value = 1,
            meter = "0/1",
        },
        SET_CNT_WST3 = {
            luaName = "SET_CNT_WST3",
            name = "Отд. сыв. по оборотам. Шаг 3. Число оборотов мешалки",
            value = 4,
            meter = "об",
        },
        WAIT_TIME_WST3 = {
            luaName = "WAIT_TIME_WST3",
            name = "Отд. сыв. по оборотам. Шаг 3. Время паузы мешалки",
            value = 5,
            meter = "мин",
        },
        MIX_SPEED_RPM_WST4 = {
            luaName = "MIX_SPEED_RPM_WST4",
            name = "Отд. сыв. по оборотам. Шаг 4. Скорость мешалки",
            value = 1,
            meter = "об/мин",
        },
        DIRECTION_WST4 = {
            luaName = "DIRECTION_WST4",
            name = "Отд. сыв. по оборотам. Шаг 4. Направление мешалки",
            value = 1,
            meter = "0/1",
        },
        SET_CNT_WST4 = {
            luaName = "SET_CNT_WST4",
            name = "Отд. сыв. по оборотам. Шаг 4. Число оборотов мешалки",
            value = 4,
            meter = "об",
        },
        WAIT_TIME_WST4 = {
            luaName = "WAIT_TIME_WST4",
            name = "Отд. сыв. по оборотам. Шаг 4. Время паузы мешалки",
            value = 5,
            meter = "мин",
        },
        MIX_SPEED_RPM_WST5 = {
            luaName = "MIX_SPEED_RPM_WST5",
            name = "Отд. сыв. по оборотам. Шаг 5. Скорость мешалки",
            value = 1,
            meter = "об/мин",
        },
        DIRECTION_WST5 = {
            luaName = "DIRECTION_WST5",
            name = "Отд. сыв. по оборотам. Шаг 5. Направление мешалки",
            value = 1,
            meter = "0/1",
        },
        SET_CNT_WST5 = {
            luaName = "SET_CNT_WST5",
            name = "Отд. сыв. по оборотам. Шаг 5. Число оборотов мешалки",
            value = 4,
            meter = "об",
        },
        WAIT_TIME_WST5 = {
            luaName = "WAIT_TIME_WST5",
            name = "Отд. сыв. по оборотам. Шаг 5. Время паузы мешалки",
            value = 5,
            meter = "мин",
        },
        MIX_SPEED_RPM_WST6 = {
            luaName = "MIX_SPEED_RPM_WST6",
            name = "Отд. сыв. по оборотам. Шаг 6. Скорость мешалки",
            value = 1,
            meter = "об/мин",
        },
        DIRECTION_WST6 = {
            luaName = "DIRECTION_WST6",
            name = "Отд. сыв. по оборотам. Шаг 6. Направление мешалки",
            value = 1,
            meter = "0/1",
        },
        SET_CNT_WST6 = {
            luaName = "SET_CNT_WST6",
            name = "Отд. сыв. по оборотам. Шаг 6. Число оборотов мешалки",
            value = 4,
            meter = "об",
        },
        WAIT_TIME_WST6 = {
            luaName = "WAIT_TIME_WST6",
            name = "Отд. сыв. по оборотам. Шаг 6. Время паузы мешалки",
            value = 5,
            meter = "мин",
        },
        MIX_SPEED_RPM_WST7 = {
            luaName = "MIX_SPEED_RPM_WST7",
            name = "Отд. сыв. по оборотам. Шаг 7. Скорость мешалки",
            value = 1,
            meter = "об/мин",
        },
        DIRECTION_WST7 = {
            luaName = "DIRECTION_WST7",
            name = "Отд. сыв. по оборотам. Шаг 7. Направление мешалки",
            value = 1,
            meter = "0/1",
        },
        SET_CNT_WST7 = {
            luaName = "SET_CNT_WST7",
            name = "Отд. сыв. по оборотам. Шаг 7. Число оборотов мешалки",
            value = 4,
            meter = "об",
        },
        WAIT_TIME_WST7 = {
            luaName = "WAIT_TIME_WST7",
            name = "Отд. сыв. по оборотам. Шаг 7. Время паузы мешалки",
            value = 5,
            meter = "мин",
        },
        MIX_SPEED_RPM_WST8 = {
            luaName = "MIX_SPEED_RPM_WST8",
            name = "Отд. сыв. по оборотам. Шаг 8. Скорость мешалки",
            value = 1,
            meter = "об/мин",
        },
        DIRECTION_WST8 = {
            luaName = "DIRECTION_WST8",
            name = "Отд. сыв. по оборотам. Шаг 8. Направление мешалки",
            value = 1,
            meter = "0/1",
        },
        SET_CNT_WST8 = {
            luaName = "SET_CNT_WST8",
            name = "Отд. сыв. по оборотам. Шаг 8. Число оборотов мешалки",
            value = 4,
            meter = "об",
        },
        WAIT_TIME_WST8 = {
            luaName = "WAIT_TIME_WST8",
            name = "Отд. сыв. по оборотам. Шаг 8. Время паузы мешалки",
            value = 5,
            meter = "мин",
        },
        MIX_SPEED_RPM_WST9 = {
            luaName = "MIX_SPEED_RPM_WST9",
            name = "Отд. сыв. по оборотам. Шаг 9. Скорость мешалки",
            value = 1,
            meter = "об/мин",
        },
        DIRECTION_WST9 = {
            luaName = "DIRECTION_WST9",
            name = "Отд. сыв. по оборотам. Шаг 9. Направление мешалки",
            value = 1,
            meter = "0/1",
        },
        SET_CNT_WST9 = {
            luaName = "SET_CNT_WST9",
            name = "Отд. сыв. по оборотам. Шаг 9. Число оборотов мешалки",
            value = 4,
            meter = "об",
        },
        WAIT_TIME_WST9 = {
            luaName = "WAIT_TIME_WST9",
            name = "Отд. сыв. по оборотам. Шаг 9. Время паузы мешалки",
            value = 5,
            meter = "мин",
        },
        MIX_SPEED_RPM_WST10 = {
            luaName = "MIX_SPEED_RPM_WST10",
            name = "Отд. сыв. по оборотам. Шаг 10. Скорость мешалки",
            value = 1,
            meter = "об/мин",
        },
        DIRECTION_WST10 = {
            luaName = "DIRECTION_WST10",
            name = "Отд. сыв. по оборотам. Шаг 10. Направление мешалки",
            value = 1,
            meter = "0/1",
        },
        SET_CNT_WST10 = {
            luaName = "SET_CNT_WST10",
            name = "Отд. сыв. по оборотам. Шаг 10. Число оборотов мешалки",
            value = 4,
            meter = "об",
        },
        WAIT_TIME_WST10 = {
            luaName = "WAIT_TIME_WST10",
            name = "Отд. сыв. по оборотам. Шаг 10. Время паузы мешалки",
            value = 5,
            meter = "мин",
        },
        --Отделение сыворотки по оборотам

        --Откачка сыворотки
        WHEY_OUT_START_DELAY_TIME = {
            luaName = "WHEY_OUT_START_DELAY_TIME",
            name = "Откачка сыворотки. Задержка включения насоса",
            value = 5,
            meter = "сек",
        },
        PUMPDOWN_MAX_TIME = {
            luaName = "PUMPDOWN_MAX_TIME",
            name = "Откачка сыворотки. Максимальное время откачивания",
            value = 180,
            meter = "сек",
        },
        SET_V_PUMPDOWN = {
            luaName = "SET_V_PUMPDOWN",
            name = "Откачка сыворотки. Желаемый объем откачки сыворотки",
            value = 300,
            meter = "л",
        },
        V_PUMPDOWN = {
            luaName = "V_PUMPDOWN",
            name = "Откачка сыворотки. Объем откачанной сыворотки",
            value = 0,
            meter = "л",
        },
        --Откачка сыворотки

        --Кристаллизация
        --Этап 1
        CRYST1_MIX_SPEED = {
            luaName = "CRYST1_MIX_SPEED",
            name = "Кристаллизация. Производительность мешалки",
            value = 50,
            meter = "%",
        },
        CRYST1_MIX_TIME_ON = {
            luaName = "CRYST1_MIX_TIME_ON",
            name = "Кристаллизация. Время работы мешалки",
            value = 100,
            meter = "мин",
        },
        CRYST1_MIX_TIME_OFF = {
            luaName = "CRYST1_MIX_TIME_OFF",
            name = "Кристаллизация. Время простоя мешалки",
            value = 1,
            meter = "мин",
        },
        CRYST1_TEMPERATURE = {
            luaName = "CRYST1_TEMPERATURE",
            name = "Кристаллизация. Температура этапа кристаллизации 1",
            value = 29,
            meter = "°С",
        },
        CRYST1_DELTA_TE = {
            luaName = "CRYST1_DELTA_TE",
            name = "Кристаллизация. Дельта температуры этапа кристаллизации 1",
            value = 0,
            meter = "°С",
        },
        CRYST1_TIME = {
            luaName = "CRYST1_TIME",
            name = "Кристаллизация. Время этапа кристаллизации 1",
            value = 0,
            meter = "мин",
        },
        CRYST1_TE_MAX_DIFF = {
            luaName = "CRYST1_TE_MAX_DIFF",
            name = "Кристаллизация. Max разница темп. воды контура и продукта для этапа 1",
            value = 0,
            meter = "°С",
        },
        --Этап 2
        CRYST2_TEMPERATURE = {
            luaName = "CRYST2_TEMPERATURE",
            name = "Кристаллизация. Температура этапа кристаллизации 2",
            value = 29,
            meter = "°С",
        },
        CRYST2_DELTA_TE = {
            luaName = "CRYST2_DELTA_TE",
            name = "Кристаллизация. Дельта температуры этапа кристаллизации 2",
            value = 0,
            meter = "°С",
        },
        CRYST2_TIME = {
            luaName = "CRYST2_TIME",
            name = "Кристаллизация. Время этапа кристаллизации 2",
            value = 0,
            meter = "мин",
        },
        CRYST2_TE_MAX_DIFF = {
            luaName = "CRYST2_TE_MAX_DIFF",
            name = "Кристаллизация. Max разница темп. воды контура и продукта для этапа 2",
            value = 0,
            meter = "°С",
        },
        --Этап 3
        CRYST3_TEMPERATURE = {
            luaName = "CRYST3_TEMPERATURE",
            name = "Кристаллизация. Температура этапа кристаллизации 3",
            value = 29,
            meter = "°С",
        },
        CRYST3_DELTA_TE = {
            luaName = "CRYST3_DELTA_TE",
            name = "Кристаллизация. Дельта температуры этапа кристаллизации 3",
            value = 0,
            meter = "°С",
        },
        CRYST3_TIME = {
            luaName = "CRYST3_TIME",
            name = "Кристаллизация. Время этапа кристаллизации 3",
            value = 0,
            meter = "мин",
        },
        CRYST3_TE_MAX_DIFF = {
            luaName = "CRYST3_TE_MAX_DIFF",
            name = "Кристаллизация. Max разница темп. воды контура и продукта для этапа 3",
            value = 0,
            meter = "°С",
        },
        --Кристаллизация

        HEAT_TEMPERATURE = {
            luaName = "HEAT_TEMPERATURE",
            name = "Температура нагрева",
            value = 0,
            meter = "°С",
        },
        TE_HEAT_DELTA = {
            luaName = "TE_HEAT_DELTA",
            name = "Дельта температуры при нагревании",
            value = 0,
            meter = "°С",
        },
        MIN_FLOW_FOR_WORK = {
            luaName = "MIN_FLOW_FOR_WORK",
            name = "Минимальный расход для работы узла нагревания",
            value = 0,
            meter = "м3/ч",
        },
        TE_COOL_DELTA = {
            luaName = "TE_COOL_DELTA",
            name = "Дельта температура охлаждения",
            value = 0,
            meter = "°С",
        },
        FINISH_COLD_WATER_PUSHING_TEMPERATURE = {
            luaName = "FINISH_COLD_WATER_PUSHING_TEMPERATURE",
            name = "Температура завершения вытеснения горячей воды",
            value = 0,
            meter = "°С",
        },
        WATER_FLAG = {
            luaName = "WATER_FLAG",
            name = "Вода(0)/продукт(1) в линии",
            value =  0,
            meter = "0/1"
        },
        STABILIZATION_TIME = {
            luaName = "STABILIZATION_TIME",
            name = "Время стабилизации температуры",
            value = 0,
            meter = "с",
        },
        CONDENSATION_TEMPERATURE = {
            luaName = "CONDENSATION_TEMPERATURE",
            name = "Минимальная температура шага Слив конденсата",
            value = 0,
            meter = "°С",
        },
        STEP_TIME_CONDENSATION = {
            luaName = "STEP_TIME_CONDENSATION",
            name = "Время шага Слив конденсата",
            value = 0,
            meter = "с",
        },
        HEATING_FILTER_TEMPERATURE = {
            luaName = "HEATING_FILTER_TEMPERATURE",
            name = "Минимальная температура шага Нагрев фильтра",
            value = 0,
            meter = "°С",
        },
        STEP_TIME_HEATING_FILTER = {
            luaName = "STEP_TIME_HEATING_FILTER",
            name = "Время шага Нагрев фильтра",
            value = 0,
            meter = "с",
        },
        STEP_TIME_DRAINAGE = {
            luaName = "STEP_TIME_DRAINAGE",
            name = "Время шага Дренаж",
            value = 0,
            meter = "с",
        },
        HEATING_LINE_TEMPERATURE = {
            luaName = "HEATING_LINE_TEMPERATURE",
            name = "Минимальная температура шага Нагрев линии",
            value = 0,
            meter = "°С",
        },
        STEP_TIME_HEATING_LINE = {
            luaName = "STEP_TIME_HEATING_LINE",
            name = "Время шага Нагрев линии",
            value = 0,
            meter = "с",
        },
        STERILIZATION_TEMPERATURE = {
            luaName = "STERILIZATION_TEMPERATURE",
            name = "Минимальная температура шага Стерилизация",
            value = 0,
            meter = "°С",
        },
        STEP_TIME_STERILIZATION = {
            luaName = "STEP_TIME_STERILIZATION",
            name = "Время шага Стерилизация",
            value = 0,
            meter = "с",
        },
        COOLING_TEMPERATURE = {
            luaName = "COOLING_TEMPERATURE",
            name = "Минимальная температура шага Охлаждение",
            value = 0,
            meter = "°С",
        },
        STEP_TIME_COOLING = {
            luaName = "STEP_TIME_COOLING",
            name = "Время шага Охлаждение",
            value = 0,
            meter = "с",
        },
        STEP_TIME_EMPTYING = {
            luaName = "STEP_TIME_EMPTYING",
            name = "Время шага Опорожнение",
            value = 0,
            meter = "с",
        },
        STEP_TIME_STERILE = {
            luaName = "STEP_TIME_STERILE",
            name = "Время с последней стерилизации",
            value = 0,
            meter = "с",
        },
        TE_STERILIZATION_DELTA = {
            luaName = "TE_STERILIZATION_DELTA",
            name = "Дельта температуры в шагах стерилизации",
            value = 0,
            meter = "°С",
        },
        TANK_LINE_PUSH_VOLUME =
        {
            luaName = "TANK_LINE_PUSH_VOLUME",
            name = "Объем проталкивания линии танка",
            value = 0,
            meter = "л",
        },
        TANK_LINE_PUSH_TIME =
        {
            luaName = "TANK_LINE_PUSH_TIME",
            name = "Время проталкивания линии танка",
            value = 0,
            meter = "с",
        },
        TANK_LINE_PUSH_STOP_TIME =
        {
            luaName = "TANK_LINE_PUSH_STOP_TIME",
            name = "Время завершения проталкивания",
            value = 0,
            meter = "с",
        },
        TANK_LINE_RINSE_VOLUME =
        {
            luaName = "TANK_LINE_RINSE_VOLUME",
            name = "Объем промывки линии танка",
            value = 0,
            meter = "л",
        },
        TANK_LINE_RINSE_TIME =
        {
            luaName = "TANK_LINE_RINSE_TIME",
            name = "Время промывки линии танка",
            value = 0,
            meter = "с",
        },
        --List of parameters for nodes
       COOL_TEMPERATURE =
        {
            luaName = "COOL_TEMPERATURE",
            name = "Температура охлаждения",
            value = 0,
            meter = "°С",
        },
        COOL_TEMPERATURE_DELTA =
        {
            luaName = "COOL_TEMPERATURE_DELTA",
            name = "Дельта температуры охлаждения",
            value = 0,
            meter = "°С",
        },
        HEATING_TEMPERATURE =
        {
            luaName = "HEATING_TEMPERATURE",
            name = "Температура нагрева",
            value = 0,
            meter = "°С",
        },
        HEATING_TEMPERATURE_DELTA =
        {
            luaName = "HEATING_TEMPERATURE_DELTA",
            name = "Дельта темпераптуры нагрева",
            value = 0,
            meter = "°С",
        },
        WATER_TEMPERATURE =
        {
            luaName = "WATER_TEMPERATURE",
            name = "Температура нагрева воды",
            value = 0,
            meter = "°С",
        },
        PRESSURE_VALUE = {
            luaName = "PRESSURE_VALUE",
            name = "Заданное давление",
            value = 0,
            meter = "бар",
        },
        PRESSURE_DELTA = {
            luaName = "PRESSURE_DELTA",
            name = "Дельта давления",
            value = 0,
            meter = "бар",
        },
        POWER_PUMP_WORK = {
            luaName = "POWER_PUMP_WORK",
            name = "Производительность насоса",
            value = 0,
            meter = "%",
        },
        MIX_NODE_MIX_ON_TIME = {
            luaName = "MIX_NODE_MIX_ON_TIME",
            name = "Время работы узла перемешивания",
            value = 0,
            meter = "%",
        },
        MIX_NODE_MIX_OFF_TIME = {
            luaName = "MIX_NODE_MIX_OFF_TIME",
            name = "Время простоя узла перемешивания",
            value = 0,
            meter = "%",
        },
        MIX_NODE_MIX_SPEED = {
            luaName = "MIX_NODE_MIX_SPEED",
            name = "Производительность узла перемешивания",
            value = 0,
            meter = "%",
        },

    }
end

-- Здесь содержится общий пул float runtime параметров, для базовых объектов.
-- Параметры настраиваются следующим образом:
-- 1. luaName - указывается строковое Lua-имя параметра. Это Lua-имя дублируется
-- в названии переменной (таблицы) параметра.
-- 2. name - указывается строковое отображаемое название.
-- 3. meter - указывается единица измерения в виде строки.
get_runtime_float_parameters = function()
    return
    {
        P_CONC_RATE = {
            luaName = "P_CONC_RATE",
            name = "Расход концентрата при наведении",
            meter = "na",
        },
        P_ZAD_PODOGR = {
            luaName = "P_ZAD_PODOGR",
            name = "Текущее задание нагревания",
            meter = "°С",
        },
        P_ZAD_FLOW = {
            luaName = "P_ZAD_FLOW",
            name = "Текущее задание расхода",
            meter = "m3/ч",
        },
        P_VRAB = {
            luaName = "P_VRAB",
            name = "Заданный объем операции",
            meter = "л",
        },
        P_MAX_OPER_TM = {
            luaName = "P_MAX_OPER_TM",
            name = "Максимальное время текущей операции",
            meter = "с",
        },
        P_OP_TIME_LEFT = {
            luaName = "P_OP_TIME_LEFT",
            name = "Прошло времени текущей операции",
            meter = "с",
        },
        P_CONC = {
            luaName = "P_CONC",
            name = "Текущая концентрация",
            meter = "%",
        },
        P_SUM_OP = {
            luaName = "P_SUM_OP",
            name = "Литров с начала операции",
            meter = "л",
        },
        P_ZAD_CONC = {
            luaName = "P_ZAD_CONC",
            name = "Заданная концентрация",
            meter = "%",
        },
        P_LOADED_RECIPE = {
            luaName = "P_LOADED_RECIPE",
            name = "Резерв",
            meter = "na",
        },
        P_PROGRAM = {
            luaName = "P_PROGRAM",
            name = "Программа мойки",
            meter = "na",
        },
        P_CUR_REC = {
            luaName = "P_CUR_REC",
            name = "Номер выбранного рецепта на линии",
            meter = "na",
        },
        P_RET_STATE = {
            luaName = "P_RET_STATE",
            name = "Состояние возвратного насоса",
            meter = "na",
        },
        P_SELECT_REC = {
            luaName = "P_SELECT_REC",
            name = "Выбор рецепта",
            meter = "na",
        },
        P_SELECT_PRG = {
            luaName = "P_SELECT_PRG",
            name = "Выбор программы",
            meter = "na",
        },
        PV1 = {
            luaName = "PV1",
            name = "Объем V1 (от модуля до объекта)",
            meter = "л",
        },
        PV2 = {
            luaName = "PV2",
            name = "Объем V2 (от объекта до модуля)",
            meter = "л",
        },
        P_OBJ_TYPE = {
            luaName = "P_OBJ_TYPE",
            name = "Тип объекта (танк, линия и пр.)",
            meter = "na",
        },
        P_FLOW = {
            luaName = "P_FLOW",
            name = "Расход",
            meter = "m3/ч",
        },
        P_PODP_CIRC = {
            luaName = "P_PODP_CIRC",
            name = "Подпитывать ли бачок во время циркуляции",
            meter = "na",
        },
        P_DELTA_TR = {
            luaName = "P_DELTA_TR",
            name = "Разница температур на подаче и возврате (если меньше заданной, то начинается отсчет времени циркуляции)",
            meter = "°С",
        },
        P_T_WP = {
            luaName = "P_T_WP",
            name = "Температура предварительного ополаскивания",
            meter = "°С",
        },
        P_T_WSP = {
            luaName = "P_T_WSP",
            name = "Температура циркуляции на воде (операции не используются)",
            meter = "°С",
        },
        P_T_WKP = {
            luaName = "P_T_WKP",
            name = "Температура промежуточных промывок после щелочи и кислоты",
            meter = "°С",
        },
        P_T_WOP = {
            luaName = "P_T_WOP",
            name = "Температура окончательного ополаскивания",
            meter = "°С",
        },
        P_T_S = {
            luaName = "P_T_S",
            name = "Температура мойки щелочью",
            meter = "°С",
        },
        P_T_K = {
            luaName = "P_T_K",
            name = "Температура мойки кислотой",
            meter = "°С",
        },
        P_T_D = {
            luaName = "P_T_D",
            name = "Температура дезинфекции на воде",
            meter = "°С",
        },
        P_T_SANITIZER = {
            luaName = "P_T_SANITIZER",
            name = "Температура дезинфекции дезинфицирующим средством",
            meter = "°С",
        },
        P_DOP_V_PR_OP = {
            luaName = "P_DOP_V_PR_OP",
            name = "Дополнительный объем предварительного ополаскивания",
            meter = "л",
        },
        P_DOP_V_AFTER_S = {
            luaName = "P_DOP_V_AFTER_S",
            name = "Дополнительный объем ополаскивания после щелочи",
            meter = "л",
        },
        P_DOP_V_AFTER_K = {
            luaName = "P_DOP_V_AFTER_K",
            name = "Дополнительный объем ополаскивания после кислоты",
            meter = "л",
        },
        P_DOP_V_OK_OP = {
            luaName = "P_DOP_V_OK_OP",
            name = "Дополнительный объем окончательного ополаскивания",
            meter = "л",
        },
        P_RET_STOP = {
            luaName = "P_RET_STOP",
            name = "Объем до конца V1 для остановки возвратного насоса",
            meter = "л",
        },
        P_V_RAB_ML = {
            luaName = "P_V_RAB_ML",
            name = "Количество литров выше среднего уровня при котором заканчивается заполнение бачка циркуляции",
            meter = "л",
        },
        PV_RET_DEL = {
            luaName = "PV_RET_DEL",
            name = "Через сколько литров после начала подачи V2 включать возвратный насос",
            meter = "л",
        },
        PTM_OP = {
            luaName = "PTM_OP",
            name = "Время циркуляции при ополаскивании (операции не используются)",
            meter = "с",
        },
        PTM_S = {
            luaName = "PTM_S",
            name = "Время циркуляции на щелочи",
            meter = "с",
        },
        PTM_K = {
            luaName = "PTM_K",
            name = "Время циркуляции на кислоте",
            meter = "с",
        },
        PTM_S_SK = {
            luaName = "PTM_S_SK",
            name = "Время циркуляции на щелочи при мойке кислота+щелочь",
            meter = "с",
        },
        PTM_K_SK = {
            luaName = "PTM_K_SK",
            name = "Время циркуляции на кислоте при мойке кислота+щелочь",
            meter = "с",
        },
        PTM_D = {
            luaName = "PTM_D",
            name = "Время дезинфекции на воде",
            meter = "с",
        },
        PTM_SANITIZER = {
            luaName = "PTM_SANITIZER",
            name = "Время дезинфекции дезинфицирующим средством",
            meter = "с",
        },
        PTM_SANITIZER_INJECT = {
            luaName = "PTM_SANITIZER_INJECT",
            name = "Объем дезинфицирующего средства при дезинфекции",
            meter = "мл",
        },
        P_N_RET = {
            luaName = "P_N_RET",
            name = "Номер возвратного насоса",
            meter = "na",
        },
        P_N_UPR = {
            luaName = "P_N_UPR",
            name = "Номер управляющего сигнала",
            meter = "na",
        },
        P_OS = {
            luaName = "P_OS",
            name = "Обратная связь(готовность объекта к мойке)",
            meter = "na",
        },
        P_OBJ_EMPTY = {
            luaName = "P_OBJ_EMPTY",
            name = "Сигнал \"объект опорожнен\"",
            meter = "na",
        },
        P_PROGRAM_MASK = {
            luaName = "P_PROGRAM_MASK",
            name = "Маска доступных режимов мойки",
            meter = "na",
        },
        P_T_CLEAN_RINSING = {
            luaName = "P_T_CLEAN_RINSING",
            name = "Температура ополаскивания чистой водой",
            meter = "°С",
        },
        P_V_CLEAN_RINSING = {
            luaName = "P_V_CLEAN_RINSING",
            name = "Объем ополаскивания чистой водой",
            meter = "л",
        },
        P_T_SANITIZER_RINSING = {
            luaName = "P_T_SANITIZER_RINSING",
            name = "Температура ополаскивания после мойки дезинфецирующим средством",
            meter = "°С",
        },
        P_V_SANITIZER_RINSING = {
            luaName = "P_V_SANITIZER_RINSING",
            name = "Объем ополаскивания после мойки дезинфицирующим средством",
            meter = "л",
        },
        P_TM_MAX_TIME_OPORBACHOK = {
            luaName = "P_TM_MAX_TIME_OPORBACHOK",
            name = "Максимальное время от пропадания нижнего уровня в бачке, до завершения операции опорожнения бачка",
            meter = "с",
        },
        P_TM_RET_IS_EMPTY = {
            luaName = "P_TM_RET_IS_EMPTY",
            name = "Время отсутствия протока на возврате для окончания опорожнения объекта",
            meter = "с",
        },
        P_V_LL_BOT = {
            luaName = "P_V_LL_BOT",
            name = "Количество литров от пропадания нижнего уровня в бачке до завершения операции \"опорожнение бачка\"",
            meter = "л",
        },
        P_R_NO_FLOW = {
            luaName = "P_R_NO_FLOW",
            name = "Минимальный расход при котором считать, что его нет",
            meter = "m3/ч",
        },
        P_TM_R_NO_FLOW = {
            luaName = "P_TM_R_NO_FLOW",
            name = "Время возникновения ошибки \"нет расхода на подаче\"",
            meter = "с",
        },
        P_TM_NO_FLOW_R = {
            luaName = "P_TM_NO_FLOW_R",
            name = "Время появления ошибки \"нет расхода на возврате\"",
            meter = "с",
        },
        P_TM_NO_CONC = {
            luaName = "P_TM_NO_CONC",
            name = "Время появления ошибки \"нет концентрации в возвратной трубе\"",
            meter = "с",
        },
        P61_RESERV = {
            luaName = "P61_RESERV",
            name = "РТ. Требуемое значение",
            meter = "na",
        },
        PIDP_k = {
            luaName = "PIDP_k",
            name = "РТ. Параметр k",
            meter = "na",
        },
        PIDP_Ti = {
            luaName = "PIDP_Ti",
            name = "РТ. Параметр Ti",
            meter = "na",
        },
        PIDP_Td = {
            luaName = "PIDP_Td",
            name = "РТ. Параметр Td",
            meter = "na",
        },
        PIDP_dt = {
            luaName = "PIDP_dt",
            name = "РТ. Интервал расчёта",
            meter = "na",
        },
        PIDP_dmax = {
            luaName = "PIDP_dmax",
            name = "РТ. Мax значение входной величины",
            meter = "na",
        },
        PIDP_dmin = {
            luaName = "PIDP_dmin",
            name = "РТ. Мin значение входной величины",
            meter = "na",
        },
        PIDP_AccelTime = {
            luaName = "PIDP_AccelTime",
            name = "РТ. Время выхода",
            meter = "na",
        },
        PIDP_IsManualMode = {
            luaName = "PIDP_IsManualMode",
            name = "РТ. Ручной режим",
            meter = "na",
        },
        PIDP_UManual = {
            luaName = "PIDP_UManual",
            name = "РТ. Заданное ручное значение выхода",
            meter = "na",
        },
        PIDP_Uk = {
            luaName = "PIDP_Uk",
            name = "РТ. Выход ПИД",
            meter = "na",
        },
        P72_RESERV = {
            luaName = "P72_RESERV",
            name = "РР. Требуемое значение",
            meter = "na",
        },
        PIDF_k = {
            luaName = "PIDF_k",
            name = "РР. Параметр k",
            meter = "na",
        },
        PIDF_Ti = {
            luaName = "PIDF_Ti",
            name = "РР. Параметр Ti",
            meter = "na",
        },
        PIDF_Td = {
            luaName = "PIDF_Td",
            name = "РР. Параметр Td",
            meter = "na",
        },
        PIDF_dt = {
            luaName = "PIDF_dt",
            name = "РР. Интервал расчёта",
            meter = "na",
        },
        PIDF_dmax = {
            luaName = "PIDF_dmax",
            name = "РР. Мax значение входной величины",
            meter = "na",
        },
        PIDF_dmin = {
            luaName = "PIDF_dmin",
            name = "РР. Мin значение входной величины",
            meter = "na",
        },
        PIDF_AccelTime = {
            luaName = "PIDF_AccelTime",
            name = "РР. Время выхода",
            meter = "na",
        },
        PIDF_IsManualMode = {
            luaName = "PIDF_IsManualMode",
            name = "РР. Ручной режим",
            meter = "na",
        },
        PIDF_UManual = {
            luaName = "PIDF_UManual",
            name = "РР. Заданное ручное значение выхода",
            meter = "na",
        },
        PIDF_Uk = {
            luaName = "PIDF_Uk",
            name = "РР. Выход ПИД",
            meter = "na",
        },
        P_TM_MAX_TIME_OPORCIP = {
            luaName = "P_TM_MAX_TIME_OPORCIP",
            name = "Максимальное время операции \"Опорожнение объекта CIP\"",
            meter = "с",
        },
        P_SIGNAL_MEDIUM_CHANGE = {
            luaName = "P_SIGNAL_MEDIUM_CHANGE",
            name = "Сигнал OUT \"смена среды\"",
            meter = "na",
        },
        P_SIGNAL_CAUSTIC = {
            luaName = "P_SIGNAL_CAUSTIC",
            name = "Сигнал OUT \"Щелочь в трубе\"",
            meter = "na",
        },
        P_SIGNAL_ACID = {
            luaName = "P_SIGNAL_ACID",
            name = "Сигнал OUT \"Кислота в трубе\"",
            meter = "na",
        },
        P_SIGNAL_CIP_IN_PROGRESS = {
            luaName = "P_SIGNAL_CIP_IN_PROGRESS",
            name = "Сигнал OUT \"Мойка идет\"",
            meter = "na",
        },
        P_SIGNAL_CIPEND = {
            luaName = "P_SIGNAL_CIPEND",
            name = "Сигнал OUT \"Мойка завершена\"",
            meter = "na",
        },
        P_SIGNAL_CIP_READY = {
            luaName = "P_SIGNAL_CIP_READY",
            name = "Сигнал OUT \"Мойка готова\"",
            meter = "na",
        },
        P_SIGNAL_OBJECT_READY = {
            luaName = "P_SIGNAL_OBJECT_READY",
            name = "Сигнал IN \"Готовность объекта к мойке\"",
            meter = "na",
        },
        P_SIGNAL_SANITIZER_PUMP = {
            luaName = "P_SIGNAL_SANITIZER_PUMP",
            name = "Сигнал OUT \"Управление дозатором дезинфицирующего средства\"",
            meter = "na",
        },
        P_RESUME_CIP_ON_SIGNAL = {
            luaName = "P_RESUME_CIP_ON_SIGNAL",
            name = "Автоматическое возобновление мойки при пропадании \"ошибки объекта CIP\"",
            meter = "na",
        },
        P_SIGNAL_PUMP_CONTROL = {
            luaName = "P_SIGNAL_PUMP_CONTROL",
            name = "Сигнал IN analog \"Управление производительностью подающего насоса\"",
            meter = "na",
        },
        P_SIGNAL_DESINSECTION = {
            luaName = "P_SIGNAL_DESINSECTION",
            name = "Сигнал OUT \"Идет дезинфекция\"",
            meter = "na",
        },
        P_SIGNAL_OBJECT_PAUSE = {
            luaName = "P_SIGNAL_OBJECT_PAUSE",
            name = "Сигнал IN \"Пауза\"",
            meter = "na",
        },
        P_SIGNAL_CIRCULATION = {
            luaName = "P_SIGNAL_CIRCULATION",
            name = "Сигнал OUT \"Идет циркуляция\"",
            meter = "na",
        },
        P_SIGNAL_PUMP_CAN_RUN = {
            luaName = "P_SIGNAL_PUMP_CAN_RUN",
            name = "Сигнал in \"Возможно включение подающего насоса\"",
            meter = "na",
        },
        P_SIGNAL_PUMP_CONTROL_FEEDBACK = {
            luaName = "P_SIGNAL_PUMP_CONTROL_FEEDBACK",
            name = "Сигнал in analog \"Контролируемый уровень для насоса подачи\"",
            meter = "na",
        },
        P_SIGNAL_RET_PUMP_SENSOR = {
            luaName = "P_SIGNAL_RET_PUMP_SENSOR",
            name = "Сигнал датчика уровня для работы возвратного насоса",
            meter = "na",
        },
        P_RET_PUMP_SENSOR_DELAY = {
            luaName = "P_RET_PUMP_SENSOR_DELAY",
            name = "Задержка выключения возвратного насоса при пропадании сигнала датчика уровня",
            meter = "мс",
        },
        P_SIGNAL_IN_CIP_READY = {
            luaName = "P_SIGNAL_IN_CIP_READY",
            name = "Сигнал in \"Мойка идет\"",
            meter = "na",
        },
        P_SIGNAL_CIPEND2 = {
            luaName = "P_SIGNAL_CIPEND2",
            name = "Сигнал \"Мойка окончена 2\"",
            meter = "na",
        },
        P_SIGNAL_CAN_CONTINUE = {
            luaName = "P_SIGNAL_CAN_CONTINUE",
            name = "Сигнал \"Mожно продолжать мойку для операций циркуляции и промывки\"",
            meter = "na",
        },
        P_SIGNAL_WATER = {
            luaName = "P_SIGNAL_WATER",
            name = "Сигнал out \"Вода в трубе\"",
            meter = "na",
        },
        P_SIGNAL_PRERINSE = {
            luaName = "P_SIGNAL_PRERINSE",
            name = "Сигнал \"предварительное ополаскивание\"",
            meter = "na",
        },
        P_SIGNAL_INTERMEDIATE_RINSE = {
            luaName = "P_SIGNAL_INTERMEDIATE_RINSE",
            name = "Сигнал \"промежуточная промывка\"",
            meter = "na",
        },
        P_SIGNAL_POSTRINSE = {
            luaName = "P_SIGNAL_POSTRINSE",
            name = "Сигнал \"окончательная промывка\"",
            meter = "na",
        },
        P_SIGNAL_PUMP_STOPPED = {
            luaName = "P_SIGNAL_PUMP_STOPPED",
            name = "Сигнал \"подающий насос остановлен и нет потока\"",
            meter = "na",
        },
        P_SIGNAL_FLOW_TASK = {
            luaName = "P_SIGNAL_FLOW_TASK",
            name = "Сигнал  OUT analog \"задание потока\"",
            meter = "na",
        },
        P_SIGNAL_TEMP_TASK = {
            luaName = "P_SIGNAL_TEMP_TASK",
            name = "Сигнал \"задание температуры\"",
            meter = "na",
        },
        P_SIGNAL_WASH_ABORTED = {
            luaName = "P_SIGNAL_WASH_ABORTED",
            name = "Сигнал \"мойка закончена некорректно\"",
            meter = "na",
        },
        P_PRESSURE_CONTROL = {
            luaName = "P_PRESSURE_CONTROL",
            name = "Задание давления для регулятора",
            meter = "бар",
        },
        P_DONT_USE_WATER_TANK = {
            luaName = "P_DONT_USE_WATER_TANK",
            name = "Не использовать вторичную воду при мойке",
            meter = "na",
        },
        P_PIDP_MAX_OUT = {
            luaName = "P_PIDP_MAX_OUT",
            name = "Верхняя граница пересчета выхода ПИД-регулятора нагревания",
            meter = "°С",
        },
        P_PIDF_MAX_OUT = {
            luaName = "P_PIDF_MAX_OUT",
            name = "Верхняя граница пересчета выхода ПИД-регулятора расхода",
            meter = "m3/ч",
        },
        P_RESERV_START = {
            luaName = "P_RESERV_START",
            name = "Резерв",
            meter = "na",
        },
        P117_RESERV = {
            luaName = "P117_RESERV",
            name = "Резерв",
            meter = "na",
        },
        P118_RESERV = {
            luaName = "P118_RESERV",
            name = "Системный номер объекта мойки",
            meter = "na",
        },
        STP_QAVS = {
            luaName = "STP_QAVS",
            name = "Средняя концентрация щелочи",
            meter = "na",
        },
        STP_QAVK = {
            luaName = "STP_QAVK",
            name = "Средняя концентрация кислоты",
            meter = "na",
        },
        STP_WC = {
            luaName = "STP_WC",
            name = "Чистая вода",
            meter = "л",
        },
        STP_WS = {
            luaName = "STP_WS",
            name = "Вторичная вода",
            meter = "л",
        },
        STP_LV = {
            luaName = "STP_LV",
            name = "Промежуточный параметр",
            meter = "na",
        },
        STP_WC_INST_WS = {
            luaName = "STP_WC_INST_WS",
            name = "Чистая вода, использованная по причине нехватки вторичной",
            meter = "л",
        },
        STP_WASH_START = {
            luaName = "STP_WASH_START",
            name = "Время начала мойки (используется сервером для хранения)",
            meter = "na",
        },
        STP_STEPS_OVER = {
            luaName = "STP_STEPS_OVER",
            name = "Количество пропущенных операций",
            meter = "na",
        },
        STP_RESETSTEP = {
            luaName = "STP_RESETSTEP",
            name = "Шаг, на котором сбросили",
            meter = "na",
        },
        STP_ERRCOUNT = {
            luaName = "STP_ERRCOUNT",
            name = "Количество ошибок",
            meter = "na",
        },
        STP_USED_CAUSTIC = {
            luaName = "STP_USED_CAUSTIC",
            name = "Количество использованной щелочи",
            meter = "л",
        },
        STP_USED_ACID = {
            luaName = "STP_USED_ACID",
            name = "Количество использованной кислоты",
            meter = "л",
        },
        STP_LAST_STEP_COUNTER = {
            luaName = "STP_LAST_STEP_COUNTER",
            name = "Показание счетчика на предыдущей операции",
            meter = "л",
        },
        STP_LAST_STEP = {
            luaName = "STP_LAST_STEP",
            name = "Предыдущая операция",
            meter = "na",
        },
        STP_USED_HOTWATER = {
            luaName = "STP_USED_HOTWATER",
            name = "Количество воды на дезинфекции",
            meter = "na",
        },
        STP_PODP_CAUSTIC = {
            luaName = "STP_PODP_CAUSTIC",
            name = "Количество подпиток бачка на щелочи",
            meter = "na",
        },
        STP_PODP_ACID = {
            luaName = "STP_PODP_ACID",
            name = "Количество подпиток бачка на кислоте",
            meter = "na",
        },
        STP_PODP_WATER = {
            luaName = "STP_PODP_WATER",
            name = "Количество подпиток бачка на дезинфекции",
            meter = "na",
        },
        P137_RESERV = {
            luaName = "P137_RESERV",
            name = "Резерв",
            meter = "na",
        },
        P138_RESERV = {
            luaName = "P138_RESERV",
            name = "Резерв",
            meter = "na",
        },
        P139_RESERV = {
            luaName = "P139_RESERV",
            name = "Резерв",
            meter = "na",
        },
        P140_RESERV = {
            luaName = "P140_RESERV",
            name = "Резерв",
            meter = "na",
        },
    }
end

-- Здесь содержится список путей к модулям, добавляемым в шаблон управляющей программы "main.plua"
get_main_packages = function()
    return
    {
        ";./dairy-sys/?.lua",
    }
end
