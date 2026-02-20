--version  = 1
--Eplanner version = 2025.5.9270.26248
------------------------------------------------------------------------------
PAC_name = 'BR1-МСА6'
PAC_id = '28461'
------------------------------------------------------------------------------
--Узлы IO
nodes =
    {
        {
        name    = 'A1',
        ntype   = 201, --AXC F 2152
        n       = 1,
        IP      = '10.0.206.111',
        modules =
            {
            }
        },
        {
        name    = 'A100',
        ntype   = 100, --750-362
        n       = 2,
        IP      = '10.0.206.112',
        modules =
            {
             {     402 },        --750-402,
             {     402 },        --750-402,
             {     402 },        --750-402,
             {     402 },        --750-402,
             {     402 },        --750-402,
             {     402 },        --750-402,
             {     402 },        --750-402,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     466 },        --750-466,
             {     466 },        --750-466,
             {     466 },        --750-466,
             {     466 },        --750-466,
             {     554 },        --750-554,
             {     554 },        --750-554,
             {     554 },        --750-554,
             {     554 },        --750-554,
             {     638 },        --750-638,
             {     638 },        --750-638,
             {     461 },        --750-461,
             {     461 },        --750-461,
             {     461 },        --750-461,
             {     461 },        --750-461,
             {     612 },        --750-612,
             {     512 },        --750-512,
             {     512 },        --750-512,
             {     512 },        --750-512,
             {     602 },        --750-602,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     430 },        --750-430,
             {     430 },        --750-430,
             {     600 },        --750-600,
            }
        },
        {
        name    = 'A200',
        ntype   = 100, --750-341
        n       = 3,
        IP      = '10.0.200.28',
        modules =
            {
             {     402 },        --750-402,
             {     402 },        --750-402,
             {     402 },        --750-402,
             {     402 },        --750-402,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     504 },        --750-504,
             {     530 },        --750-530,
             {     530 },        --750-530,
             {     600 },        --750-600,
            }
        },
        {
        name    = 'A300',
        ntype   = 100, --750-341
        n       = 4,
        IP      = '10.0.200.55',
        modules =
            {
             {     530 },        --750-530,
             {     530 },        --750-530,
             {     530 },        --750-530,
             {     430 },        --750-430,
             {     600 },        --750-600,
            }
        },
    }
------------------------------------------------------------------------------
--Устройства
devices =
    {
        {
        name    = 'LINE1V0',
        descr   = 'Вода из сети',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 0,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V1',
        descr   = 'Выход из бачка',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 1,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V10',
        descr   = 'Возврат в бачок',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 10,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V1002',
        descr   = 'Подача на объект CIP',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 64,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V1003',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 65,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V11',
        descr   = 'В канализацию',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 11,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V12',
        descr   = 'В нейтрализацию',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 12,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V13',
        descr   = 'Отсечной паровой',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 13,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V2',
        descr   = 'Подача кислоты',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 2,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V3',
        descr   = 'Подача щелочи',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V4',
        descr   = 'Подача вторичной воды',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 4,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V5',
        descr   = 'Подача на объект CIP',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 5,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V6',
        descr   = 'Циркуляция',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 6,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V6101',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 2,
                offset        = 12,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V6102',
        descr   = 'CIP+(NO). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 2,
                offset        = 14,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V7',
        descr   = 'Возврат вторичной воды',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 7,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V8',
        descr   = 'Возврат кислоты',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 8,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1V9',
        descr   = 'Возврат щелочи',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 9,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V0',
        descr   = 'Вода из сети',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 14,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V1',
        descr   = 'Выход из бачка',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 15,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V10',
        descr   = 'Возврат в бачок',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 24,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V1000',
        descr   = 'CIP+(NO). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 62,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V1001',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 63,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V11',
        descr   = 'В канализацию',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 25,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V12',
        descr   = 'В нейтрализацию',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 26,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V13',
        descr   = 'Отсечной паровой',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 27,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V2',
        descr   = 'Подача кислоты',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 16,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V3',
        descr   = 'Подача щелочи',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 17,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V4',
        descr   = 'Подача вторичной воды',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 18,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V5',
        descr   = 'Подача на объект CIP',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 19,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V6',
        descr   = 'Циркуляция',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 20,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V6201',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 2,
                offset        = 13,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V6202',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 2,
                offset        = 15,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V6207',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 2,
                offset        = 25,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V7',
        descr   = 'Возврат вторичной воды',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 21,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V8',
        descr   = 'Возврат кислоты',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 22,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2V9',
        descr   = 'Возврат щелочи',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 23,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V0',
        descr   = 'Вода из сети',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 28,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V1',
        descr   = 'Выход из бачка',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 29,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V10',
        descr   = 'Возврат в бачок',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 38,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V11',
        descr   = 'В канализацию',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 39,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V12',
        descr   = 'В нейтрализацию',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 40,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V13',
        descr   = 'Отсечной паровой',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 41,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V2',
        descr   = 'Подача кислоты',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 30,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V3',
        descr   = 'Подача щелочи',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 31,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V4',
        descr   = 'Подача вторичной воды',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 32,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V5',
        descr   = 'Подача на объект CIP',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 33,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V6',
        descr   = 'Циркуляция',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 34,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V6301',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 66,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V63011',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 3,
                offset        = 15,
                physical_port = 8,
                logical_port  = 8,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V6302',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 67,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V6303',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 3,
                offset        = 12,
                physical_port = 3,
                logical_port  = 5,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V6304',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 3,
                offset        = 14,
                physical_port = 4,
                logical_port  = 7,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V6305',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 3,
                offset        = 13,
                physical_port = 7,
                logical_port  = 6,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V6307',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 3, -- V_DO1_DI1_FB_OFF
        article = 'FES.578339',
        DO =
            {
                {
                node          = 2,
                offset        = 21,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        DI =
            {
                {
                node          = 2,
                offset        = 11,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 8
                },
            },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'LINE3V7',
        descr   = 'Возврат вторичной воды',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 35,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V8',
        descr   = 'Возврат кислоты',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 36,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3V9',
        descr   = 'Возврат щелочи',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 37,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V0',
        descr   = 'Вода из сети',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 42,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V1',
        descr   = 'Выход из бачка',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 43,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V10',
        descr   = 'Возврат в бачок',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 52,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V11',
        descr   = 'В канализацию',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 53,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V12',
        descr   = 'В нейтрализацию',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 54,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V13',
        descr   = 'Отсечной паровой',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 55,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V2',
        descr   = 'Подача кислоты',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 44,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V3',
        descr   = 'Подача щелочи',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 45,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V4',
        descr   = 'Подача вторичной воды',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 46,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V5',
        descr   = 'Подача на объект CIP',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 47,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V6',
        descr   = 'Циркуляция',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 48,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V6402',
        descr   = 'CIP+(NO). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 2,
                offset        = 8,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V6403',
        descr   = 'CIP+(NO). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 2,
                offset        = 10,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V6404',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 2,
                offset        = 9,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V6405',
        descr   = 'CIP+(NO). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 3,
                offset        = 8,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V6406',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 3,
                offset        = 10,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V6407',
        descr   = 'CIP+(NC). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 3,
                offset        = 9,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V6408',
        descr   = 'CIP+(NO). Магистральный',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 3,
                offset        = 11,
                physical_port = 6,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V7',
        descr   = 'Возврат вторичной воды',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 49,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V8',
        descr   = 'Возврат кислоты',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 50,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4V9',
        descr   = 'Возврат щелочи',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578339',
        DO =
            {
                {
                node          = 1,
                offset        = 51,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1VC14',
        descr   = 'Регулирующий клапан пара',
        dtype   = 1,
        subtype = 1, -- VC
        article = '',
        AO =
            {
                {
                node          = 1,
                offset        = 0,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2VC14',
        descr   = 'Регулирующий клапан пара',
        dtype   = 1,
        subtype = 1, -- VC
        article = '',
        AO =
            {
                {
                node          = 1,
                offset        = 1,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3VC14',
        descr   = 'Регулирующий клапан пара',
        dtype   = 1,
        subtype = 1, -- VC
        article = '',
        AO =
            {
                {
                node          = 1,
                offset        = 2,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4VC14',
        descr   = 'Регулирующий клапан пара',
        dtype   = 1,
        subtype = 1, -- VC
        article = '',
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1M1',
        descr   = 'Подающий насос',
        dtype   = 2,
        subtype = 2, -- M_FREQ
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 1,
                offset        = 58,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 1,
                offset        = 11,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 8
                },
            },
        AO =
            {
                {
                -- Частота вращения
                node          = 1,
                offset        = 4,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'LINE2M1',
        descr   = 'Подающий насос',
        dtype   = 2,
        subtype = 2, -- M_FREQ
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 1,
                offset        = 59,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 1,
                offset        = 15,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 12
                },
            },
        AO =
            {
                {
                -- Частота вращения
                node          = 1,
                offset        = 5,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'LINE3M1',
        descr   = 'Подающий насос',
        dtype   = 2,
        subtype = 2, -- M_FREQ
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 1,
                offset        = 60,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 1,
                offset        = 19,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 16
                },
            },
        AO =
            {
                {
                -- Частота вращения
                node          = 1,
                offset        = 6,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'LINE4M1',
        descr   = 'Подающий насос',
        dtype   = 2,
        subtype = 2, -- M_FREQ
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 1,
                offset        = 61,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 1,
                offset        = 23,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 20
                },
            },
        AO =
            {
                {
                -- Частота вращения
                node          = 1,
                offset        = 7,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'M1',
        descr   = 'Дозатор щелочи',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 1,
                offset        = 56,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 1,
                offset        = 6,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 4
                },
            },
        par = {2000 --[[P_ON_TIME]] }
        },

        {
        name    = 'M2',
        descr   = 'Дозатор кислоты',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 1,
                offset        = 57,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 1,
                offset        = 7,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 4
                },
            },
        par = {2000 --[[P_ON_TIME]] }
        },

        {
        name    = 'LINE1LS1',
        descr   = 'Бачок Верхний уровень',
        dtype   = 3,
        subtype = 2, -- LS_MAX
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 8,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 8
                },
            },
        par = {2000 --[[P_DT]] }
        },

        {
        name    = 'LINE1LS2',
        descr   = 'Бачок Средний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 9,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 8
                },
            },
        par = {1500 --[[P_DT]] }
        },

        {
        name    = 'LINE1LS3',
        descr   = 'Бачок Нижний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 10,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 8
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LINE2LS1',
        descr   = 'Бачок Верхний уровень',
        dtype   = 3,
        subtype = 2, -- LS_MAX
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 12,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 12
                },
            },
        par = {2000 --[[P_DT]] }
        },

        {
        name    = 'LINE2LS2',
        descr   = 'Бачок Средний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 13,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 12
                },
            },
        par = {1500 --[[P_DT]] }
        },

        {
        name    = 'LINE2LS3',
        descr   = 'Бачок Нижний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 14,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 12
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LINE3LS1',
        descr   = 'Бачок Верхний уровень',
        dtype   = 3,
        subtype = 2, -- LS_MAX
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 16,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 16
                },
            },
        par = {2000 --[[P_DT]] }
        },

        {
        name    = 'LINE3LS2',
        descr   = 'Бачок Средний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 17,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 16
                },
            },
        par = {1500 --[[P_DT]] }
        },

        {
        name    = 'LINE3LS3',
        descr   = 'Бачок Нижний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 18,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 16
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LINE4LS1',
        descr   = 'Бачок Верхний уровень',
        dtype   = 3,
        subtype = 2, -- LS_MAX
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 20,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 20
                },
            },
        par = {2000 --[[P_DT]] }
        },

        {
        name    = 'LINE4LS2',
        descr   = 'Бачок Средний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 21,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 20
                },
            },
        par = {1500 --[[P_DT]] }
        },

        {
        name    = 'LINE4LS3',
        descr   = 'Бачок Нижний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'IFM.LMT100',
        DI =
            {
                {
                node          = 1,
                offset        = 22,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 20
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LS4',
        descr   = 'Танк щелочи. Верхний уровень',
        dtype   = 3,
        subtype = 2, -- LS_MAX
        article = 'E&H.FTL20-0125',
        DI =
            {
                {
                node          = 1,
                offset        = 0,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LS5',
        descr   = 'Танк щелочи. Нижний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'E&H.FTL20-0125',
        DI =
            {
                {
                node          = 1,
                offset        = 1,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LS6',
        descr   = 'Танк кислоты. Верхний уровень',
        dtype   = 3,
        subtype = 2, -- LS_MAX
        article = 'E&H.FTL20-0125',
        DI =
            {
                {
                node          = 1,
                offset        = 2,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LS7',
        descr   = 'Танк кислоты. Нижний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'E&H.FTL20-0125',
        DI =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LS8',
        descr   = 'Танк воды. Верхний уровень',
        dtype   = 3,
        subtype = 2, -- LS_MAX
        article = 'E&H.FTL20-0125',
        DI =
            {
                {
                node          = 1,
                offset        = 4,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 4
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LS9',
        descr   = 'Танк воды. Нижний уровень',
        dtype   = 3,
        subtype = 1, -- LS_MIN
        article = 'E&H.FTL20-0125',
        DI =
            {
                {
                node          = 1,
                offset        = 5,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 4
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LINE1TE1',
        descr   = 'Температура на подаче',
        dtype   = 4,
        subtype = 1, -- TE
        article = 'IFM.TM4501',
        AI =
            {
                {
                node          = 1,
                offset        = 12,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 12
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'LINE1TE2',
        descr   = 'Температура на возврате',
        dtype   = 4,
        subtype = 1, -- TE
        article = 'IFM.TM4501',
        AI =
            {
                {
                node          = 1,
                offset        = 13,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 12
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'LINE2TE1',
        descr   = 'Температура на подаче',
        dtype   = 4,
        subtype = 1, -- TE
        article = 'IFM.TM4501',
        AI =
            {
                {
                node          = 1,
                offset        = 14,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 14
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'LINE2TE2',
        descr   = 'Температура на возврате',
        dtype   = 4,
        subtype = 1, -- TE
        article = 'IFM.TM4501',
        AI =
            {
                {
                node          = 1,
                offset        = 15,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 14
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'LINE3TE1',
        descr   = 'Температура на подаче',
        dtype   = 4,
        subtype = 1, -- TE
        article = 'IFM.TM4501',
        AI =
            {
                {
                node          = 1,
                offset        = 16,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 16
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'LINE3TE2',
        descr   = 'Температура на возврате',
        dtype   = 4,
        subtype = 1, -- TE
        article = 'IFM.TM4501',
        AI =
            {
                {
                node          = 1,
                offset        = 17,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 16
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'LINE4TE1',
        descr   = 'Температура на подаче',
        dtype   = 4,
        subtype = 1, -- TE
        article = 'IFM.TM4501',
        AI =
            {
                {
                node          = 1,
                offset        = 18,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 18
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'LINE4TE2',
        descr   = 'Температура на возврате',
        dtype   = 4,
        subtype = 1, -- TE
        article = 'IFM.TM4501',
        AI =
            {
                {
                node          = 1,
                offset        = 19,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 18
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'LINE1FS1',
        descr   = 'Датчик наличия потока',
        dtype   = 5,
        subtype = 1, -- FS
        article = 'IFM.SI6800',
        DI =
            {
                {
                node          = 1,
                offset        = 24,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 24
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LINE2FS1',
        descr   = 'Датчик наличия потока',
        dtype   = 5,
        subtype = 1, -- FS
        article = 'IFM.SI6800',
        DI =
            {
                {
                node          = 1,
                offset        = 25,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 24
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LINE3FS1',
        descr   = 'Датчик наличия потока',
        dtype   = 5,
        subtype = 1, -- FS
        article = 'IFM.SI6800',
        DI =
            {
                {
                node          = 1,
                offset        = 26,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 24
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LINE4FS1',
        descr   = 'Датчик наличия потока',
        dtype   = 5,
        subtype = 1, -- FS
        article = 'IFM.SI6800',
        DI =
            {
                {
                node          = 1,
                offset        = 27,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 24
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'LINE1FQT1',
        descr   = 'Расходомер на подаче',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 53H50-H0B1AA0FAD',
        AI =
            {
                {
                -- Объем
                node          = 1,
                offset        = 8,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 8
                },
                {
                -- Поток
                node          = 1,
                offset        = 0,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        par = {0 --[[P_MIN_F]], 30 --[[P_MAX_F]], 0 --[[P_C0]], 0 --[[P_DT]], 1 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'LINE2FQT1',
        descr   = 'Расходомер на подаче',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 53H50-H0B1AA0FAD',
        AI =
            {
                {
                -- Объем
                node          = 1,
                offset        = 9,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 8
                },
                {
                -- Поток
                node          = 1,
                offset        = 1,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        par = {0 --[[P_MIN_F]], 30 --[[P_MAX_F]], 0 --[[P_C0]], 0 --[[P_DT]], 1 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'LINE3FQT1',
        descr   = 'Расходомер на подаче',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 53H50-H0B1AA0FAD',
        AI =
            {
                {
                -- Объем
                node          = 1,
                offset        = 10,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 10
                },
                {
                -- Поток
                node          = 1,
                offset        = 2,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 2
                },
            },
        par = {0 --[[P_MIN_F]], 30 --[[P_MAX_F]], 0 --[[P_C0]], 0 --[[P_DT]], 1 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'LINE4FQT1',
        descr   = 'Расходомер на подаче',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 53H50-H0B1AA0FAD',
        AI =
            {
                {
                -- Объем
                node          = 1,
                offset        = 11,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 10
                },
                {
                -- Поток
                node          = 1,
                offset        = 3,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 2
                },
            },
        par = {0 --[[P_MIN_F]], 30 --[[P_MAX_F]], 0 --[[P_C0]], 0 --[[P_DT]], 1 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'LINE1QT1',
        descr   = 'Проводимость на возврате',
        dtype   = 9,
        subtype = 1, -- QT
        article = 'JUMO.CTI-750 202756/16-607-000-84/768',
        AI =
            {
                {
                node          = 1,
                offset        = 4,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 4
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 250 --[[P_MAX_V]] }
        },

        {
        name    = 'LINE2QT1',
        descr   = 'Проводимость на возврате',
        dtype   = 9,
        subtype = 1, -- QT
        article = 'JUMO.CTI-750 202756/16-607-000-84/768',
        AI =
            {
                {
                node          = 1,
                offset        = 5,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 4
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 250 --[[P_MAX_V]] }
        },

        {
        name    = 'LINE3QT1',
        descr   = 'Проводимость на возврате',
        dtype   = 9,
        subtype = 1, -- QT
        article = 'JUMO.CTI-750 202756/16-607-000-84/768',
        AI =
            {
                {
                node          = 1,
                offset        = 6,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 6
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 250 --[[P_MAX_V]] }
        },

        {
        name    = 'LINE4QT1',
        descr   = 'Проводимость на возврате',
        dtype   = 9,
        subtype = 1, -- QT
        article = 'JUMO.CTI-750 202756/16-607-000-84/768',
        AI =
            {
                {
                node          = 1,
                offset        = 7,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 6
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 250 --[[P_MAX_V]] }
        },

        {
        name    = 'LINE1DI1',
        descr   = 'Объект опорожнен',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE1DI2',
        descr   = 'Пауза',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE1DI3',
        descr   = 'Готовность объекта Танк №13',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE1DI4',
        descr   = 'Готовность объекта Танк №26',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE1DI5',
        descr   = 'Готовность объекта Танк №27',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE1DI6',
        descr   = 'Готовность объекта Танк №28',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE1DI6101',
        descr   = 'Линия 1 - Мойка готова (Сметана)',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 3,
                offset        = 4,
                physical_port = 3,
                logical_port  = 5,
                module_offset = 0
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'LINE1DI7',
        descr   = 'Готовность объекта Танк №29',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE1DI8',
        descr   = 'Готовность объекта Танк №30',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE1DI9',
        descr   = 'Готовность объекта Танк №31',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI1',
        descr   = 'Объект опорожнен',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI11',
        descr   = 'Объект опорожнен (BR1-Напитки)',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI12',
        descr   = 'Пауза (BR1-Напитки)',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI13',
        descr   = 'Готовность объекта Танк №42 (BR1-Напитки)',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI14',
        descr   = 'Готовность объекта Танк №43 (BR1-Напитки)',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI15',
        descr   = 'Готовность объекта Танк №44 (BR1-Напитки)',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI16',
        descr   = 'Готовность объекта Танк №49 (BR1-Напитки)',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI17',
        descr   = 'Готовность объекта Танк №50 (BR1-Напитки)',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI18',
        descr   = 'Готовность объекта Танк №51 (BR1-Напитки)',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI2',
        descr   = 'Пауза',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI3',
        descr   = 'Готовность объекта Линия S10',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI4',
        descr   = 'Готовность объекта Линия S1-S4',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI5',
        descr   = 'Готовность объекта Линия C1',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE2DI6201',
        descr   = 'CIP по 6-2 Гот(Раст)',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 2,
                offset        = 14,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 12
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'LINE2DI6211',
        descr   = 'Готовность к мойке объектов МСА 6-2 (Напитки)',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 2,
                offset        = 7,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 4
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'LINE2DI6221',
        descr   = 'Линия МСА6-2 Готовность объекта CIP (Танки 32-38)',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 2,
                offset        = 0,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'LINE3DI1',
        descr   = 'Мойка по Л.6-3 готова',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE3DI63',
        descr   = 'Мойка по Л.63 готова',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 1,
                offset        = 28,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 28
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'LINE3DI6301',
        descr   = 'CIP по 6-3 Гот (Танки 32-38)',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 2,
                offset        = 13,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 12
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'LINE3DI6311',
        descr   = 'Объект MCA 6-3 CIP готов (танки 1-9)',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 3,
                offset        = 0,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'LINE4DI101',
        descr   = 'Объект опорожнен',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE4DI102',
        descr   = 'Пауза',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE4DI111',
        descr   = 'Готовность объекта Танк №14',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE4DI112',
        descr   = 'Готовность объекта Танк №15',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE4DI113',
        descr   = 'Готовность объекта Танк №16',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE4DI114',
        descr   = 'Готовность объекта Танк №17',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE4DI115',
        descr   = 'Готовность объекта Танк №18',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE4DI116',
        descr   = 'Готовность объекта Танк №19',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'LINE4DI64',
        descr   = 'Мойка по Л.64 готов',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 2,
                offset        = 5,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 4
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'LINE4DI6401',
        descr   = 'CIP по 6-4 Гот(Закв)',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 2,
                offset        = 8,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 8
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'LINE4DI6411',
        descr   = 'Линия 6-4 Объект CIP готов (Гребенка аппаратного)',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 3,
                offset        = 6,
                physical_port = 4,
                logical_port  = 7,
                module_offset = 0
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'LINE4DI6421',
        descr   = 'Объект МСА 6-4 CIP готов (танки 1-9)',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 3,
                offset        = 2,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 0
                },
            },
        par = {0 --[[P_DT]] }
        },

        {
        name    = 'DO100',
        descr   = 'Сирена',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 11,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1DO1',
        descr   = 'Линия свободна',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE1DO2',
        descr   = 'Включение ВН',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE1DO3',
        descr   = 'Мойка окончена',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE1DO4',
        descr   = 'Смена среды',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE1DO5',
        descr   = 'Мойка идет',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE1DO6',
        descr   = 'Дезинфекция',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE1DO6101',
        descr   = 'Линия 6-1 Свободна (Гребенка аппаратного)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 3,
                offset        = 1,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE1DO6102',
        descr   = 'Линия 6-1 Включить ВН (Гребенка аппаратного)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 6,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2DO1',
        descr   = 'Линия свободна',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO11',
        descr   = 'Линия свободна (BR1-Напитки)',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO12',
        descr   = 'Включение ВН (BR1-Напитки)',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO13',
        descr   = 'Мойка окончена (BR1-Напитки)',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO14',
        descr   = 'Смена среды (BR1-Напитки)',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO15',
        descr   = 'Флипы возможны (BR1-Напитки)',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO16',
        descr   = 'Мойка идет (BR1-Напитки)',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO2',
        descr   = 'Включение ВН',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO3',
        descr   = 'Мойка окончена',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO4',
        descr   = 'Смена среды',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO5',
        descr   = 'Мойка идет',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO6',
        descr   = 'Дезинфекция',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE2DO6201',
        descr   = 'Лин. 6-2 Своб(Раств)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 17,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2DO6202',
        descr   = 'Вкл.воз.н.6-2 (Раст)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 19,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2DO6211',
        descr   = 'Линия мойки МСА 6-2 свободна (Напитки)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 24,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2DO6212',
        descr   = 'Включить возвратный насос МСА 6-2 (Напитки)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 26,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2DO6221',
        descr   = 'Линия МСА6-2 Свободна (Танки 32-38)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 28,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE2DO6222',
        descr   = 'Линия МСА6-2 Включение ВН (Танки 32-38)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 30,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3DO1',
        descr   = 'Свободна л. 6-3',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE3DO2',
        descr   = 'Включить ВН по л. 6-3',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE3DO3',
        descr   = 'Мойка окончена по л. 6-3',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE3DO63',
        descr   = 'Линия 63 свободна',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 1,
                offset        = 69,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3DO6301',
        descr   = 'Линия МСА 6-3 свободна (Танки 32-38)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 32,
                physical_port = 3,
                logical_port  = 5,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3DO6302',
        descr   = 'Вкл. насос R2N1(реверс)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 34,
                physical_port = 4,
                logical_port  = 7,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3DO631',
        descr   = 'Вкл.63N1 возв. Т4-7',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 1,
                offset        = 70,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3DO6311',
        descr   = 'МСА 6-3 Свободна (танки 1-9)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 3,
                offset        = 0,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3DO6312',
        descr   = 'МСА 6-3 Включение ВН',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 3,
                offset        = 2,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE3DO632',
        descr   = 'Вкл.63N2 возв. Т9-12',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 1,
                offset        = 71,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4DO101',
        descr   = 'Линия свободна',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE4DO102',
        descr   = 'Включение ВН',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE4DO103',
        descr   = 'Мойка окончена',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE4DO104',
        descr   = 'Смена среды',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE4DO105',
        descr   = 'Флипы возможны',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE4DO106',
        descr   = 'Мойка идет',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE4DO107',
        descr   = 'Дезинфекция',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'LINE4DO64',
        descr   = 'Линия 64 свободна',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 4,
                physical_port = 1,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4DO6401',
        descr   = 'Линия 6-4 Своб(Закв)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 5,
                physical_port = 5,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4DO6402',
        descr   = 'Вкл.воз.н.6-4 (Закв)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 7,
                physical_port = 8,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4DO641',
        descr   = 'Включить насос КN1',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 2,
                offset        = 6,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4DO6411',
        descr   = 'Линия 6-4 Свободна (Гребенка аппаратного)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 3,
                offset        = 5,
                physical_port = 7,
                logical_port  = 6,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4DO6412',
        descr   = 'Линия 6-4 Включить ВН (Гребенка аппаратного)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 3,
                offset        = 7,
                physical_port = 8,
                logical_port  = 8,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4DO6421',
        descr   = 'МСА 6-4 Свободна (танки 1-9)',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 3,
                offset        = 4,
                physical_port = 3,
                logical_port  = 5,
                module_offset = 0
                },
            },
        },

        {
        name    = 'LINE4DO6422',
        descr   = 'МСА 6-4 Включение ВН',
        dtype   = 14,
        subtype = 1, -- DO
        article = '',
        DO =
            {
                {
                node          = 3,
                offset        = 6,
                physical_port = 4,
                logical_port  = 7,
                module_offset = 0
                },
            },
        },

    }
