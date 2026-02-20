--version  = 1
--Eplanner version = 2024.11.9095.41570
--PAC_name = 'BR1-МСА6'
------------------------------------------------------------------------------
------------------------------------------------------------------------------
init_tech_objects_modes = function()
    return
    {
    [ 1 ] =
        {
        n          = 1,
        tech_type  = 111,
        name       = 'Главный модуль мойки',
        name_eplan = 'LINE',
        name_BC    = 'LineObj',
        cooper_param_number = -1,
        base_tech_object = 'main_cip_module',
        rt_par_float =
            {
            [ 1 ] =
                {
                name = 'Расход концентрата при наведении',
                meter = 'na',
                nameLua = 'P_CONC_RATE'
                },
            [ 2 ] =
                {
                name = 'Текущее задание нагревания',
                meter = '°С',
                nameLua = 'P_ZAD_PODOGR'
                },
            [ 3 ] =
                {
                name = 'Текущее задание расхода',
                meter = 'm3/ч',
                nameLua = 'P_ZAD_FLOW'
                },
            [ 4 ] =
                {
                name = 'Заданный объем операции',
                meter = 'л',
                nameLua = 'P_VRAB'
                },
            [ 5 ] =
                {
                name = 'Максимальное время текущей операции',
                meter = 'с',
                nameLua = 'P_MAX_OPER_TM'
                },
            [ 6 ] =
                {
                name = 'Прошло времени текущей операции',
                meter = 'с',
                nameLua = 'P_OP_TIME_LEFT'
                },
            [ 7 ] =
                {
                name = 'Текущая концентрация',
                meter = '%',
                nameLua = 'P_CONC'
                },
            [ 8 ] =
                {
                name = 'Литров с начала операции',
                meter = 'л',
                nameLua = 'P_SUM_OP'
                },
            [ 9 ] =
                {
                name = 'Заданная концентрация',
                meter = '%',
                nameLua = 'P_ZAD_CONC'
                },
            [ 10 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P_LOADED_RECIPE'
                },
            [ 11 ] =
                {
                name = 'Программа мойки',
                meter = 'na',
                nameLua = 'P_PROGRAM'
                },
            [ 12 ] =
                {
                name = 'Номер выбранного рецепта на линии',
                meter = 'na',
                nameLua = 'P_CUR_REC'
                },
            [ 13 ] =
                {
                name = 'Состояние возвратного насоса',
                meter = 'na',
                nameLua = 'P_RET_STATE'
                },
            [ 14 ] =
                {
                name = 'Выбор рецепта',
                meter = 'na',
                nameLua = 'P_SELECT_REC'
                },
            [ 15 ] =
                {
                name = 'Выбор программы',
                meter = 'na',
                nameLua = 'P_SELECT_PRG'
                },
            [ 16 ] =
                {
                name = 'Объем V1 (от модуля до объекта)',
                meter = 'л',
                nameLua = 'PV1'
                },
            [ 17 ] =
                {
                name = 'Объем V2 (от объекта до модуля)',
                meter = 'л',
                nameLua = 'PV2'
                },
            [ 18 ] =
                {
                name = 'Тип объекта (танк, линия и пр.)',
                meter = 'na',
                nameLua = 'P_OBJ_TYPE'
                },
            [ 19 ] =
                {
                name = 'Расход',
                meter = 'm3/ч',
                nameLua = 'P_FLOW'
                },
            [ 20 ] =
                {
                name = 'Подпитывать ли бачок во время циркуляции',
                meter = 'na',
                nameLua = 'P_PODP_CIRC'
                },
            [ 21 ] =
                {
                name = 'Разница температур на подаче и возврате (если меньше заданной, то начинается отсчет времени циркуляции)',
                meter = '°С',
                nameLua = 'P_DELTA_TR'
                },
            [ 22 ] =
                {
                name = 'Температура предварительного ополаскивания',
                meter = '°С',
                nameLua = 'P_T_WP'
                },
            [ 23 ] =
                {
                name = 'Температура циркуляции на воде (операции не используются)',
                meter = '°С',
                nameLua = 'P_T_WSP'
                },
            [ 24 ] =
                {
                name = 'Температура промежуточных промывок после щелочи и кислоты',
                meter = '°С',
                nameLua = 'P_T_WKP'
                },
            [ 25 ] =
                {
                name = 'Температура окончательного ополаскивания',
                meter = '°С',
                nameLua = 'P_T_WOP'
                },
            [ 26 ] =
                {
                name = 'Температура мойки щелочью',
                meter = '°С',
                nameLua = 'P_T_S'
                },
            [ 27 ] =
                {
                name = 'Температура мойки кислотой',
                meter = '°С',
                nameLua = 'P_T_K'
                },
            [ 28 ] =
                {
                name = 'Температура дезинфекции на воде',
                meter = '°С',
                nameLua = 'P_T_D'
                },
            [ 29 ] =
                {
                name = 'Температура дезинфекции дезинфицирующим средством',
                meter = '°С',
                nameLua = 'P_T_SANITIZER'
                },
            [ 30 ] =
                {
                name = 'Дополнительный объем предварительного ополаскивания',
                meter = 'л',
                nameLua = 'P_DOP_V_PR_OP'
                },
            [ 31 ] =
                {
                name = 'Дополнительный объем ополаскивания после щелочи',
                meter = 'л',
                nameLua = 'P_DOP_V_AFTER_S'
                },
            [ 32 ] =
                {
                name = 'Дополнительный объем ополаскивания после кислоты',
                meter = 'л',
                nameLua = 'P_DOP_V_AFTER_K'
                },
            [ 33 ] =
                {
                name = 'Дополнительный объем окончательного ополаскивания',
                meter = 'л',
                nameLua = 'P_DOP_V_OK_OP'
                },
            [ 34 ] =
                {
                name = 'Объем до конца V1 для остановки возвратного насоса',
                meter = 'л',
                nameLua = 'P_RET_STOP'
                },
            [ 35 ] =
                {
                name = 'Количество литров выше среднего уровня при котором заканчивается заполнение бачка циркуляции',
                meter = 'л',
                nameLua = 'P_V_RAB_ML'
                },
            [ 36 ] =
                {
                name = 'Через сколько литров после начала подачи V2 включать возвратный насос',
                meter = 'л',
                nameLua = 'PV_RET_DEL'
                },
            [ 37 ] =
                {
                name = 'Время циркуляции при ополаскивании (операции не используются)',
                meter = 'с',
                nameLua = 'PTM_OP'
                },
            [ 38 ] =
                {
                name = 'Время циркуляции на щелочи',
                meter = 'с',
                nameLua = 'PTM_S'
                },
            [ 39 ] =
                {
                name = 'Время циркуляции на кислоте',
                meter = 'с',
                nameLua = 'PTM_K'
                },
            [ 40 ] =
                {
                name = 'Время циркуляции на щелочи при мойке кислота+щелочь',
                meter = 'с',
                nameLua = 'PTM_S_SK'
                },
            [ 41 ] =
                {
                name = 'Время циркуляции на кислоте при мойке кислота+щелочь',
                meter = 'с',
                nameLua = 'PTM_K_SK'
                },
            [ 42 ] =
                {
                name = 'Время дезинфекции на воде',
                meter = 'с',
                nameLua = 'PTM_D'
                },
            [ 43 ] =
                {
                name = 'Время дезинфекции дезинфицирующим средством',
                meter = 'с',
                nameLua = 'PTM_SANITIZER'
                },
            [ 44 ] =
                {
                name = 'Объем дезинфицирующего средства при дезинфекции',
                meter = 'мл',
                nameLua = 'PTM_SANITIZER_INJECT'
                },
            [ 45 ] =
                {
                name = 'Номер возвратного насоса',
                meter = 'na',
                nameLua = 'P_N_RET'
                },
            [ 46 ] =
                {
                name = 'Номер управляющего сигнала',
                meter = 'na',
                nameLua = 'P_N_UPR'
                },
            [ 47 ] =
                {
                name = 'Обратная связь(готовность объекта к мойке)',
                meter = 'na',
                nameLua = 'P_OS'
                },
            [ 48 ] =
                {
                name = 'Сигнал "объект опорожнен"',
                meter = 'na',
                nameLua = 'P_OBJ_EMPTY'
                },
            [ 49 ] =
                {
                name = 'Маска доступных режимов мойки',
                meter = 'na',
                nameLua = 'P_PROGRAM_MASK'
                },
            [ 50 ] =
                {
                name = 'Температура ополаскивания чистой водой',
                meter = '°С',
                nameLua = 'P_T_CLEAN_RINSING'
                },
            [ 51 ] =
                {
                name = 'Объем ополаскивания чистой водой',
                meter = 'л',
                nameLua = 'P_V_CLEAN_RINSING'
                },
            [ 52 ] =
                {
                name = 'Температура ополаскивания после мойки дезинфецирующим средством',
                meter = '°С',
                nameLua = 'P_T_SANITIZER_RINSING'
                },
            [ 53 ] =
                {
                name = 'Объем ополаскивания после мойки дезинфицирующим средством',
                meter = 'л',
                nameLua = 'P_V_SANITIZER_RINSING'
                },
            [ 54 ] =
                {
                name = 'Максимальное время от пропадания нижнего уровня в бачке, до завершения операции опорожнения бачка',
                meter = 'с',
                nameLua = 'P_TM_MAX_TIME_OPORBACHOK'
                },
            [ 55 ] =
                {
                name = 'Время отсутствия протока на возврате для окончания опорожнения объекта',
                meter = 'с',
                nameLua = 'P_TM_RET_IS_EMPTY'
                },
            [ 56 ] =
                {
                name = 'Количество литров от пропадания нижнего уровня в бачке до завершения операции "опорожнение бачка"',
                meter = 'л',
                nameLua = 'P_V_LL_BOT'
                },
            [ 57 ] =
                {
                name = 'Минимальный расход при котором считать, что его нет',
                meter = 'm3/ч',
                nameLua = 'P_R_NO_FLOW'
                },
            [ 58 ] =
                {
                name = 'Время возникновения ошибки "нет расхода на подаче"',
                meter = 'с',
                nameLua = 'P_TM_R_NO_FLOW'
                },
            [ 59 ] =
                {
                name = 'Время появления ошибки "нет расхода на возврате"',
                meter = 'с',
                nameLua = 'P_TM_NO_FLOW_R'
                },
            [ 60 ] =
                {
                name = 'Время появления ошибки "нет концентрации в возвратной трубе"',
                meter = 'с',
                nameLua = 'P_TM_NO_CONC'
                },
            [ 61 ] =
                {
                name = 'РТ. Требуемое значение',
                meter = 'na',
                nameLua = 'P61_RESERV'
                },
            [ 62 ] =
                {
                name = 'РТ. Параметр k',
                meter = 'na',
                nameLua = 'PIDP_k'
                },
            [ 63 ] =
                {
                name = 'РТ. Параметр Ti',
                meter = 'na',
                nameLua = 'PIDP_Ti'
                },
            [ 64 ] =
                {
                name = 'РТ. Параметр Td',
                meter = 'na',
                nameLua = 'PIDP_Td'
                },
            [ 65 ] =
                {
                name = 'РТ. Интервал расчёта',
                meter = 'na',
                nameLua = 'PIDP_dt'
                },
            [ 66 ] =
                {
                name = 'РТ. Мax значение входной величины',
                meter = 'na',
                nameLua = 'PIDP_dmax'
                },
            [ 67 ] =
                {
                name = 'РТ. Мin значение входной величины',
                meter = 'na',
                nameLua = 'PIDP_dmin'
                },
            [ 68 ] =
                {
                name = 'РТ. Время выхода',
                meter = 'na',
                nameLua = 'PIDP_AccelTime'
                },
            [ 69 ] =
                {
                name = 'РТ. Ручной режим',
                meter = 'na',
                nameLua = 'PIDP_IsManualMode'
                },
            [ 70 ] =
                {
                name = 'РТ. Заданное ручное значение выхода',
                meter = 'na',
                nameLua = 'PIDP_UManual'
                },
            [ 71 ] =
                {
                name = 'РТ. Выход ПИД',
                meter = 'na',
                nameLua = 'PIDP_Uk'
                },
            [ 72 ] =
                {
                name = 'РР. Требуемое значение',
                meter = 'na',
                nameLua = 'P72_RESERV'
                },
            [ 73 ] =
                {
                name = 'РР. Параметр k',
                meter = 'na',
                nameLua = 'PIDF_k'
                },
            [ 74 ] =
                {
                name = 'РР. Параметр Ti',
                meter = 'na',
                nameLua = 'PIDF_Ti'
                },
            [ 75 ] =
                {
                name = 'РР. Параметр Td',
                meter = 'na',
                nameLua = 'PIDF_Td'
                },
            [ 76 ] =
                {
                name = 'РР. Интервал расчёта',
                meter = 'na',
                nameLua = 'PIDF_dt'
                },
            [ 77 ] =
                {
                name = 'РР. Мax значение входной величины',
                meter = 'na',
                nameLua = 'PIDF_dmax'
                },
            [ 78 ] =
                {
                name = 'РР. Мin значение входной величины',
                meter = 'na',
                nameLua = 'PIDF_dmin'
                },
            [ 79 ] =
                {
                name = 'РР. Время выхода',
                meter = 'na',
                nameLua = 'PIDF_AccelTime'
                },
            [ 80 ] =
                {
                name = 'РР. Ручной режим',
                meter = 'na',
                nameLua = 'PIDF_IsManualMode'
                },
            [ 81 ] =
                {
                name = 'РР. Заданное ручное значение выхода',
                meter = 'na',
                nameLua = 'PIDF_UManual'
                },
            [ 82 ] =
                {
                name = 'РР. Выход ПИД',
                meter = 'na',
                nameLua = 'PIDF_Uk'
                },
            [ 83 ] =
                {
                name = 'Максимальное время операции "Опорожнение объекта CIP"',
                meter = 'с',
                nameLua = 'P_TM_MAX_TIME_OPORCIP'
                },
            [ 84 ] =
                {
                name = 'Сигнал OUT "смена среды"',
                meter = 'na',
                nameLua = 'P_SIGNAL_MEDIUM_CHANGE'
                },
            [ 85 ] =
                {
                name = 'Сигнал OUT "Щелочь в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CAUSTIC'
                },
            [ 86 ] =
                {
                name = 'Сигнал OUT "Кислота в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_ACID'
                },
            [ 87 ] =
                {
                name = 'Сигнал OUT "Мойка идет"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIP_IN_PROGRESS'
                },
            [ 88 ] =
                {
                name = 'Сигнал OUT "Мойка завершена"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIPEND'
                },
            [ 89 ] =
                {
                name = 'Сигнал OUT "Мойка готова"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIP_READY'
                },
            [ 90 ] =
                {
                name = 'Сигнал IN "Готовность объекта к мойке"',
                meter = 'na',
                nameLua = 'P_SIGNAL_OBJECT_READY'
                },
            [ 91 ] =
                {
                name = 'Сигнал OUT "Управление дозатором дезинфицирующего средства"',
                meter = 'na',
                nameLua = 'P_SIGNAL_SANITIZER_PUMP'
                },
            [ 92 ] =
                {
                name = 'Автоматическое возобновление мойки при пропадании "ошибки объекта CIP"',
                meter = 'na',
                nameLua = 'P_RESUME_CIP_ON_SIGNAL'
                },
            [ 93 ] =
                {
                name = 'Сигнал IN analog "Управление производительностью подающего насоса"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CONTROL'
                },
            [ 94 ] =
                {
                name = 'Сигнал OUT "Идет дезинфекция"',
                meter = 'na',
                nameLua = 'P_SIGNAL_DESINSECTION'
                },
            [ 95 ] =
                {
                name = 'Сигнал IN "Пауза"',
                meter = 'na',
                nameLua = 'P_SIGNAL_OBJECT_PAUSE'
                },
            [ 96 ] =
                {
                name = 'Сигнал OUT "Идет циркуляция"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIRCULATION'
                },
            [ 97 ] =
                {
                name = 'Сигнал in "Возможно включение подающего насоса"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CAN_RUN'
                },
            [ 98 ] =
                {
                name = 'Сигнал in analog "Контролируемый уровень для насоса подачи"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CONTROL_FEEDBACK'
                },
            [ 99 ] =
                {
                name = 'Сигнал датчика уровня для работы возвратного насоса',
                meter = 'na',
                nameLua = 'P_SIGNAL_RET_PUMP_SENSOR'
                },
            [ 100 ] =
                {
                name = 'Задержка выключения возвратного насоса при пропадании сигнала датчика уровня',
                meter = 'мс',
                nameLua = 'P_RET_PUMP_SENSOR_DELAY'
                },
            [ 101 ] =
                {
                name = 'Сигнал in "Мойка идет"',
                meter = 'na',
                nameLua = 'P_SIGNAL_IN_CIP_READY'
                },
            [ 102 ] =
                {
                name = 'Сигнал "Мойка окончена 2"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIPEND2'
                },
            [ 103 ] =
                {
                name = 'Сигнал "Mожно продолжать мойку для операций циркуляции и промывки"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CAN_CONTINUE'
                },
            [ 104 ] =
                {
                name = 'Сигнал out "Вода в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_WATER'
                },
            [ 105 ] =
                {
                name = 'Сигнал "предварительное ополаскивание"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PRERINSE'
                },
            [ 106 ] =
                {
                name = 'Сигнал "промежуточная промывка"',
                meter = 'na',
                nameLua = 'P_SIGNAL_INTERMEDIATE_RINSE'
                },
            [ 107 ] =
                {
                name = 'Сигнал "окончательная промывка"',
                meter = 'na',
                nameLua = 'P_SIGNAL_POSTRINSE'
                },
            [ 108 ] =
                {
                name = 'Сигнал "подающий насос остановлен и нет потока"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_STOPPED'
                },
            [ 109 ] =
                {
                name = 'Сигнал  OUT analog "задание потока"',
                meter = 'na',
                nameLua = 'P_SIGNAL_FLOW_TASK'
                },
            [ 110 ] =
                {
                name = 'Сигнал "задание температуры"',
                meter = 'na',
                nameLua = 'P_SIGNAL_TEMP_TASK'
                },
            [ 111 ] =
                {
                name = 'Сигнал "мойка закончена некорректно"',
                meter = 'na',
                nameLua = 'P_SIGNAL_WASH_ABORTED'
                },
            [ 112 ] =
                {
                name = 'Задание давления для регулятора',
                meter = 'бар',
                nameLua = 'P_PRESSURE_CONTROL'
                },
            [ 113 ] =
                {
                name = 'Не использовать вторичную воду при мойке',
                meter = 'na',
                nameLua = 'P_DONT_USE_WATER_TANK'
                },
            [ 114 ] =
                {
                name = 'Верхняя граница пересчета выхода ПИД-регулятора нагревания',
                meter = '°С',
                nameLua = 'P_PIDP_MAX_OUT'
                },
            [ 115 ] =
                {
                name = 'Верхняя граница пересчета выхода ПИД-регулятора расхода',
                meter = 'm3/ч',
                nameLua = 'P_PIDF_MAX_OUT'
                },
            [ 116 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P_RESERV_START'
                },
            [ 117 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P117_RESERV'
                },
            [ 118 ] =
                {
                name = 'Системный номер объекта мойки',
                meter = 'na',
                nameLua = 'P118_RESERV'
                },
            [ 119 ] =
                {
                name = 'Средняя концентрация щелочи',
                meter = 'na',
                nameLua = 'STP_QAVS'
                },
            [ 120 ] =
                {
                name = 'Средняя концентрация кислоты',
                meter = 'na',
                nameLua = 'STP_QAVK'
                },
            [ 121 ] =
                {
                name = 'Чистая вода',
                meter = 'л',
                nameLua = 'STP_WC'
                },
            [ 122 ] =
                {
                name = 'Вторичная вода',
                meter = 'л',
                nameLua = 'STP_WS'
                },
            [ 123 ] =
                {
                name = 'Промежуточный параметр',
                meter = 'na',
                nameLua = 'STP_LV'
                },
            [ 124 ] =
                {
                name = 'Чистая вода, использованная по причине нехватки вторичной',
                meter = 'л',
                nameLua = 'STP_WC_INST_WS'
                },
            [ 125 ] =
                {
                name = 'Время начала мойки (используется сервером для хранения)',
                meter = 'na',
                nameLua = 'STP_WASH_START'
                },
            [ 126 ] =
                {
                name = 'Количество пропущенных операций',
                meter = 'na',
                nameLua = 'STP_STEPS_OVER'
                },
            [ 127 ] =
                {
                name = 'Шаг, на котором сбросили',
                meter = 'na',
                nameLua = 'STP_RESETSTEP'
                },
            [ 128 ] =
                {
                name = 'Количество ошибок',
                meter = 'na',
                nameLua = 'STP_ERRCOUNT'
                },
            [ 129 ] =
                {
                name = 'Количество использованной щелочи',
                meter = 'л',
                nameLua = 'STP_USED_CAUSTIC'
                },
            [ 130 ] =
                {
                name = 'Количество использованной кислоты',
                meter = 'л',
                nameLua = 'STP_USED_ACID'
                },
            [ 131 ] =
                {
                name = 'Показание счетчика на предыдущей операции',
                meter = 'л',
                nameLua = 'STP_LAST_STEP_COUNTER'
                },
            [ 132 ] =
                {
                name = 'Предыдущая операция',
                meter = 'na',
                nameLua = 'STP_LAST_STEP'
                },
            [ 133 ] =
                {
                name = 'Количество воды на дезинфекции',
                meter = 'na',
                nameLua = 'STP_USED_HOTWATER'
                },
            [ 134 ] =
                {
                name = 'Количество подпиток бачка на щелочи',
                meter = 'na',
                nameLua = 'STP_PODP_CAUSTIC'
                },
            [ 135 ] =
                {
                name = 'Количество подпиток бачка на кислоте',
                meter = 'na',
                nameLua = 'STP_PODP_ACID'
                },
            [ 136 ] =
                {
                name = 'Количество подпиток бачка на дезинфекции',
                meter = 'na',
                nameLua = 'STP_PODP_WATER'
                },
            [ 137 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P137_RESERV'
                },
            [ 138 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P138_RESERV'
                },
            [ 139 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P139_RESERV'
                },
            [ 140 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P140_RESERV'
                },
            },
        system_parameters =
            {
            CONCENTRATION_ALKALI =
                {
                value = 1.3,
                },
            MIN_CONC_ALKALI =
                {
                value = 0.3,
                },
            MAX_CONCENTRATION_ALKALI =
                {
                value = 0.1,
                },
            CONCENTRATION_ACID =
                {
                value = 1.2,
                },
            MIN_CONCENTRATION_ACID =
                {
                value = 0.2,
                },
            MAX_CONCENTRATION_ACID =
                {
                value = 0.1,
                },
            CONCENTRATION_OVERSHOOT =
                {
                value = 3,
                },
            ALLOWANCE_CONCENTRATION =
                {
                value = 5,
                },
            RESERVE =
                {
                value = 0,
                },
            FLAG_ACTIVITY =
                {
                value = 0,
                },
            FACTOR_ACID =
                {
                value = 1.51,
                },
            FACTOR_ALKALI =
                {
                value = 1.8,
                },
            CONCENTATION_WORK_ALKALI =
                {
                value = 47,
                },
            CONCENTATION_WORK_ACID =
                {
                value = 54,
                },
            DENSITY_WORK_ALKALI =
                {
                value = 1.12,
                },
            DENSITY_WORK_ACID =
                {
                value = 1.45,
                },
            CONCENTATION_WORK_ALKALI_POINT =
                {
                value = 1,
                },
            CONDUCTION_WORK_ALKALI_POINT =
                {
                value = 52,
                },
            CONCENTATION_WORK_ACID_POINT =
                {
                value = 0.5,
                },
            CONDUCTION_WORK_ACID_POINT =
                {
                value = 30.8,
                },
            CONDUCTION_WATER_POINT =
                {
                value = 0.4,
                },
            CONCENTRATION_MEASUREMENT_TIME =
                {
                value = 30,
                },
            CIRCULATION_TIME =
                {
                value = 150,
                },
            SOLUTION_TEMPERATURE =
                {
                value = 50,
                },
            VALUE_ALKALI_TANK =
                {
                value = 6000,
                },
            VALUE_ACID_TANK =
                {
                value = 6000,
                },
            VALUE_WATER_TANK =
                {
                value = 6000,
                },
            PRODUCTIVITY_ACID =
                {
                value = 100,
                },
            PRODUCTIVITY_ALKALI =
                {
                value = 100,
                },
            PRODUCTIVITY_SOLUTION =
                {
                value = 25,
                },
            MAX_LEVEL_ALKALI =
                {
                value = 15,
                },
            MAX_LEVEL_ACID =
                {
                value = 1.5,
                },
            ALKALINE_SOLUTION_TYPE =
                {
                value = 10,
                },
            ACID_SOLUTION_TYPE =
                {
                value = 0.1,
                },
            DISINFECTION_SOLUTION_TYPE =
                {
                value = 100,
                },
            },

        modes =
            {
            },
        },
    [ 2 ] =
        {
        n          = 2,
        tech_type  = 111,
        name       = 'Вспомогательный модуль мойки',
        name_eplan = 'LINE',
        name_BC    = 'LineObj',
        cooper_param_number = -1,
        base_tech_object = 'aux_cip_module',
        rt_par_float =
            {
            [ 1 ] =
                {
                name = 'Расход концентрата при наведении',
                meter = 'na',
                nameLua = 'P_CONC_RATE'
                },
            [ 2 ] =
                {
                name = 'Текущее задание нагревания',
                meter = '°С',
                nameLua = 'P_ZAD_PODOGR'
                },
            [ 3 ] =
                {
                name = 'Текущее задание расхода',
                meter = 'm3/ч',
                nameLua = 'P_ZAD_FLOW'
                },
            [ 4 ] =
                {
                name = 'Заданный объем операции',
                meter = 'л',
                nameLua = 'P_VRAB'
                },
            [ 5 ] =
                {
                name = 'Максимальное время текущей операции',
                meter = 'с',
                nameLua = 'P_MAX_OPER_TM'
                },
            [ 6 ] =
                {
                name = 'Прошло времени текущей операции',
                meter = 'с',
                nameLua = 'P_OP_TIME_LEFT'
                },
            [ 7 ] =
                {
                name = 'Текущая концентрация',
                meter = '%',
                nameLua = 'P_CONC'
                },
            [ 8 ] =
                {
                name = 'Литров с начала операции',
                meter = 'л',
                nameLua = 'P_SUM_OP'
                },
            [ 9 ] =
                {
                name = 'Заданная концентрация',
                meter = '%',
                nameLua = 'P_ZAD_CONC'
                },
            [ 10 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P_LOADED_RECIPE'
                },
            [ 11 ] =
                {
                name = 'Программа мойки',
                meter = 'na',
                nameLua = 'P_PROGRAM'
                },
            [ 12 ] =
                {
                name = 'Номер выбранного рецепта на линии',
                meter = 'na',
                nameLua = 'P_CUR_REC'
                },
            [ 13 ] =
                {
                name = 'Состояние возвратного насоса',
                meter = 'na',
                nameLua = 'P_RET_STATE'
                },
            [ 14 ] =
                {
                name = 'Выбор рецепта',
                meter = 'na',
                nameLua = 'P_SELECT_REC'
                },
            [ 15 ] =
                {
                name = 'Выбор программы',
                meter = 'na',
                nameLua = 'P_SELECT_PRG'
                },
            [ 16 ] =
                {
                name = 'Объем V1 (от модуля до объекта)',
                meter = 'л',
                nameLua = 'PV1'
                },
            [ 17 ] =
                {
                name = 'Объем V2 (от объекта до модуля)',
                meter = 'л',
                nameLua = 'PV2'
                },
            [ 18 ] =
                {
                name = 'Тип объекта (танк, линия и пр.)',
                meter = 'na',
                nameLua = 'P_OBJ_TYPE'
                },
            [ 19 ] =
                {
                name = 'Расход',
                meter = 'm3/ч',
                nameLua = 'P_FLOW'
                },
            [ 20 ] =
                {
                name = 'Подпитывать ли бачок во время циркуляции',
                meter = 'na',
                nameLua = 'P_PODP_CIRC'
                },
            [ 21 ] =
                {
                name = 'Разница температур на подаче и возврате (если меньше заданной, то начинается отсчет времени циркуляции)',
                meter = '°С',
                nameLua = 'P_DELTA_TR'
                },
            [ 22 ] =
                {
                name = 'Температура предварительного ополаскивания',
                meter = '°С',
                nameLua = 'P_T_WP'
                },
            [ 23 ] =
                {
                name = 'Температура циркуляции на воде (операции не используются)',
                meter = '°С',
                nameLua = 'P_T_WSP'
                },
            [ 24 ] =
                {
                name = 'Температура промежуточных промывок после щелочи и кислоты',
                meter = '°С',
                nameLua = 'P_T_WKP'
                },
            [ 25 ] =
                {
                name = 'Температура окончательного ополаскивания',
                meter = '°С',
                nameLua = 'P_T_WOP'
                },
            [ 26 ] =
                {
                name = 'Температура мойки щелочью',
                meter = '°С',
                nameLua = 'P_T_S'
                },
            [ 27 ] =
                {
                name = 'Температура мойки кислотой',
                meter = '°С',
                nameLua = 'P_T_K'
                },
            [ 28 ] =
                {
                name = 'Температура дезинфекции на воде',
                meter = '°С',
                nameLua = 'P_T_D'
                },
            [ 29 ] =
                {
                name = 'Температура дезинфекции дезинфицирующим средством',
                meter = '°С',
                nameLua = 'P_T_SANITIZER'
                },
            [ 30 ] =
                {
                name = 'Дополнительный объем предварительного ополаскивания',
                meter = 'л',
                nameLua = 'P_DOP_V_PR_OP'
                },
            [ 31 ] =
                {
                name = 'Дополнительный объем ополаскивания после щелочи',
                meter = 'л',
                nameLua = 'P_DOP_V_AFTER_S'
                },
            [ 32 ] =
                {
                name = 'Дополнительный объем ополаскивания после кислоты',
                meter = 'л',
                nameLua = 'P_DOP_V_AFTER_K'
                },
            [ 33 ] =
                {
                name = 'Дополнительный объем окончательного ополаскивания',
                meter = 'л',
                nameLua = 'P_DOP_V_OK_OP'
                },
            [ 34 ] =
                {
                name = 'Объем до конца V1 для остановки возвратного насоса',
                meter = 'л',
                nameLua = 'P_RET_STOP'
                },
            [ 35 ] =
                {
                name = 'Количество литров выше среднего уровня при котором заканчивается заполнение бачка циркуляции',
                meter = 'л',
                nameLua = 'P_V_RAB_ML'
                },
            [ 36 ] =
                {
                name = 'Через сколько литров после начала подачи V2 включать возвратный насос',
                meter = 'л',
                nameLua = 'PV_RET_DEL'
                },
            [ 37 ] =
                {
                name = 'Время циркуляции при ополаскивании (операции не используются)',
                meter = 'с',
                nameLua = 'PTM_OP'
                },
            [ 38 ] =
                {
                name = 'Время циркуляции на щелочи',
                meter = 'с',
                nameLua = 'PTM_S'
                },
            [ 39 ] =
                {
                name = 'Время циркуляции на кислоте',
                meter = 'с',
                nameLua = 'PTM_K'
                },
            [ 40 ] =
                {
                name = 'Время циркуляции на щелочи при мойке кислота+щелочь',
                meter = 'с',
                nameLua = 'PTM_S_SK'
                },
            [ 41 ] =
                {
                name = 'Время циркуляции на кислоте при мойке кислота+щелочь',
                meter = 'с',
                nameLua = 'PTM_K_SK'
                },
            [ 42 ] =
                {
                name = 'Время дезинфекции на воде',
                meter = 'с',
                nameLua = 'PTM_D'
                },
            [ 43 ] =
                {
                name = 'Время дезинфекции дезинфицирующим средством',
                meter = 'с',
                nameLua = 'PTM_SANITIZER'
                },
            [ 44 ] =
                {
                name = 'Объем дезинфицирующего средства при дезинфекции',
                meter = 'мл',
                nameLua = 'PTM_SANITIZER_INJECT'
                },
            [ 45 ] =
                {
                name = 'Номер возвратного насоса',
                meter = 'na',
                nameLua = 'P_N_RET'
                },
            [ 46 ] =
                {
                name = 'Номер управляющего сигнала',
                meter = 'na',
                nameLua = 'P_N_UPR'
                },
            [ 47 ] =
                {
                name = 'Обратная связь(готовность объекта к мойке)',
                meter = 'na',
                nameLua = 'P_OS'
                },
            [ 48 ] =
                {
                name = 'Сигнал "объект опорожнен"',
                meter = 'na',
                nameLua = 'P_OBJ_EMPTY'
                },
            [ 49 ] =
                {
                name = 'Маска доступных режимов мойки',
                meter = 'na',
                nameLua = 'P_PROGRAM_MASK'
                },
            [ 50 ] =
                {
                name = 'Температура ополаскивания чистой водой',
                meter = '°С',
                nameLua = 'P_T_CLEAN_RINSING'
                },
            [ 51 ] =
                {
                name = 'Объем ополаскивания чистой водой',
                meter = 'л',
                nameLua = 'P_V_CLEAN_RINSING'
                },
            [ 52 ] =
                {
                name = 'Температура ополаскивания после мойки дезинфецирующим средством',
                meter = '°С',
                nameLua = 'P_T_SANITIZER_RINSING'
                },
            [ 53 ] =
                {
                name = 'Объем ополаскивания после мойки дезинфицирующим средством',
                meter = 'л',
                nameLua = 'P_V_SANITIZER_RINSING'
                },
            [ 54 ] =
                {
                name = 'Максимальное время от пропадания нижнего уровня в бачке, до завершения операции опорожнения бачка',
                meter = 'с',
                nameLua = 'P_TM_MAX_TIME_OPORBACHOK'
                },
            [ 55 ] =
                {
                name = 'Время отсутствия протока на возврате для окончания опорожнения объекта',
                meter = 'с',
                nameLua = 'P_TM_RET_IS_EMPTY'
                },
            [ 56 ] =
                {
                name = 'Количество литров от пропадания нижнего уровня в бачке до завершения операции "опорожнение бачка"',
                meter = 'л',
                nameLua = 'P_V_LL_BOT'
                },
            [ 57 ] =
                {
                name = 'Минимальный расход при котором считать, что его нет',
                meter = 'm3/ч',
                nameLua = 'P_R_NO_FLOW'
                },
            [ 58 ] =
                {
                name = 'Время возникновения ошибки "нет расхода на подаче"',
                meter = 'с',
                nameLua = 'P_TM_R_NO_FLOW'
                },
            [ 59 ] =
                {
                name = 'Время появления ошибки "нет расхода на возврате"',
                meter = 'с',
                nameLua = 'P_TM_NO_FLOW_R'
                },
            [ 60 ] =
                {
                name = 'Время появления ошибки "нет концентрации в возвратной трубе"',
                meter = 'с',
                nameLua = 'P_TM_NO_CONC'
                },
            [ 61 ] =
                {
                name = 'РТ. Требуемое значение',
                meter = 'na',
                nameLua = 'P61_RESERV'
                },
            [ 62 ] =
                {
                name = 'РТ. Параметр k',
                meter = 'na',
                nameLua = 'PIDP_k'
                },
            [ 63 ] =
                {
                name = 'РТ. Параметр Ti',
                meter = 'na',
                nameLua = 'PIDP_Ti'
                },
            [ 64 ] =
                {
                name = 'РТ. Параметр Td',
                meter = 'na',
                nameLua = 'PIDP_Td'
                },
            [ 65 ] =
                {
                name = 'РТ. Интервал расчёта',
                meter = 'na',
                nameLua = 'PIDP_dt'
                },
            [ 66 ] =
                {
                name = 'РТ. Мax значение входной величины',
                meter = 'na',
                nameLua = 'PIDP_dmax'
                },
            [ 67 ] =
                {
                name = 'РТ. Мin значение входной величины',
                meter = 'na',
                nameLua = 'PIDP_dmin'
                },
            [ 68 ] =
                {
                name = 'РТ. Время выхода',
                meter = 'na',
                nameLua = 'PIDP_AccelTime'
                },
            [ 69 ] =
                {
                name = 'РТ. Ручной режим',
                meter = 'na',
                nameLua = 'PIDP_IsManualMode'
                },
            [ 70 ] =
                {
                name = 'РТ. Заданное ручное значение выхода',
                meter = 'na',
                nameLua = 'PIDP_UManual'
                },
            [ 71 ] =
                {
                name = 'РТ. Выход ПИД',
                meter = 'na',
                nameLua = 'PIDP_Uk'
                },
            [ 72 ] =
                {
                name = 'РР. Требуемое значение',
                meter = 'na',
                nameLua = 'P72_RESERV'
                },
            [ 73 ] =
                {
                name = 'РР. Параметр k',
                meter = 'na',
                nameLua = 'PIDF_k'
                },
            [ 74 ] =
                {
                name = 'РР. Параметр Ti',
                meter = 'na',
                nameLua = 'PIDF_Ti'
                },
            [ 75 ] =
                {
                name = 'РР. Параметр Td',
                meter = 'na',
                nameLua = 'PIDF_Td'
                },
            [ 76 ] =
                {
                name = 'РР. Интервал расчёта',
                meter = 'na',
                nameLua = 'PIDF_dt'
                },
            [ 77 ] =
                {
                name = 'РР. Мax значение входной величины',
                meter = 'na',
                nameLua = 'PIDF_dmax'
                },
            [ 78 ] =
                {
                name = 'РР. Мin значение входной величины',
                meter = 'na',
                nameLua = 'PIDF_dmin'
                },
            [ 79 ] =
                {
                name = 'РР. Время выхода',
                meter = 'na',
                nameLua = 'PIDF_AccelTime'
                },
            [ 80 ] =
                {
                name = 'РР. Ручной режим',
                meter = 'na',
                nameLua = 'PIDF_IsManualMode'
                },
            [ 81 ] =
                {
                name = 'РР. Заданное ручное значение выхода',
                meter = 'na',
                nameLua = 'PIDF_UManual'
                },
            [ 82 ] =
                {
                name = 'РР. Выход ПИД',
                meter = 'na',
                nameLua = 'PIDF_Uk'
                },
            [ 83 ] =
                {
                name = 'Максимальное время операции "Опорожнение объекта CIP"',
                meter = 'с',
                nameLua = 'P_TM_MAX_TIME_OPORCIP'
                },
            [ 84 ] =
                {
                name = 'Сигнал OUT "смена среды"',
                meter = 'na',
                nameLua = 'P_SIGNAL_MEDIUM_CHANGE'
                },
            [ 85 ] =
                {
                name = 'Сигнал OUT "Щелочь в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CAUSTIC'
                },
            [ 86 ] =
                {
                name = 'Сигнал OUT "Кислота в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_ACID'
                },
            [ 87 ] =
                {
                name = 'Сигнал OUT "Мойка идет"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIP_IN_PROGRESS'
                },
            [ 88 ] =
                {
                name = 'Сигнал OUT "Мойка завершена"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIPEND'
                },
            [ 89 ] =
                {
                name = 'Сигнал OUT "Мойка готова"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIP_READY'
                },
            [ 90 ] =
                {
                name = 'Сигнал IN "Готовность объекта к мойке"',
                meter = 'na',
                nameLua = 'P_SIGNAL_OBJECT_READY'
                },
            [ 91 ] =
                {
                name = 'Сигнал OUT "Управление дозатором дезинфицирующего средства"',
                meter = 'na',
                nameLua = 'P_SIGNAL_SANITIZER_PUMP'
                },
            [ 92 ] =
                {
                name = 'Автоматическое возобновление мойки при пропадании "ошибки объекта CIP"',
                meter = 'na',
                nameLua = 'P_RESUME_CIP_ON_SIGNAL'
                },
            [ 93 ] =
                {
                name = 'Сигнал IN analog "Управление производительностью подающего насоса"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CONTROL'
                },
            [ 94 ] =
                {
                name = 'Сигнал OUT "Идет дезинфекция"',
                meter = 'na',
                nameLua = 'P_SIGNAL_DESINSECTION'
                },
            [ 95 ] =
                {
                name = 'Сигнал IN "Пауза"',
                meter = 'na',
                nameLua = 'P_SIGNAL_OBJECT_PAUSE'
                },
            [ 96 ] =
                {
                name = 'Сигнал OUT "Идет циркуляция"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIRCULATION'
                },
            [ 97 ] =
                {
                name = 'Сигнал in "Возможно включение подающего насоса"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CAN_RUN'
                },
            [ 98 ] =
                {
                name = 'Сигнал in analog "Контролируемый уровень для насоса подачи"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CONTROL_FEEDBACK'
                },
            [ 99 ] =
                {
                name = 'Сигнал датчика уровня для работы возвратного насоса',
                meter = 'na',
                nameLua = 'P_SIGNAL_RET_PUMP_SENSOR'
                },
            [ 100 ] =
                {
                name = 'Задержка выключения возвратного насоса при пропадании сигнала датчика уровня',
                meter = 'мс',
                nameLua = 'P_RET_PUMP_SENSOR_DELAY'
                },
            [ 101 ] =
                {
                name = 'Сигнал in "Мойка идет"',
                meter = 'na',
                nameLua = 'P_SIGNAL_IN_CIP_READY'
                },
            [ 102 ] =
                {
                name = 'Сигнал "Мойка окончена 2"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIPEND2'
                },
            [ 103 ] =
                {
                name = 'Сигнал "Mожно продолжать мойку для операций циркуляции и промывки"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CAN_CONTINUE'
                },
            [ 104 ] =
                {
                name = 'Сигнал out "Вода в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_WATER'
                },
            [ 105 ] =
                {
                name = 'Сигнал "предварительное ополаскивание"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PRERINSE'
                },
            [ 106 ] =
                {
                name = 'Сигнал "промежуточная промывка"',
                meter = 'na',
                nameLua = 'P_SIGNAL_INTERMEDIATE_RINSE'
                },
            [ 107 ] =
                {
                name = 'Сигнал "окончательная промывка"',
                meter = 'na',
                nameLua = 'P_SIGNAL_POSTRINSE'
                },
            [ 108 ] =
                {
                name = 'Сигнал "подающий насос остановлен и нет потока"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_STOPPED'
                },
            [ 109 ] =
                {
                name = 'Сигнал  OUT analog "задание потока"',
                meter = 'na',
                nameLua = 'P_SIGNAL_FLOW_TASK'
                },
            [ 110 ] =
                {
                name = 'Сигнал "задание температуры"',
                meter = 'na',
                nameLua = 'P_SIGNAL_TEMP_TASK'
                },
            [ 111 ] =
                {
                name = 'Сигнал "мойка закончена некорректно"',
                meter = 'na',
                nameLua = 'P_SIGNAL_WASH_ABORTED'
                },
            [ 112 ] =
                {
                name = 'Задание давления для регулятора',
                meter = 'бар',
                nameLua = 'P_PRESSURE_CONTROL'
                },
            [ 113 ] =
                {
                name = 'Не использовать вторичную воду при мойке',
                meter = 'na',
                nameLua = 'P_DONT_USE_WATER_TANK'
                },
            [ 114 ] =
                {
                name = 'Верхняя граница пересчета выхода ПИД-регулятора нагревания',
                meter = '°С',
                nameLua = 'P_PIDP_MAX_OUT'
                },
            [ 115 ] =
                {
                name = 'Верхняя граница пересчета выхода ПИД-регулятора расхода',
                meter = 'm3/ч',
                nameLua = 'P_PIDF_MAX_OUT'
                },
            [ 116 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P_RESERV_START'
                },
            [ 117 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P117_RESERV'
                },
            [ 118 ] =
                {
                name = 'Системный номер объекта мойки',
                meter = 'na',
                nameLua = 'P118_RESERV'
                },
            [ 119 ] =
                {
                name = 'Средняя концентрация щелочи',
                meter = 'na',
                nameLua = 'STP_QAVS'
                },
            [ 120 ] =
                {
                name = 'Средняя концентрация кислоты',
                meter = 'na',
                nameLua = 'STP_QAVK'
                },
            [ 121 ] =
                {
                name = 'Чистая вода',
                meter = 'л',
                nameLua = 'STP_WC'
                },
            [ 122 ] =
                {
                name = 'Вторичная вода',
                meter = 'л',
                nameLua = 'STP_WS'
                },
            [ 123 ] =
                {
                name = 'Промежуточный параметр',
                meter = 'na',
                nameLua = 'STP_LV'
                },
            [ 124 ] =
                {
                name = 'Чистая вода, использованная по причине нехватки вторичной',
                meter = 'л',
                nameLua = 'STP_WC_INST_WS'
                },
            [ 125 ] =
                {
                name = 'Время начала мойки (используется сервером для хранения)',
                meter = 'na',
                nameLua = 'STP_WASH_START'
                },
            [ 126 ] =
                {
                name = 'Количество пропущенных операций',
                meter = 'na',
                nameLua = 'STP_STEPS_OVER'
                },
            [ 127 ] =
                {
                name = 'Шаг, на котором сбросили',
                meter = 'na',
                nameLua = 'STP_RESETSTEP'
                },
            [ 128 ] =
                {
                name = 'Количество ошибок',
                meter = 'na',
                nameLua = 'STP_ERRCOUNT'
                },
            [ 129 ] =
                {
                name = 'Количество использованной щелочи',
                meter = 'л',
                nameLua = 'STP_USED_CAUSTIC'
                },
            [ 130 ] =
                {
                name = 'Количество использованной кислоты',
                meter = 'л',
                nameLua = 'STP_USED_ACID'
                },
            [ 131 ] =
                {
                name = 'Показание счетчика на предыдущей операции',
                meter = 'л',
                nameLua = 'STP_LAST_STEP_COUNTER'
                },
            [ 132 ] =
                {
                name = 'Предыдущая операция',
                meter = 'na',
                nameLua = 'STP_LAST_STEP'
                },
            [ 133 ] =
                {
                name = 'Количество воды на дезинфекции',
                meter = 'na',
                nameLua = 'STP_USED_HOTWATER'
                },
            [ 134 ] =
                {
                name = 'Количество подпиток бачка на щелочи',
                meter = 'na',
                nameLua = 'STP_PODP_CAUSTIC'
                },
            [ 135 ] =
                {
                name = 'Количество подпиток бачка на кислоте',
                meter = 'na',
                nameLua = 'STP_PODP_ACID'
                },
            [ 136 ] =
                {
                name = 'Количество подпиток бачка на дезинфекции',
                meter = 'na',
                nameLua = 'STP_PODP_WATER'
                },
            [ 137 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P137_RESERV'
                },
            [ 138 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P138_RESERV'
                },
            [ 139 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P139_RESERV'
                },
            [ 140 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P140_RESERV'
                },
            },

        modes =
            {
            },
        },
    [ 3 ] =
        {
        n          = 3,
        tech_type  = 111,
        name       = 'Вспомогательный модуль мойки',
        name_eplan = 'LINE',
        name_BC    = 'LineObj',
        cooper_param_number = -1,
        base_tech_object = 'aux_cip_module',
        rt_par_float =
            {
            [ 1 ] =
                {
                name = 'Расход концентрата при наведении',
                meter = 'na',
                nameLua = 'P_CONC_RATE'
                },
            [ 2 ] =
                {
                name = 'Текущее задание нагревания',
                meter = '°С',
                nameLua = 'P_ZAD_PODOGR'
                },
            [ 3 ] =
                {
                name = 'Текущее задание расхода',
                meter = 'm3/ч',
                nameLua = 'P_ZAD_FLOW'
                },
            [ 4 ] =
                {
                name = 'Заданный объем операции',
                meter = 'л',
                nameLua = 'P_VRAB'
                },
            [ 5 ] =
                {
                name = 'Максимальное время текущей операции',
                meter = 'с',
                nameLua = 'P_MAX_OPER_TM'
                },
            [ 6 ] =
                {
                name = 'Прошло времени текущей операции',
                meter = 'с',
                nameLua = 'P_OP_TIME_LEFT'
                },
            [ 7 ] =
                {
                name = 'Текущая концентрация',
                meter = '%',
                nameLua = 'P_CONC'
                },
            [ 8 ] =
                {
                name = 'Литров с начала операции',
                meter = 'л',
                nameLua = 'P_SUM_OP'
                },
            [ 9 ] =
                {
                name = 'Заданная концентрация',
                meter = '%',
                nameLua = 'P_ZAD_CONC'
                },
            [ 10 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P_LOADED_RECIPE'
                },
            [ 11 ] =
                {
                name = 'Программа мойки',
                meter = 'na',
                nameLua = 'P_PROGRAM'
                },
            [ 12 ] =
                {
                name = 'Номер выбранного рецепта на линии',
                meter = 'na',
                nameLua = 'P_CUR_REC'
                },
            [ 13 ] =
                {
                name = 'Состояние возвратного насоса',
                meter = 'na',
                nameLua = 'P_RET_STATE'
                },
            [ 14 ] =
                {
                name = 'Выбор рецепта',
                meter = 'na',
                nameLua = 'P_SELECT_REC'
                },
            [ 15 ] =
                {
                name = 'Выбор программы',
                meter = 'na',
                nameLua = 'P_SELECT_PRG'
                },
            [ 16 ] =
                {
                name = 'Объем V1 (от модуля до объекта)',
                meter = 'л',
                nameLua = 'PV1'
                },
            [ 17 ] =
                {
                name = 'Объем V2 (от объекта до модуля)',
                meter = 'л',
                nameLua = 'PV2'
                },
            [ 18 ] =
                {
                name = 'Тип объекта (танк, линия и пр.)',
                meter = 'na',
                nameLua = 'P_OBJ_TYPE'
                },
            [ 19 ] =
                {
                name = 'Расход',
                meter = 'm3/ч',
                nameLua = 'P_FLOW'
                },
            [ 20 ] =
                {
                name = 'Подпитывать ли бачок во время циркуляции',
                meter = 'na',
                nameLua = 'P_PODP_CIRC'
                },
            [ 21 ] =
                {
                name = 'Разница температур на подаче и возврате (если меньше заданной, то начинается отсчет времени циркуляции)',
                meter = '°С',
                nameLua = 'P_DELTA_TR'
                },
            [ 22 ] =
                {
                name = 'Температура предварительного ополаскивания',
                meter = '°С',
                nameLua = 'P_T_WP'
                },
            [ 23 ] =
                {
                name = 'Температура циркуляции на воде (операции не используются)',
                meter = '°С',
                nameLua = 'P_T_WSP'
                },
            [ 24 ] =
                {
                name = 'Температура промежуточных промывок после щелочи и кислоты',
                meter = '°С',
                nameLua = 'P_T_WKP'
                },
            [ 25 ] =
                {
                name = 'Температура окончательного ополаскивания',
                meter = '°С',
                nameLua = 'P_T_WOP'
                },
            [ 26 ] =
                {
                name = 'Температура мойки щелочью',
                meter = '°С',
                nameLua = 'P_T_S'
                },
            [ 27 ] =
                {
                name = 'Температура мойки кислотой',
                meter = '°С',
                nameLua = 'P_T_K'
                },
            [ 28 ] =
                {
                name = 'Температура дезинфекции на воде',
                meter = '°С',
                nameLua = 'P_T_D'
                },
            [ 29 ] =
                {
                name = 'Температура дезинфекции дезинфицирующим средством',
                meter = '°С',
                nameLua = 'P_T_SANITIZER'
                },
            [ 30 ] =
                {
                name = 'Дополнительный объем предварительного ополаскивания',
                meter = 'л',
                nameLua = 'P_DOP_V_PR_OP'
                },
            [ 31 ] =
                {
                name = 'Дополнительный объем ополаскивания после щелочи',
                meter = 'л',
                nameLua = 'P_DOP_V_AFTER_S'
                },
            [ 32 ] =
                {
                name = 'Дополнительный объем ополаскивания после кислоты',
                meter = 'л',
                nameLua = 'P_DOP_V_AFTER_K'
                },
            [ 33 ] =
                {
                name = 'Дополнительный объем окончательного ополаскивания',
                meter = 'л',
                nameLua = 'P_DOP_V_OK_OP'
                },
            [ 34 ] =
                {
                name = 'Объем до конца V1 для остановки возвратного насоса',
                meter = 'л',
                nameLua = 'P_RET_STOP'
                },
            [ 35 ] =
                {
                name = 'Количество литров выше среднего уровня при котором заканчивается заполнение бачка циркуляции',
                meter = 'л',
                nameLua = 'P_V_RAB_ML'
                },
            [ 36 ] =
                {
                name = 'Через сколько литров после начала подачи V2 включать возвратный насос',
                meter = 'л',
                nameLua = 'PV_RET_DEL'
                },
            [ 37 ] =
                {
                name = 'Время циркуляции при ополаскивании (операции не используются)',
                meter = 'с',
                nameLua = 'PTM_OP'
                },
            [ 38 ] =
                {
                name = 'Время циркуляции на щелочи',
                meter = 'с',
                nameLua = 'PTM_S'
                },
            [ 39 ] =
                {
                name = 'Время циркуляции на кислоте',
                meter = 'с',
                nameLua = 'PTM_K'
                },
            [ 40 ] =
                {
                name = 'Время циркуляции на щелочи при мойке кислота+щелочь',
                meter = 'с',
                nameLua = 'PTM_S_SK'
                },
            [ 41 ] =
                {
                name = 'Время циркуляции на кислоте при мойке кислота+щелочь',
                meter = 'с',
                nameLua = 'PTM_K_SK'
                },
            [ 42 ] =
                {
                name = 'Время дезинфекции на воде',
                meter = 'с',
                nameLua = 'PTM_D'
                },
            [ 43 ] =
                {
                name = 'Время дезинфекции дезинфицирующим средством',
                meter = 'с',
                nameLua = 'PTM_SANITIZER'
                },
            [ 44 ] =
                {
                name = 'Объем дезинфицирующего средства при дезинфекции',
                meter = 'мл',
                nameLua = 'PTM_SANITIZER_INJECT'
                },
            [ 45 ] =
                {
                name = 'Номер возвратного насоса',
                meter = 'na',
                nameLua = 'P_N_RET'
                },
            [ 46 ] =
                {
                name = 'Номер управляющего сигнала',
                meter = 'na',
                nameLua = 'P_N_UPR'
                },
            [ 47 ] =
                {
                name = 'Обратная связь(готовность объекта к мойке)',
                meter = 'na',
                nameLua = 'P_OS'
                },
            [ 48 ] =
                {
                name = 'Сигнал "объект опорожнен"',
                meter = 'na',
                nameLua = 'P_OBJ_EMPTY'
                },
            [ 49 ] =
                {
                name = 'Маска доступных режимов мойки',
                meter = 'na',
                nameLua = 'P_PROGRAM_MASK'
                },
            [ 50 ] =
                {
                name = 'Температура ополаскивания чистой водой',
                meter = '°С',
                nameLua = 'P_T_CLEAN_RINSING'
                },
            [ 51 ] =
                {
                name = 'Объем ополаскивания чистой водой',
                meter = 'л',
                nameLua = 'P_V_CLEAN_RINSING'
                },
            [ 52 ] =
                {
                name = 'Температура ополаскивания после мойки дезинфецирующим средством',
                meter = '°С',
                nameLua = 'P_T_SANITIZER_RINSING'
                },
            [ 53 ] =
                {
                name = 'Объем ополаскивания после мойки дезинфицирующим средством',
                meter = 'л',
                nameLua = 'P_V_SANITIZER_RINSING'
                },
            [ 54 ] =
                {
                name = 'Максимальное время от пропадания нижнего уровня в бачке, до завершения операции опорожнения бачка',
                meter = 'с',
                nameLua = 'P_TM_MAX_TIME_OPORBACHOK'
                },
            [ 55 ] =
                {
                name = 'Время отсутствия протока на возврате для окончания опорожнения объекта',
                meter = 'с',
                nameLua = 'P_TM_RET_IS_EMPTY'
                },
            [ 56 ] =
                {
                name = 'Количество литров от пропадания нижнего уровня в бачке до завершения операции "опорожнение бачка"',
                meter = 'л',
                nameLua = 'P_V_LL_BOT'
                },
            [ 57 ] =
                {
                name = 'Минимальный расход при котором считать, что его нет',
                meter = 'm3/ч',
                nameLua = 'P_R_NO_FLOW'
                },
            [ 58 ] =
                {
                name = 'Время возникновения ошибки "нет расхода на подаче"',
                meter = 'с',
                nameLua = 'P_TM_R_NO_FLOW'
                },
            [ 59 ] =
                {
                name = 'Время появления ошибки "нет расхода на возврате"',
                meter = 'с',
                nameLua = 'P_TM_NO_FLOW_R'
                },
            [ 60 ] =
                {
                name = 'Время появления ошибки "нет концентрации в возвратной трубе"',
                meter = 'с',
                nameLua = 'P_TM_NO_CONC'
                },
            [ 61 ] =
                {
                name = 'РТ. Требуемое значение',
                meter = 'na',
                nameLua = 'P61_RESERV'
                },
            [ 62 ] =
                {
                name = 'РТ. Параметр k',
                meter = 'na',
                nameLua = 'PIDP_k'
                },
            [ 63 ] =
                {
                name = 'РТ. Параметр Ti',
                meter = 'na',
                nameLua = 'PIDP_Ti'
                },
            [ 64 ] =
                {
                name = 'РТ. Параметр Td',
                meter = 'na',
                nameLua = 'PIDP_Td'
                },
            [ 65 ] =
                {
                name = 'РТ. Интервал расчёта',
                meter = 'na',
                nameLua = 'PIDP_dt'
                },
            [ 66 ] =
                {
                name = 'РТ. Мax значение входной величины',
                meter = 'na',
                nameLua = 'PIDP_dmax'
                },
            [ 67 ] =
                {
                name = 'РТ. Мin значение входной величины',
                meter = 'na',
                nameLua = 'PIDP_dmin'
                },
            [ 68 ] =
                {
                name = 'РТ. Время выхода',
                meter = 'na',
                nameLua = 'PIDP_AccelTime'
                },
            [ 69 ] =
                {
                name = 'РТ. Ручной режим',
                meter = 'na',
                nameLua = 'PIDP_IsManualMode'
                },
            [ 70 ] =
                {
                name = 'РТ. Заданное ручное значение выхода',
                meter = 'na',
                nameLua = 'PIDP_UManual'
                },
            [ 71 ] =
                {
                name = 'РТ. Выход ПИД',
                meter = 'na',
                nameLua = 'PIDP_Uk'
                },
            [ 72 ] =
                {
                name = 'РР. Требуемое значение',
                meter = 'na',
                nameLua = 'P72_RESERV'
                },
            [ 73 ] =
                {
                name = 'РР. Параметр k',
                meter = 'na',
                nameLua = 'PIDF_k'
                },
            [ 74 ] =
                {
                name = 'РР. Параметр Ti',
                meter = 'na',
                nameLua = 'PIDF_Ti'
                },
            [ 75 ] =
                {
                name = 'РР. Параметр Td',
                meter = 'na',
                nameLua = 'PIDF_Td'
                },
            [ 76 ] =
                {
                name = 'РР. Интервал расчёта',
                meter = 'na',
                nameLua = 'PIDF_dt'
                },
            [ 77 ] =
                {
                name = 'РР. Мax значение входной величины',
                meter = 'na',
                nameLua = 'PIDF_dmax'
                },
            [ 78 ] =
                {
                name = 'РР. Мin значение входной величины',
                meter = 'na',
                nameLua = 'PIDF_dmin'
                },
            [ 79 ] =
                {
                name = 'РР. Время выхода',
                meter = 'na',
                nameLua = 'PIDF_AccelTime'
                },
            [ 80 ] =
                {
                name = 'РР. Ручной режим',
                meter = 'na',
                nameLua = 'PIDF_IsManualMode'
                },
            [ 81 ] =
                {
                name = 'РР. Заданное ручное значение выхода',
                meter = 'na',
                nameLua = 'PIDF_UManual'
                },
            [ 82 ] =
                {
                name = 'РР. Выход ПИД',
                meter = 'na',
                nameLua = 'PIDF_Uk'
                },
            [ 83 ] =
                {
                name = 'Максимальное время операции "Опорожнение объекта CIP"',
                meter = 'с',
                nameLua = 'P_TM_MAX_TIME_OPORCIP'
                },
            [ 84 ] =
                {
                name = 'Сигнал OUT "смена среды"',
                meter = 'na',
                nameLua = 'P_SIGNAL_MEDIUM_CHANGE'
                },
            [ 85 ] =
                {
                name = 'Сигнал OUT "Щелочь в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CAUSTIC'
                },
            [ 86 ] =
                {
                name = 'Сигнал OUT "Кислота в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_ACID'
                },
            [ 87 ] =
                {
                name = 'Сигнал OUT "Мойка идет"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIP_IN_PROGRESS'
                },
            [ 88 ] =
                {
                name = 'Сигнал OUT "Мойка завершена"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIPEND'
                },
            [ 89 ] =
                {
                name = 'Сигнал OUT "Мойка готова"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIP_READY'
                },
            [ 90 ] =
                {
                name = 'Сигнал IN "Готовность объекта к мойке"',
                meter = 'na',
                nameLua = 'P_SIGNAL_OBJECT_READY'
                },
            [ 91 ] =
                {
                name = 'Сигнал OUT "Управление дозатором дезинфицирующего средства"',
                meter = 'na',
                nameLua = 'P_SIGNAL_SANITIZER_PUMP'
                },
            [ 92 ] =
                {
                name = 'Автоматическое возобновление мойки при пропадании "ошибки объекта CIP"',
                meter = 'na',
                nameLua = 'P_RESUME_CIP_ON_SIGNAL'
                },
            [ 93 ] =
                {
                name = 'Сигнал IN analog "Управление производительностью подающего насоса"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CONTROL'
                },
            [ 94 ] =
                {
                name = 'Сигнал OUT "Идет дезинфекция"',
                meter = 'na',
                nameLua = 'P_SIGNAL_DESINSECTION'
                },
            [ 95 ] =
                {
                name = 'Сигнал IN "Пауза"',
                meter = 'na',
                nameLua = 'P_SIGNAL_OBJECT_PAUSE'
                },
            [ 96 ] =
                {
                name = 'Сигнал OUT "Идет циркуляция"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIRCULATION'
                },
            [ 97 ] =
                {
                name = 'Сигнал in "Возможно включение подающего насоса"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CAN_RUN'
                },
            [ 98 ] =
                {
                name = 'Сигнал in analog "Контролируемый уровень для насоса подачи"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CONTROL_FEEDBACK'
                },
            [ 99 ] =
                {
                name = 'Сигнал датчика уровня для работы возвратного насоса',
                meter = 'na',
                nameLua = 'P_SIGNAL_RET_PUMP_SENSOR'
                },
            [ 100 ] =
                {
                name = 'Задержка выключения возвратного насоса при пропадании сигнала датчика уровня',
                meter = 'мс',
                nameLua = 'P_RET_PUMP_SENSOR_DELAY'
                },
            [ 101 ] =
                {
                name = 'Сигнал in "Мойка идет"',
                meter = 'na',
                nameLua = 'P_SIGNAL_IN_CIP_READY'
                },
            [ 102 ] =
                {
                name = 'Сигнал "Мойка окончена 2"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIPEND2'
                },
            [ 103 ] =
                {
                name = 'Сигнал "Mожно продолжать мойку для операций циркуляции и промывки"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CAN_CONTINUE'
                },
            [ 104 ] =
                {
                name = 'Сигнал out "Вода в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_WATER'
                },
            [ 105 ] =
                {
                name = 'Сигнал "предварительное ополаскивание"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PRERINSE'
                },
            [ 106 ] =
                {
                name = 'Сигнал "промежуточная промывка"',
                meter = 'na',
                nameLua = 'P_SIGNAL_INTERMEDIATE_RINSE'
                },
            [ 107 ] =
                {
                name = 'Сигнал "окончательная промывка"',
                meter = 'na',
                nameLua = 'P_SIGNAL_POSTRINSE'
                },
            [ 108 ] =
                {
                name = 'Сигнал "подающий насос остановлен и нет потока"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_STOPPED'
                },
            [ 109 ] =
                {
                name = 'Сигнал  OUT analog "задание потока"',
                meter = 'na',
                nameLua = 'P_SIGNAL_FLOW_TASK'
                },
            [ 110 ] =
                {
                name = 'Сигнал "задание температуры"',
                meter = 'na',
                nameLua = 'P_SIGNAL_TEMP_TASK'
                },
            [ 111 ] =
                {
                name = 'Сигнал "мойка закончена некорректно"',
                meter = 'na',
                nameLua = 'P_SIGNAL_WASH_ABORTED'
                },
            [ 112 ] =
                {
                name = 'Задание давления для регулятора',
                meter = 'бар',
                nameLua = 'P_PRESSURE_CONTROL'
                },
            [ 113 ] =
                {
                name = 'Не использовать вторичную воду при мойке',
                meter = 'na',
                nameLua = 'P_DONT_USE_WATER_TANK'
                },
            [ 114 ] =
                {
                name = 'Верхняя граница пересчета выхода ПИД-регулятора нагревания',
                meter = '°С',
                nameLua = 'P_PIDP_MAX_OUT'
                },
            [ 115 ] =
                {
                name = 'Верхняя граница пересчета выхода ПИД-регулятора расхода',
                meter = 'm3/ч',
                nameLua = 'P_PIDF_MAX_OUT'
                },
            [ 116 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P_RESERV_START'
                },
            [ 117 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P117_RESERV'
                },
            [ 118 ] =
                {
                name = 'Системный номер объекта мойки',
                meter = 'na',
                nameLua = 'P118_RESERV'
                },
            [ 119 ] =
                {
                name = 'Средняя концентрация щелочи',
                meter = 'na',
                nameLua = 'STP_QAVS'
                },
            [ 120 ] =
                {
                name = 'Средняя концентрация кислоты',
                meter = 'na',
                nameLua = 'STP_QAVK'
                },
            [ 121 ] =
                {
                name = 'Чистая вода',
                meter = 'л',
                nameLua = 'STP_WC'
                },
            [ 122 ] =
                {
                name = 'Вторичная вода',
                meter = 'л',
                nameLua = 'STP_WS'
                },
            [ 123 ] =
                {
                name = 'Промежуточный параметр',
                meter = 'na',
                nameLua = 'STP_LV'
                },
            [ 124 ] =
                {
                name = 'Чистая вода, использованная по причине нехватки вторичной',
                meter = 'л',
                nameLua = 'STP_WC_INST_WS'
                },
            [ 125 ] =
                {
                name = 'Время начала мойки (используется сервером для хранения)',
                meter = 'na',
                nameLua = 'STP_WASH_START'
                },
            [ 126 ] =
                {
                name = 'Количество пропущенных операций',
                meter = 'na',
                nameLua = 'STP_STEPS_OVER'
                },
            [ 127 ] =
                {
                name = 'Шаг, на котором сбросили',
                meter = 'na',
                nameLua = 'STP_RESETSTEP'
                },
            [ 128 ] =
                {
                name = 'Количество ошибок',
                meter = 'na',
                nameLua = 'STP_ERRCOUNT'
                },
            [ 129 ] =
                {
                name = 'Количество использованной щелочи',
                meter = 'л',
                nameLua = 'STP_USED_CAUSTIC'
                },
            [ 130 ] =
                {
                name = 'Количество использованной кислоты',
                meter = 'л',
                nameLua = 'STP_USED_ACID'
                },
            [ 131 ] =
                {
                name = 'Показание счетчика на предыдущей операции',
                meter = 'л',
                nameLua = 'STP_LAST_STEP_COUNTER'
                },
            [ 132 ] =
                {
                name = 'Предыдущая операция',
                meter = 'na',
                nameLua = 'STP_LAST_STEP'
                },
            [ 133 ] =
                {
                name = 'Количество воды на дезинфекции',
                meter = 'na',
                nameLua = 'STP_USED_HOTWATER'
                },
            [ 134 ] =
                {
                name = 'Количество подпиток бачка на щелочи',
                meter = 'na',
                nameLua = 'STP_PODP_CAUSTIC'
                },
            [ 135 ] =
                {
                name = 'Количество подпиток бачка на кислоте',
                meter = 'na',
                nameLua = 'STP_PODP_ACID'
                },
            [ 136 ] =
                {
                name = 'Количество подпиток бачка на дезинфекции',
                meter = 'na',
                nameLua = 'STP_PODP_WATER'
                },
            [ 137 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P137_RESERV'
                },
            [ 138 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P138_RESERV'
                },
            [ 139 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P139_RESERV'
                },
            [ 140 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P140_RESERV'
                },
            },

        modes =
            {
            },
        },
    [ 4 ] =
        {
        n          = 4,
        tech_type  = 111,
        name       = 'Вспомогательный модуль мойки',
        name_eplan = 'LINE',
        name_BC    = 'LineObj',
        cooper_param_number = -1,
        base_tech_object = 'aux_cip_module',
        rt_par_float =
            {
            [ 1 ] =
                {
                name = 'Расход концентрата при наведении',
                meter = 'na',
                nameLua = 'P_CONC_RATE'
                },
            [ 2 ] =
                {
                name = 'Текущее задание нагревания',
                meter = '°С',
                nameLua = 'P_ZAD_PODOGR'
                },
            [ 3 ] =
                {
                name = 'Текущее задание расхода',
                meter = 'm3/ч',
                nameLua = 'P_ZAD_FLOW'
                },
            [ 4 ] =
                {
                name = 'Заданный объем операции',
                meter = 'л',
                nameLua = 'P_VRAB'
                },
            [ 5 ] =
                {
                name = 'Максимальное время текущей операции',
                meter = 'с',
                nameLua = 'P_MAX_OPER_TM'
                },
            [ 6 ] =
                {
                name = 'Прошло времени текущей операции',
                meter = 'с',
                nameLua = 'P_OP_TIME_LEFT'
                },
            [ 7 ] =
                {
                name = 'Текущая концентрация',
                meter = '%',
                nameLua = 'P_CONC'
                },
            [ 8 ] =
                {
                name = 'Литров с начала операции',
                meter = 'л',
                nameLua = 'P_SUM_OP'
                },
            [ 9 ] =
                {
                name = 'Заданная концентрация',
                meter = '%',
                nameLua = 'P_ZAD_CONC'
                },
            [ 10 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P_LOADED_RECIPE'
                },
            [ 11 ] =
                {
                name = 'Программа мойки',
                meter = 'na',
                nameLua = 'P_PROGRAM'
                },
            [ 12 ] =
                {
                name = 'Номер выбранного рецепта на линии',
                meter = 'na',
                nameLua = 'P_CUR_REC'
                },
            [ 13 ] =
                {
                name = 'Состояние возвратного насоса',
                meter = 'na',
                nameLua = 'P_RET_STATE'
                },
            [ 14 ] =
                {
                name = 'Выбор рецепта',
                meter = 'na',
                nameLua = 'P_SELECT_REC'
                },
            [ 15 ] =
                {
                name = 'Выбор программы',
                meter = 'na',
                nameLua = 'P_SELECT_PRG'
                },
            [ 16 ] =
                {
                name = 'Объем V1 (от модуля до объекта)',
                meter = 'л',
                nameLua = 'PV1'
                },
            [ 17 ] =
                {
                name = 'Объем V2 (от объекта до модуля)',
                meter = 'л',
                nameLua = 'PV2'
                },
            [ 18 ] =
                {
                name = 'Тип объекта (танк, линия и пр.)',
                meter = 'na',
                nameLua = 'P_OBJ_TYPE'
                },
            [ 19 ] =
                {
                name = 'Расход',
                meter = 'm3/ч',
                nameLua = 'P_FLOW'
                },
            [ 20 ] =
                {
                name = 'Подпитывать ли бачок во время циркуляции',
                meter = 'na',
                nameLua = 'P_PODP_CIRC'
                },
            [ 21 ] =
                {
                name = 'Разница температур на подаче и возврате (если меньше заданной, то начинается отсчет времени циркуляции)',
                meter = '°С',
                nameLua = 'P_DELTA_TR'
                },
            [ 22 ] =
                {
                name = 'Температура предварительного ополаскивания',
                meter = '°С',
                nameLua = 'P_T_WP'
                },
            [ 23 ] =
                {
                name = 'Температура циркуляции на воде (операции не используются)',
                meter = '°С',
                nameLua = 'P_T_WSP'
                },
            [ 24 ] =
                {
                name = 'Температура промежуточных промывок после щелочи и кислоты',
                meter = '°С',
                nameLua = 'P_T_WKP'
                },
            [ 25 ] =
                {
                name = 'Температура окончательного ополаскивания',
                meter = '°С',
                nameLua = 'P_T_WOP'
                },
            [ 26 ] =
                {
                name = 'Температура мойки щелочью',
                meter = '°С',
                nameLua = 'P_T_S'
                },
            [ 27 ] =
                {
                name = 'Температура мойки кислотой',
                meter = '°С',
                nameLua = 'P_T_K'
                },
            [ 28 ] =
                {
                name = 'Температура дезинфекции на воде',
                meter = '°С',
                nameLua = 'P_T_D'
                },
            [ 29 ] =
                {
                name = 'Температура дезинфекции дезинфицирующим средством',
                meter = '°С',
                nameLua = 'P_T_SANITIZER'
                },
            [ 30 ] =
                {
                name = 'Дополнительный объем предварительного ополаскивания',
                meter = 'л',
                nameLua = 'P_DOP_V_PR_OP'
                },
            [ 31 ] =
                {
                name = 'Дополнительный объем ополаскивания после щелочи',
                meter = 'л',
                nameLua = 'P_DOP_V_AFTER_S'
                },
            [ 32 ] =
                {
                name = 'Дополнительный объем ополаскивания после кислоты',
                meter = 'л',
                nameLua = 'P_DOP_V_AFTER_K'
                },
            [ 33 ] =
                {
                name = 'Дополнительный объем окончательного ополаскивания',
                meter = 'л',
                nameLua = 'P_DOP_V_OK_OP'
                },
            [ 34 ] =
                {
                name = 'Объем до конца V1 для остановки возвратного насоса',
                meter = 'л',
                nameLua = 'P_RET_STOP'
                },
            [ 35 ] =
                {
                name = 'Количество литров выше среднего уровня при котором заканчивается заполнение бачка циркуляции',
                meter = 'л',
                nameLua = 'P_V_RAB_ML'
                },
            [ 36 ] =
                {
                name = 'Через сколько литров после начала подачи V2 включать возвратный насос',
                meter = 'л',
                nameLua = 'PV_RET_DEL'
                },
            [ 37 ] =
                {
                name = 'Время циркуляции при ополаскивании (операции не используются)',
                meter = 'с',
                nameLua = 'PTM_OP'
                },
            [ 38 ] =
                {
                name = 'Время циркуляции на щелочи',
                meter = 'с',
                nameLua = 'PTM_S'
                },
            [ 39 ] =
                {
                name = 'Время циркуляции на кислоте',
                meter = 'с',
                nameLua = 'PTM_K'
                },
            [ 40 ] =
                {
                name = 'Время циркуляции на щелочи при мойке кислота+щелочь',
                meter = 'с',
                nameLua = 'PTM_S_SK'
                },
            [ 41 ] =
                {
                name = 'Время циркуляции на кислоте при мойке кислота+щелочь',
                meter = 'с',
                nameLua = 'PTM_K_SK'
                },
            [ 42 ] =
                {
                name = 'Время дезинфекции на воде',
                meter = 'с',
                nameLua = 'PTM_D'
                },
            [ 43 ] =
                {
                name = 'Время дезинфекции дезинфицирующим средством',
                meter = 'с',
                nameLua = 'PTM_SANITIZER'
                },
            [ 44 ] =
                {
                name = 'Объем дезинфицирующего средства при дезинфекции',
                meter = 'мл',
                nameLua = 'PTM_SANITIZER_INJECT'
                },
            [ 45 ] =
                {
                name = 'Номер возвратного насоса',
                meter = 'na',
                nameLua = 'P_N_RET'
                },
            [ 46 ] =
                {
                name = 'Номер управляющего сигнала',
                meter = 'na',
                nameLua = 'P_N_UPR'
                },
            [ 47 ] =
                {
                name = 'Обратная связь(готовность объекта к мойке)',
                meter = 'na',
                nameLua = 'P_OS'
                },
            [ 48 ] =
                {
                name = 'Сигнал "объект опорожнен"',
                meter = 'na',
                nameLua = 'P_OBJ_EMPTY'
                },
            [ 49 ] =
                {
                name = 'Маска доступных режимов мойки',
                meter = 'na',
                nameLua = 'P_PROGRAM_MASK'
                },
            [ 50 ] =
                {
                name = 'Температура ополаскивания чистой водой',
                meter = '°С',
                nameLua = 'P_T_CLEAN_RINSING'
                },
            [ 51 ] =
                {
                name = 'Объем ополаскивания чистой водой',
                meter = 'л',
                nameLua = 'P_V_CLEAN_RINSING'
                },
            [ 52 ] =
                {
                name = 'Температура ополаскивания после мойки дезинфецирующим средством',
                meter = '°С',
                nameLua = 'P_T_SANITIZER_RINSING'
                },
            [ 53 ] =
                {
                name = 'Объем ополаскивания после мойки дезинфицирующим средством',
                meter = 'л',
                nameLua = 'P_V_SANITIZER_RINSING'
                },
            [ 54 ] =
                {
                name = 'Максимальное время от пропадания нижнего уровня в бачке, до завершения операции опорожнения бачка',
                meter = 'с',
                nameLua = 'P_TM_MAX_TIME_OPORBACHOK'
                },
            [ 55 ] =
                {
                name = 'Время отсутствия протока на возврате для окончания опорожнения объекта',
                meter = 'с',
                nameLua = 'P_TM_RET_IS_EMPTY'
                },
            [ 56 ] =
                {
                name = 'Количество литров от пропадания нижнего уровня в бачке до завершения операции "опорожнение бачка"',
                meter = 'л',
                nameLua = 'P_V_LL_BOT'
                },
            [ 57 ] =
                {
                name = 'Минимальный расход при котором считать, что его нет',
                meter = 'm3/ч',
                nameLua = 'P_R_NO_FLOW'
                },
            [ 58 ] =
                {
                name = 'Время возникновения ошибки "нет расхода на подаче"',
                meter = 'с',
                nameLua = 'P_TM_R_NO_FLOW'
                },
            [ 59 ] =
                {
                name = 'Время появления ошибки "нет расхода на возврате"',
                meter = 'с',
                nameLua = 'P_TM_NO_FLOW_R'
                },
            [ 60 ] =
                {
                name = 'Время появления ошибки "нет концентрации в возвратной трубе"',
                meter = 'с',
                nameLua = 'P_TM_NO_CONC'
                },
            [ 61 ] =
                {
                name = 'РТ. Требуемое значение',
                meter = 'na',
                nameLua = 'P61_RESERV'
                },
            [ 62 ] =
                {
                name = 'РТ. Параметр k',
                meter = 'na',
                nameLua = 'PIDP_k'
                },
            [ 63 ] =
                {
                name = 'РТ. Параметр Ti',
                meter = 'na',
                nameLua = 'PIDP_Ti'
                },
            [ 64 ] =
                {
                name = 'РТ. Параметр Td',
                meter = 'na',
                nameLua = 'PIDP_Td'
                },
            [ 65 ] =
                {
                name = 'РТ. Интервал расчёта',
                meter = 'na',
                nameLua = 'PIDP_dt'
                },
            [ 66 ] =
                {
                name = 'РТ. Мax значение входной величины',
                meter = 'na',
                nameLua = 'PIDP_dmax'
                },
            [ 67 ] =
                {
                name = 'РТ. Мin значение входной величины',
                meter = 'na',
                nameLua = 'PIDP_dmin'
                },
            [ 68 ] =
                {
                name = 'РТ. Время выхода',
                meter = 'na',
                nameLua = 'PIDP_AccelTime'
                },
            [ 69 ] =
                {
                name = 'РТ. Ручной режим',
                meter = 'na',
                nameLua = 'PIDP_IsManualMode'
                },
            [ 70 ] =
                {
                name = 'РТ. Заданное ручное значение выхода',
                meter = 'na',
                nameLua = 'PIDP_UManual'
                },
            [ 71 ] =
                {
                name = 'РТ. Выход ПИД',
                meter = 'na',
                nameLua = 'PIDP_Uk'
                },
            [ 72 ] =
                {
                name = 'РР. Требуемое значение',
                meter = 'na',
                nameLua = 'P72_RESERV'
                },
            [ 73 ] =
                {
                name = 'РР. Параметр k',
                meter = 'na',
                nameLua = 'PIDF_k'
                },
            [ 74 ] =
                {
                name = 'РР. Параметр Ti',
                meter = 'na',
                nameLua = 'PIDF_Ti'
                },
            [ 75 ] =
                {
                name = 'РР. Параметр Td',
                meter = 'na',
                nameLua = 'PIDF_Td'
                },
            [ 76 ] =
                {
                name = 'РР. Интервал расчёта',
                meter = 'na',
                nameLua = 'PIDF_dt'
                },
            [ 77 ] =
                {
                name = 'РР. Мax значение входной величины',
                meter = 'na',
                nameLua = 'PIDF_dmax'
                },
            [ 78 ] =
                {
                name = 'РР. Мin значение входной величины',
                meter = 'na',
                nameLua = 'PIDF_dmin'
                },
            [ 79 ] =
                {
                name = 'РР. Время выхода',
                meter = 'na',
                nameLua = 'PIDF_AccelTime'
                },
            [ 80 ] =
                {
                name = 'РР. Ручной режим',
                meter = 'na',
                nameLua = 'PIDF_IsManualMode'
                },
            [ 81 ] =
                {
                name = 'РР. Заданное ручное значение выхода',
                meter = 'na',
                nameLua = 'PIDF_UManual'
                },
            [ 82 ] =
                {
                name = 'РР. Выход ПИД',
                meter = 'na',
                nameLua = 'PIDF_Uk'
                },
            [ 83 ] =
                {
                name = 'Максимальное время операции "Опорожнение объекта CIP"',
                meter = 'с',
                nameLua = 'P_TM_MAX_TIME_OPORCIP'
                },
            [ 84 ] =
                {
                name = 'Сигнал OUT "смена среды"',
                meter = 'na',
                nameLua = 'P_SIGNAL_MEDIUM_CHANGE'
                },
            [ 85 ] =
                {
                name = 'Сигнал OUT "Щелочь в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CAUSTIC'
                },
            [ 86 ] =
                {
                name = 'Сигнал OUT "Кислота в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_ACID'
                },
            [ 87 ] =
                {
                name = 'Сигнал OUT "Мойка идет"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIP_IN_PROGRESS'
                },
            [ 88 ] =
                {
                name = 'Сигнал OUT "Мойка завершена"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIPEND'
                },
            [ 89 ] =
                {
                name = 'Сигнал OUT "Мойка готова"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIP_READY'
                },
            [ 90 ] =
                {
                name = 'Сигнал IN "Готовность объекта к мойке"',
                meter = 'na',
                nameLua = 'P_SIGNAL_OBJECT_READY'
                },
            [ 91 ] =
                {
                name = 'Сигнал OUT "Управление дозатором дезинфицирующего средства"',
                meter = 'na',
                nameLua = 'P_SIGNAL_SANITIZER_PUMP'
                },
            [ 92 ] =
                {
                name = 'Автоматическое возобновление мойки при пропадании "ошибки объекта CIP"',
                meter = 'na',
                nameLua = 'P_RESUME_CIP_ON_SIGNAL'
                },
            [ 93 ] =
                {
                name = 'Сигнал IN analog "Управление производительностью подающего насоса"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CONTROL'
                },
            [ 94 ] =
                {
                name = 'Сигнал OUT "Идет дезинфекция"',
                meter = 'na',
                nameLua = 'P_SIGNAL_DESINSECTION'
                },
            [ 95 ] =
                {
                name = 'Сигнал IN "Пауза"',
                meter = 'na',
                nameLua = 'P_SIGNAL_OBJECT_PAUSE'
                },
            [ 96 ] =
                {
                name = 'Сигнал OUT "Идет циркуляция"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIRCULATION'
                },
            [ 97 ] =
                {
                name = 'Сигнал in "Возможно включение подающего насоса"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CAN_RUN'
                },
            [ 98 ] =
                {
                name = 'Сигнал in analog "Контролируемый уровень для насоса подачи"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_CONTROL_FEEDBACK'
                },
            [ 99 ] =
                {
                name = 'Сигнал датчика уровня для работы возвратного насоса',
                meter = 'na',
                nameLua = 'P_SIGNAL_RET_PUMP_SENSOR'
                },
            [ 100 ] =
                {
                name = 'Задержка выключения возвратного насоса при пропадании сигнала датчика уровня',
                meter = 'мс',
                nameLua = 'P_RET_PUMP_SENSOR_DELAY'
                },
            [ 101 ] =
                {
                name = 'Сигнал in "Мойка идет"',
                meter = 'na',
                nameLua = 'P_SIGNAL_IN_CIP_READY'
                },
            [ 102 ] =
                {
                name = 'Сигнал "Мойка окончена 2"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CIPEND2'
                },
            [ 103 ] =
                {
                name = 'Сигнал "Mожно продолжать мойку для операций циркуляции и промывки"',
                meter = 'na',
                nameLua = 'P_SIGNAL_CAN_CONTINUE'
                },
            [ 104 ] =
                {
                name = 'Сигнал out "Вода в трубе"',
                meter = 'na',
                nameLua = 'P_SIGNAL_WATER'
                },
            [ 105 ] =
                {
                name = 'Сигнал "предварительное ополаскивание"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PRERINSE'
                },
            [ 106 ] =
                {
                name = 'Сигнал "промежуточная промывка"',
                meter = 'na',
                nameLua = 'P_SIGNAL_INTERMEDIATE_RINSE'
                },
            [ 107 ] =
                {
                name = 'Сигнал "окончательная промывка"',
                meter = 'na',
                nameLua = 'P_SIGNAL_POSTRINSE'
                },
            [ 108 ] =
                {
                name = 'Сигнал "подающий насос остановлен и нет потока"',
                meter = 'na',
                nameLua = 'P_SIGNAL_PUMP_STOPPED'
                },
            [ 109 ] =
                {
                name = 'Сигнал  OUT analog "задание потока"',
                meter = 'na',
                nameLua = 'P_SIGNAL_FLOW_TASK'
                },
            [ 110 ] =
                {
                name = 'Сигнал "задание температуры"',
                meter = 'na',
                nameLua = 'P_SIGNAL_TEMP_TASK'
                },
            [ 111 ] =
                {
                name = 'Сигнал "мойка закончена некорректно"',
                meter = 'na',
                nameLua = 'P_SIGNAL_WASH_ABORTED'
                },
            [ 112 ] =
                {
                name = 'Задание давления для регулятора',
                meter = 'бар',
                nameLua = 'P_PRESSURE_CONTROL'
                },
            [ 113 ] =
                {
                name = 'Не использовать вторичную воду при мойке',
                meter = 'na',
                nameLua = 'P_DONT_USE_WATER_TANK'
                },
            [ 114 ] =
                {
                name = 'Верхняя граница пересчета выхода ПИД-регулятора нагревания',
                meter = '°С',
                nameLua = 'P_PIDP_MAX_OUT'
                },
            [ 115 ] =
                {
                name = 'Верхняя граница пересчета выхода ПИД-регулятора расхода',
                meter = 'm3/ч',
                nameLua = 'P_PIDF_MAX_OUT'
                },
            [ 116 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P_RESERV_START'
                },
            [ 117 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P117_RESERV'
                },
            [ 118 ] =
                {
                name = 'Системный номер объекта мойки',
                meter = 'na',
                nameLua = 'P118_RESERV'
                },
            [ 119 ] =
                {
                name = 'Средняя концентрация щелочи',
                meter = 'na',
                nameLua = 'STP_QAVS'
                },
            [ 120 ] =
                {
                name = 'Средняя концентрация кислоты',
                meter = 'na',
                nameLua = 'STP_QAVK'
                },
            [ 121 ] =
                {
                name = 'Чистая вода',
                meter = 'л',
                nameLua = 'STP_WC'
                },
            [ 122 ] =
                {
                name = 'Вторичная вода',
                meter = 'л',
                nameLua = 'STP_WS'
                },
            [ 123 ] =
                {
                name = 'Промежуточный параметр',
                meter = 'na',
                nameLua = 'STP_LV'
                },
            [ 124 ] =
                {
                name = 'Чистая вода, использованная по причине нехватки вторичной',
                meter = 'л',
                nameLua = 'STP_WC_INST_WS'
                },
            [ 125 ] =
                {
                name = 'Время начала мойки (используется сервером для хранения)',
                meter = 'na',
                nameLua = 'STP_WASH_START'
                },
            [ 126 ] =
                {
                name = 'Количество пропущенных операций',
                meter = 'na',
                nameLua = 'STP_STEPS_OVER'
                },
            [ 127 ] =
                {
                name = 'Шаг, на котором сбросили',
                meter = 'na',
                nameLua = 'STP_RESETSTEP'
                },
            [ 128 ] =
                {
                name = 'Количество ошибок',
                meter = 'na',
                nameLua = 'STP_ERRCOUNT'
                },
            [ 129 ] =
                {
                name = 'Количество использованной щелочи',
                meter = 'л',
                nameLua = 'STP_USED_CAUSTIC'
                },
            [ 130 ] =
                {
                name = 'Количество использованной кислоты',
                meter = 'л',
                nameLua = 'STP_USED_ACID'
                },
            [ 131 ] =
                {
                name = 'Показание счетчика на предыдущей операции',
                meter = 'л',
                nameLua = 'STP_LAST_STEP_COUNTER'
                },
            [ 132 ] =
                {
                name = 'Предыдущая операция',
                meter = 'na',
                nameLua = 'STP_LAST_STEP'
                },
            [ 133 ] =
                {
                name = 'Количество воды на дезинфекции',
                meter = 'na',
                nameLua = 'STP_USED_HOTWATER'
                },
            [ 134 ] =
                {
                name = 'Количество подпиток бачка на щелочи',
                meter = 'na',
                nameLua = 'STP_PODP_CAUSTIC'
                },
            [ 135 ] =
                {
                name = 'Количество подпиток бачка на кислоте',
                meter = 'na',
                nameLua = 'STP_PODP_ACID'
                },
            [ 136 ] =
                {
                name = 'Количество подпиток бачка на дезинфекции',
                meter = 'na',
                nameLua = 'STP_PODP_WATER'
                },
            [ 137 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P137_RESERV'
                },
            [ 138 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P138_RESERV'
                },
            [ 139 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P139_RESERV'
                },
            [ 140 ] =
                {
                name = 'Резерв',
                meter = 'na',
                nameLua = 'P140_RESERV'
                },
            },

        modes =
            {
            },
        },
    }
end