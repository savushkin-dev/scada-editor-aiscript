--version  = 1
--Eplanner version = 2026.1.9523.22553
------------------------------------------------------------------------------
PAC_name = 'BN1-Растворение'
PAC_id = '20260'
------------------------------------------------------------------------------
--Узлы IO
nodes =
    {
        {
        name    = 'A1',
        ntype   = 201, --AXC F 3152
        n       = 1,
        IP      = '10.170.101.1',
        modules =
            {
            }
        },
        {
        name    = 'A100',
        ntype   = 200, --AXL F BK ETH
        n       = 2,
        IP      = '192.168.0.1',
        modules =
            {
             { 1088132 },        --AXL SE IOL4,
             { 1088123 },        --AXL SE AO4 I 4-20,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088062 },        --AXL SE AI4 I 4-20,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 2688022 },        --AXL F DI16/4 2F,
             { 2688022 },        --AXL F DI16/4 2F,
             { 2702911 },        --AXL F SGI2 1H,
            }
        },
        {
        name    = 'A200',
        ntype   = 200, --AXL F BK ETH
        n       = 3,
        IP      = '192.168.0.2',
        modules =
            {
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 2688022 },        --AXL F DI16/4 2F,
             { 2688527 },        --AXL F AO4 1H,
            }
        },
        {
        name    = 'A300',
        ntype   = 200, --AXL F BK ETH
        n       = 4,
        IP      = '192.168.0.3',
        modules =
            {
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088062 },        --AXL SE AI4 I 4-20,
             { 1088131 },        --AXL SE CNT1,
             { 1088131 },        --AXL SE CNT1,
             { 1088131 },        --AXL SE CNT1,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 2688022 },        --AXL F DI16/4 2F,
            }
        },
        {
        name    = 'A400',
        ntype   = 200, --AXL F BK ETH
        n       = 5,
        IP      = '192.168.0.4',
        modules =
            {
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 2688022 },        --AXL F DI16/4 2F,
            }
        },
        {
        name    = 'A500',
        ntype   = 200, --AXL F BK ETH
        n       = 6,
        IP      = '192.168.0.5',
        modules =
            {
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 2688022 },        --AXL F DI16/4 2F,
            }
        },
        {
        name    = 'A600',
        ntype   = 200, --AXL F BK ETH
        n       = 7,
        IP      = '192.168.0.6',
        modules =
            {
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 1088062 },        --AXL SE AI4 I 4-20,
             { 1088131 },        --AXL SE CNT1,
             { 1088131 },        --AXL SE CNT1,
             { 1088131 },        --AXL SE CNT1,
             { 2688022 },        --AXL F DI16/4 2F,
             { 2688022 },        --AXL F DI16/4 2F,
            }
        },
        {
        name    = 'A700',
        ntype   = 200, --AXL F BK ETH
        n       = 8,
        IP      = '192.168.0.7',
        modules =
            {
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 1088132 },        --AXL SE IOL4,
             { 1088062 },        --AXL SE AI4 I 4-20,
             { 1088131 },        --AXL SE CNT1,
             { 1088131 },        --AXL SE CNT1,
             { 1088131 },        --AXL SE CNT1,
             { 2688022 },        --AXL F DI16/4 2F,
            }
        },
        {
        name    = 'A800',
        ntype   = 200, --AXL F BK ETH
        n       = 9,
        IP      = '192.168.0.8',
        modules =
            {
             { 1088132 },        --AXL SE IOL4,
             { 1088123 },        --AXL SE AO4 I 4-20,
             { 1088132 },        --AXL SE IOL4,
             { 1088134 },        --AXL SE SC-A,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088132 },        --AXL SE IOL4,
             { 1088062 },        --AXL SE AI4 I 4-20,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 2688022 },        --AXL F DI16/4 2F,
             { 2688022 },        --AXL F DI16/4 2F,
             { 2702911 },        --AXL F SGI2 1H,
            }
        },
        {
        name    = '',
        ntype   = -1, --750-xxx
        n       = 10,
        IP      = '',
        modules =
            {
            }
        },
        {
        name    = 'A1000',
        ntype   = 200, --AXL F BK ETH
        n       = 11,
        IP      = '192.168.0.10',
        modules =
            {
             { 2688048 },        --AXL F DO16/3 2F,
             { 2688048 },        --AXL F DO16/3 2F,
             { 2688022 },        --AXL F DI16/4 2F,
             { 2688022 },        --AXL F DI16/4 2F,
             { 1088132 },        --AXL SE IOL4,
             { 1088127 },        --AXL SE DI16/1,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
             { 1088134 },        --AXL SE SC-A,
            }
        },
    }
------------------------------------------------------------------------------
--Устройства
devices =
    {
        {
        name    = 'ALMIX1V1',
        descr   = 'Подача в Almix',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2688,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                1,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V10',
        descr   = 'Подача на фильтр №2',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2697,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                10,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V101',
        descr   = 'Вода для вакуум системы',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578281',
        DO =
            {
                {
                node          = 1,
                offset        = 592,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 36
                },
            },
        },

        {
        name    = 'ALMIX1V103',
        descr   = 'Вода для охл. мешалки',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578281',
        DO =
            {
                {
                node          = 1,
                offset        = 593,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 36
                },
            },
        },

        {
        name    = 'ALMIX1V104',
        descr   = 'Вода для охл. насоса',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578281',
        DO =
            {
                {
                node          = 1,
                offset        = 594,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 36
                },
            },
        },

        {
        name    = 'ALMIX1V11',
        descr   = 'Выход фильтра №2',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2698,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                11,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V12',
        descr   = 'В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2703,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                16,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V2',
        descr   = 'В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2689,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                2,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V20',
        descr   = 'Клапан сброса давления',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2699,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                12,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V21',
        descr   = 'Подача порошка №1',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2700,
                physical_port = 44,
                logical_port  = 13,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                13,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V22',
        descr   = 'Подача порошка №3',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2701,
                physical_port = 45,
                logical_port  = 14,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                14,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {3000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V23',
        descr   = 'Подача порошка №4',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2702,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                15,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V3',
        descr   = 'На МГ',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2690,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                3,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V4',
        descr   = 'Циркуляция через Almix',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2691,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                4,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V5',
        descr   = 'Дренаж Almix(NC)',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2692,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                5,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V6',
        descr   = 'Выдача из Almix',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2693,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                6,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V7',
        descr   = 'Запорный линии выдачи',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2694,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                7,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V8',
        descr   = 'Подача на фильтр №1',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2695,
                physical_port = 7,
                logical_port  = 8,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                8,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1V9',
        descr   = 'Выход фильтра №1',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 1,
                offset        = 2696,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 1,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                9,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V1',
        descr   = 'Подача в Almix',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2688,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                1,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V10',
        descr   = 'Подача на фильтр №2',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2697,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                10,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V101',
        descr   = 'Вода для вакуум системы',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578281',
        DO =
            {
                {
                node          = 8,
                offset        = 592,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 36
                },
            },
        },

        {
        name    = 'ALMIX2V103',
        descr   = 'Вода для охл. мешалки',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578281',
        DO =
            {
                {
                node          = 8,
                offset        = 593,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 36
                },
            },
        },

        {
        name    = 'ALMIX2V104',
        descr   = 'Вода для охл. насоса',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'FES.578281',
        DO =
            {
                {
                node          = 8,
                offset        = 594,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 36
                },
            },
        },

        {
        name    = 'ALMIX2V11',
        descr   = 'Выход фильтра №2',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2698,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                11,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V12',
        descr   = 'В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2703,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                16,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V2',
        descr   = 'В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2689,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                2,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V20',
        descr   = 'Клапан сброса давления',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2699,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                12,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V21',
        descr   = 'Подача порошка №1',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2700,
                physical_port = 44,
                logical_port  = 13,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                13,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V22',
        descr   = 'Подача порошка №3',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2701,
                physical_port = 45,
                logical_port  = 14,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                14,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {3000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V23',
        descr   = 'Подача порошка №4',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2702,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                15,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V3',
        descr   = 'На МГ',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2690,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                3,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V4',
        descr   = 'Циркуляция через Almix',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2691,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                4,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V5',
        descr   = 'Дренаж Almix(NC)',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2692,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                5,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V6',
        descr   = 'Выдача из Almix',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2693,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                6,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V7',
        descr   = 'Запорный линии выдачи',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2694,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                7,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V8',
        descr   = 'Подача на фильтр №1',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2695,
                physical_port = 7,
                logical_port  = 8,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                8,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX2V9',
        descr   = 'Выход фильтра №1',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 8,
                offset        = 2696,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 2688
                },
            },
        AO =
            {
                {
                node          = 8,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                9,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'CIP1V1',
        descr   = 'Танки №1-4. В дренаж CIP-(NC)',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8925,
                physical_port = 45,
                logical_port  = 14,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                14,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'CIP1V2',
        descr   = 'Танки №5-8. В дренаж CIP-(NC)',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6876,
                physical_port = 44,
                logical_port  = 13,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                13,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR1V1',
        descr   = 'Теплообменник №1. Отсечной клапан. пара',
        dtype   = 0,
        subtype = 17, -- V_IOLINK_VTUG_DO1_DI2
        article = 'BURKERT.8801',
        DI =
            {
                {
                -- Открыт
                node          = 2,
                offset        = 3072,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 3072
                },
                {
                -- Закрыт
                node          = 2,
                offset        = 3080,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 3072
                },
            },
        AO =
            {
                {
                node          = 2,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                1,      --R_VTUG_NUMBER
                1,      --R_VTUG_SIZE
                },
        par = {5000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR1V101',
        descr   = 'Теплообменник №1. Подача воды',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'IFM.IFT203',
        DO =
            {
                {
                node          = 2,
                offset        = 531,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        },

        {
        name    = 'HEAT_EXCR1V2',
        descr   = 'Теплообменник №1. Отсечной клапан. Лёд.вода',
        dtype   = 0,
        subtype = 17, -- V_IOLINK_VTUG_DO1_DI2
        article = 'BURKERT.8801',
        DI =
            {
                {
                -- Открыт
                node          = 2,
                offset        = 3073,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 3072
                },
                {
                -- Закрыт
                node          = 2,
                offset        = 3081,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 3072
                },
            },
        AO =
            {
                {
                node          = 2,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                2,      --R_VTUG_NUMBER
                1,      --R_VTUG_SIZE
                },
        par = {5000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR1V3',
        descr   = 'Теплообменник №1. Охлаждение-подогрев. вход',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 2,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 2,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR1V4',
        descr   = 'Теплообменник №1. Охлаждение-подогрев. выход',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 2,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 2,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR1V5',
        descr   = 'Теплообменник №1. Выход лед. воды',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 2,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 2,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR1V6',
        descr   = 'Теплообменник №1. Вход воды',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 2,
                offset        = 3074,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 3072
                },
            },
        AO =
            {
                {
                node          = 2,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                3,      --R_VTUG_NUMBER
                1,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR2V1',
        descr   = 'Теплообменник №1. Отсечной клапан. пара',
        dtype   = 0,
        subtype = 17, -- V_IOLINK_VTUG_DO1_DI2
        article = 'BURKERT.8801',
        DI =
            {
                {
                -- Открыт
                node          = 2,
                offset        = 3076,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 3072
                },
                {
                -- Закрыт
                node          = 2,
                offset        = 3082,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 3072
                },
            },
        AO =
            {
                {
                node          = 2,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                5,      --R_VTUG_NUMBER
                1,      --R_VTUG_SIZE
                },
        par = {5000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR2V101',
        descr   = 'Теплообменник №1. Подача воды',
        dtype   = 0,
        subtype = 1, -- V_DO1
        article = 'IFM.IFT203',
        DO =
            {
                {
                node          = 2,
                offset        = 1043,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        },

        {
        name    = 'HEAT_EXCR2V2',
        descr   = 'Теплообменник №1. Отсечной клапан. Лёд.вода',
        dtype   = 0,
        subtype = 17, -- V_IOLINK_VTUG_DO1_DI2
        article = 'BURKERT.8801',
        DI =
            {
                {
                -- Открыт
                node          = 2,
                offset        = 3077,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 3072
                },
                {
                -- Закрыт
                node          = 2,
                offset        = 3083,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 3072
                },
            },
        AO =
            {
                {
                node          = 2,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                6,      --R_VTUG_NUMBER
                1,      --R_VTUG_SIZE
                },
        par = {5000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR2V3',
        descr   = 'Теплообменник №2. Охлаждение-подогрев. вход',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 2,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 2,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR2V4',
        descr   = 'Теплообменник №2. Охлаждение-подогрев. выход',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 2,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 2,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR2V5',
        descr   = 'Теплообменник №2. Выход лед. воды',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 2,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 2,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'HEAT_EXCR2V6',
        descr   = 'Теплообменник №2. Вход воды',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 2,
                offset        = 3078,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 3072
                },
            },
        AO =
            {
                {
                node          = 2,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                7,      --R_VTUG_NUMBER
                1,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'M18V91',
        descr   = 'CIP-. Дренаж',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 3,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'M18V92',
        descr   = 'Линия M18. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 3,
                offset        = 101,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 101,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'MCA4V3001',
        descr   = 'CIP+. Линии R21-24',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8928,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 8928
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                17,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {5000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'MCA4V3002',
        descr   = 'CIP+. К танкам №5-8 (NO)',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8929,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 8928
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                18,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {6000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'MCA4V3102',
        descr   = 'CIP-. Танки №5-8 (NO)',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8930,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 8928
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                19,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {6000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'MCA4V4001',
        descr   = 'CIP+. Линии R1,RA',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6668,
                physical_port = 44,
                logical_port  = 13,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                13,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {5000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'MCA4V4002',
        descr   = 'CIP+. К танкам №1-4 (NO)',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6669,
                physical_port = 45,
                logical_port  = 14,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                14,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {6000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'MCA4V4102',
        descr   = 'CIP-. Танки №1-4 (NO)',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8931,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 8928
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                20,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {6000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'MCA4V91',
        descr   = 'MCA4-3. CIP+ Линия V1',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3285,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                6,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'MCA4V92',
        descr   = 'Линия V1. CIP+ В дренаж',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3286,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                7,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'PM2V91',
        descr   = 'CIP-. Дренаж',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 3,
                offset        = 103,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 103,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'PM2V92',
        descr   = 'Линия PM2. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 3,
                offset        = 105,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 105,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V1',
        descr   = 'Танк №1->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 263,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 256
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 263,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 256
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V101',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 261,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 256
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 261,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 256
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V102',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 3,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V2',
        descr   = 'Танк №2->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 265,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 256
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 265,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 256
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V21',
        descr   = 'Линия R11->Танк №1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V22',
        descr   = 'Линия R11->Танк №2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V23',
        descr   = 'Линия R11->Танк №3',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V24',
        descr   = 'Линия R11->Танк №4',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 41,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 41,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V25',
        descr   = 'Линия R11->Танк №5',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V26',
        descr   = 'Линия R11->Танк №6',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V27',
        descr   = 'Линия R11->Танк №7',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V28',
        descr   = 'Линия R11->Танк №8',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 41,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 41,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V3',
        descr   = 'Танк №3->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 291,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 291,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V4',
        descr   = 'Танк №4->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 293,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 293,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V41',
        descr   = 'Линия M18->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 3,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V42',
        descr   = 'Линия PM2->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 3,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V43',
        descr   = 'Линия RC3->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 3,
                offset        = 41,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 41,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V5',
        descr   = 'Танк №5->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 195,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 195,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V6',
        descr   = 'Танк №6->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 197,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 197,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V7',
        descr   = 'Танк №7->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 199,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 199,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V8',
        descr   = 'Танк №8->Линия R11',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 201,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 201,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V91',
        descr   = 'Линия R11. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 259,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 256
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 259,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 256
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V92',
        descr   = 'Отсечной гребёнки наполнения',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3280,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                1,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V93',
        descr   = 'Дренаж',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3281,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                2,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V94',
        descr   = 'CIP-. Дренаж',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R11V95',
        descr   = 'Линия R11. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 101,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 101,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V1',
        descr   = 'Танк №1->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 323,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 320
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 323,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 320
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V101',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 297,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 297,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V102',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 3,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V2',
        descr   = 'Танк №2->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 325,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 320
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 325,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 320
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V21',
        descr   = 'Линия R12->Танк №1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V22',
        descr   = 'Линия R12->Танк №2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V23',
        descr   = 'Линия R12->Танк №3',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V24',
        descr   = 'Линия R12->Танк №4',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 73,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 73,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V25',
        descr   = 'Линия R12->Танк №5',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V26',
        descr   = 'Линия R12->Танк №6',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V27',
        descr   = 'Линия R12->Танк №7',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V28',
        descr   = 'Линия R12->Танк №8',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 73,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 73,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V3',
        descr   = 'Танк №3->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 327,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 320
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 327,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 320
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V4',
        descr   = 'Танк №4->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 329,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 320
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 329,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 320
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V41',
        descr   = 'Линия M18->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 3,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V42',
        descr   = 'Линия PM2->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 3,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V43',
        descr   = 'Линия RC3->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 3,
                offset        = 73,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 73,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V5',
        descr   = 'Танк №5->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 227,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 227,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V6',
        descr   = 'Танк №6->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 229,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 229,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V7',
        descr   = 'Танк №7->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 231,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 231,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V8',
        descr   = 'Танк №8->Линия R12',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 233,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 233,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V91',
        descr   = 'Линия R12. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 295,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 295,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V92',
        descr   = 'Отсечной гребёнки наполнения',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3282,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                3,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V93',
        descr   = 'Дренаж',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3283,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                4,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V94',
        descr   = 'CIP-. Дренаж',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 103,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 103,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R12V95',
        descr   = 'Линия R12. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 105,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 105,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R21V1',
        descr   = 'Танк №1->Линия R21',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R21V101',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R21V2',
        descr   = 'Танк №2->Линия R21',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 73,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 73,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R21V3',
        descr   = 'Танк №3->Линия R21',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R21V4',
        descr   = 'Танк №4->Линия R21',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 101,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 101,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R21V5',
        descr   = 'Танк №5->Линия R21',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R21V6',
        descr   = 'Танк №6->Линия R21',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 69,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R21V7',
        descr   = 'Танк №7->Линия R21',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 71,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R21V8',
        descr   = 'Танк №8->Линия R21',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 73,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 73,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R21V91',
        descr   = 'Линия R21. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 67,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 64
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R22V1',
        descr   = 'Танк №1->Линия R22',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R22V101',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 105,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 105,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R22V2',
        descr   = 'Танк №2->Линия R22',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 133,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 133,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R22V3',
        descr   = 'Танк №3->Линия R22',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 135,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 135,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R22V4',
        descr   = 'Танк №4->Линия R22',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 137,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 137,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R22V5',
        descr   = 'Танк №5->Линия R22',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R22V6',
        descr   = 'Танк №6->Линия R22',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 101,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 101,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R22V7',
        descr   = 'Танк №7->Линия R22',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 103,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 103,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R22V8',
        descr   = 'Танк №8->Линия R22',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 105,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 105,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R22V91',
        descr   = 'Линия R22. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 103,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 103,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R23V1',
        descr   = 'Танк №1->Линия R23',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 167,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 167,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R23V101',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 165,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 165,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R23V2',
        descr   = 'Танк №2->Линия R23',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 169,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 169,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R23V3',
        descr   = 'Танк №3->Линия R23',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 195,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 195,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R23V4',
        descr   = 'Танк №4->Линия R23',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 197,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 197,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R23V5',
        descr   = 'Танк №5->Линия R23',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R23V6',
        descr   = 'Танк №6->Линия R23',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 133,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 133,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R23V7',
        descr   = 'Танк №7->Линия R23',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 135,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 135,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R23V8',
        descr   = 'Танк №8->Линия R23',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 137,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 137,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R23V91',
        descr   = 'Линия R23. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 163,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 163,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R24V1',
        descr   = 'Танк №1->Линия R24',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 227,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 227,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R24V101',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 201,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 201,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R24V2',
        descr   = 'Танк №2->Линия R24',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 229,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 229,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R24V3',
        descr   = 'Танк №3->Линия R24',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 231,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 231,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R24V4',
        descr   = 'Танк №4->Линия R24',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 233,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 233,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R24V5',
        descr   = 'Танк №5->Линия R24',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 163,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 163,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R24V6',
        descr   = 'Танк №6->Линия R24',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 165,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 165,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R24V7',
        descr   = 'Танк №7->Линия R24',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 167,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 167,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R24V8',
        descr   = 'Танк №8->Линия R24',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 169,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 169,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'R24V91',
        descr   = 'Линия R24. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 199,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 199,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V1',
        descr   = 'Танк №1->Линия RA1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 359,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 352
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 359,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 352
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V101',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 357,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 352
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 357,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 352
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V2',
        descr   = 'Танк №2->Линия RA1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 361,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 352
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 361,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 352
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V21',
        descr   = 'Линия RA1->Танк №1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V22',
        descr   = 'Линия RA1->Танк №2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 133,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 133,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V23',
        descr   = 'Линия RA1->Танк №3',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 135,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 135,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V24',
        descr   = 'Линия RA1->Танк №4',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 137,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 137,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V25',
        descr   = 'Линия RA1->Танк №5',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V26',
        descr   = 'Линия RA1->Танк №6',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 101,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 101,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V27',
        descr   = 'Линия RA1->Танк №7',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 103,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 103,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V28',
        descr   = 'Линия RA1->Танк №8',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 105,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 105,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V3',
        descr   = 'Танк №3->Линия RA1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 387,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 384
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 387,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 384
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V4',
        descr   = 'Танк №4->Линия RA1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 389,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 384
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 389,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 384
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V5',
        descr   = 'Танк №5->Линия RA1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 259,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 256
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 259,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 256
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V6',
        descr   = 'Танк №6->Линия RA1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 261,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 256
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 261,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 256
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V7',
        descr   = 'Танк №7->Линия RA1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 263,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 256
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 263,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 256
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V8',
        descr   = 'Танк №8->Линия RA1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 265,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 256
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 265,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 256
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V91',
        descr   = 'Линия RA1. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 355,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 352
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 355,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 352
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V92',
        descr   = 'CIP-. Дренаж',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 195,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 195,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA1V93',
        descr   = 'Линия RA1. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 197,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 197,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V1',
        descr   = 'Танк №1->Линия RA2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 419,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 416
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 419,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 416
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V101',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 393,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 384
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 393,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 384
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V2',
        descr   = 'Танк №2->Линия RA2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 421,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 416
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 421,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 416
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V21',
        descr   = 'Линия RA2->Танк №1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 163,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 163,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V22',
        descr   = 'Линия RA2->Танк №2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 165,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 165,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V23',
        descr   = 'Линия RA2->Танк №3',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 167,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 167,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V24',
        descr   = 'Линия RA2->Танк №4',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 169,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 169,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V25',
        descr   = 'Линия RA2->Танк №5',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V26',
        descr   = 'Линия RA2->Танк №6',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 133,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 133,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V27',
        descr   = 'Линия RA2->Танк №7',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 135,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 135,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V28',
        descr   = 'Линия RA2->Танк №8',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 137,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 137,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V3',
        descr   = 'Танк №3->Линия RA2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 423,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 416
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 423,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 416
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V4',
        descr   = 'Танк №4->Линия RA2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 6,
                offset        = 425,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 416
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 425,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 416
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V5',
        descr   = 'Танк №5->Линия RA2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 291,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 291,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V6',
        descr   = 'Танк №6->Линия RA2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 293,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 293,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V7',
        descr   = 'Танк №7->Линия RA2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 295,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 295,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V8',
        descr   = 'Танк №8->Линия RA2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 7,
                offset        = 297,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 297,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V91',
        descr   = 'Линия RA2. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 391,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 384
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 391,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 384
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V92',
        descr   = 'CIP-. Дренаж',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 199,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 199,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RA2V93',
        descr   = 'Линия RA2. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 201,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 201,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RC3V91',
        descr   = 'CIP-. Дренаж',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 3,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'RC3V92',
        descr   = 'Линия RC3. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 3,
                offset        = 133,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 133,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK1V1',
        descr   = 'Танк №1. Подача продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6656,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                1,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK1V11',
        descr   = 'Танк №1. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 291,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 291,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK1V12',
        descr   = 'Танк №1. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6658,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                3,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK1V13',
        descr   = 'Танк №1. CIP+ На МГ',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6659,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                4,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK1V14',
        descr   = 'Танк №1. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6660,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                5,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK1V15',
        descr   = 'Танк №1. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK1V2',
        descr   = 'Танк №1. Выход продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6657,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                2,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK1V21',
        descr   = 'Танк №1. Подача лёд. воды',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'OMR.E2A-S12KS04-M1-B1',
        DI =
            {
                {
                node          = 5,
                offset        = 6661,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                6,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK2V1',
        descr   = 'Танк №2. Подача продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6662,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                7,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK2V11',
        descr   = 'Танк №2. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 293,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 293,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK2V12',
        descr   = 'Танк №2. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6664,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                9,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK2V13',
        descr   = 'Танк №2. CIP+ На МГ',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6665,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                10,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK2V14',
        descr   = 'Танк №2. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6666,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                11,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK2V15',
        descr   = 'Танк №2. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK2V2',
        descr   = 'Танк №2. Выход продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 5,
                offset        = 6663,
                physical_port = 7,
                logical_port  = 8,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                8,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK2V21',
        descr   = 'Танк №2. Подача лёд. воды',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'OMR.E2A-S12KS04-M1-B1',
        DI =
            {
                {
                node          = 5,
                offset        = 6667,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 6656
                },
            },
        AO =
            {
                {
                node          = 5,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                12,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK3V1',
        descr   = 'Танк №3. Подача продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8912,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                1,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK3V11',
        descr   = 'Танк №3. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 295,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 295,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK3V12',
        descr   = 'Танк №3. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8914,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                3,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK3V13',
        descr   = 'Танк №3. CIP+ На МГ',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8915,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                4,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK3V14',
        descr   = 'Танк №3. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8916,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                5,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK3V15',
        descr   = 'Танк №3. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK3V2',
        descr   = 'Танк №3. Выход продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8913,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                2,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK3V21',
        descr   = 'Танк №3. Подача лёд. воды',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'OMR.E2A-S12KS04-M1-B1',
        DI =
            {
                {
                node          = 6,
                offset        = 8917,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                6,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK4V1',
        descr   = 'Танк №4. Подача продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8918,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                7,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK4V11',
        descr   = 'Танк №4. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 297,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 297,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 288
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK4V12',
        descr   = 'Танк №4. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8920,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                9,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK4V13',
        descr   = 'Танк №4. CIP+ На МГ',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8921,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                10,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK4V14',
        descr   = 'Танк №4. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8922,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                11,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK4V15',
        descr   = 'Танк №4. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 6,
                offset        = 41,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 41,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK4V2',
        descr   = 'Танк №4. Выход продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8919,
                physical_port = 7,
                logical_port  = 8,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                8,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK4V21',
        descr   = 'Танк №4. Подача лёд. воды',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'OMR.E2A-S12KS04-M1-B1',
        DI =
            {
                {
                node          = 6,
                offset        = 8923,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                12,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK5V1',
        descr   = 'Танк №5. Подача продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6864,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                1,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK5V11',
        descr   = 'Танк №5. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 4,
                offset        = 195,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 195,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK5V12',
        descr   = 'Танк №5. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6866,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                3,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK5V13',
        descr   = 'Танк №5. CIP+ На МГ',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6867,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                4,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK5V14',
        descr   = 'Танк №5. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6868,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                5,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK5V15',
        descr   = 'Танк №5. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 7,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 35,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK5V2',
        descr   = 'Танк №5. Выход продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6865,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                2,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK5V21',
        descr   = 'Танк №5. Подача лёд. воды',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'OMR.E2A-S12KS04-M1-B1',
        DI =
            {
                {
                node          = 7,
                offset        = 6869,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                6,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK6V1',
        descr   = 'Танк №6. Подача продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6870,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                7,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK6V11',
        descr   = 'Танк №6. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 4,
                offset        = 197,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 197,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK6V12',
        descr   = 'Танк №6. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6872,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                9,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK6V13',
        descr   = 'Танк №6. CIP+ На МГ',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6873,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                10,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK6V14',
        descr   = 'Танк №6. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6874,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                11,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK6V15',
        descr   = 'Танк №6. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 7,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 37,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK6V2',
        descr   = 'Танк №6. Выход продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 7,
                offset        = 6871,
                physical_port = 7,
                logical_port  = 8,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                8,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK6V21',
        descr   = 'Танк №6. Подача лёд. воды',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'OMR.E2A-S12KS04-M1-B1',
        DI =
            {
                {
                node          = 7,
                offset        = 6875,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 6864
                },
            },
        AO =
            {
                {
                node          = 7,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                12,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK7V1',
        descr   = 'Танк №7. Подача продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 4,
                offset        = 5120,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                1,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK7V11',
        descr   = 'Танк №7. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 4,
                offset        = 199,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 199,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK7V12',
        descr   = 'Танк №7. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 4,
                offset        = 5122,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                3,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK7V13',
        descr   = 'Танк №7. CIP+ На МГ',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 4,
                offset        = 5123,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                4,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK7V14',
        descr   = 'Танк №7. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 4,
                offset        = 5124,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                5,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK7V15',
        descr   = 'Танк №7. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 7,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 39,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK7V2',
        descr   = 'Танк №7. Выход продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 4,
                offset        = 5121,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                2,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK7V21',
        descr   = 'Танк №7. Подача лёд. воды',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'OMR.E2A-S12KS04-M1-B1',
        DI =
            {
                {
                node          = 4,
                offset        = 5125,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                6,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK8V1',
        descr   = 'Танк №8. Подача продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 4,
                offset        = 5126,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                7,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK8V11',
        descr   = 'Танк №8. CIP+',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 4,
                offset        = 201,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 192
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 201,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 192
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK8V12',
        descr   = 'Танк №8. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 4,
                offset        = 5128,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                9,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK8V13',
        descr   = 'Танк №8. CIP+ На МГ',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 4,
                offset        = 5129,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                10,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK8V14',
        descr   = 'Танк №8. CIP+ В байпас',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 4,
                offset        = 5130,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                11,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK8V15',
        descr   = 'Танк №8. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 7,
                offset        = 41,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 41,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 32
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK8V2',
        descr   = 'Танк №8. Выход продукта',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 4,
                offset        = 5127,
                physical_port = 7,
                logical_port  = 8,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                8,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {4000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'TANK8V21',
        descr   = 'Танк №8. Подача лёд. воды',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'OMR.E2A-S12KS04-M1-B1',
        DI =
            {
                {
                node          = 4,
                offset        = 5131,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 5120
                },
            },
        AO =
            {
                {
                node          = 4,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                12,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V101',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 6,
                offset        = 8924,
                physical_port = 44,
                logical_port  = 13,
                module_offset = 8912
                },
            },
        AO =
            {
                {
                node          = 6,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                13,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {5000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V102',
        descr   = 'Вода для проталкивания',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3284,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                5,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {5000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V1',
        descr   = 'Линия V1->Танк №1',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 227,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 227,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V2',
        descr   = 'Линия V1->Танк №2',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 229,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 229,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V3',
        descr   = 'Линия V1->Танк №3',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 231,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 231,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V4',
        descr   = 'Линия V1->Танк №4',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 5,
                offset        = 233,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 224
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 233,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 224
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V5',
        descr   = 'Линия V1->Танк №5',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 163,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 163,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V6',
        descr   = 'Линия V1->Танк №6',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 165,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 165,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V7',
        descr   = 'Линия V1->Танк №7',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 167,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 167,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V8',
        descr   = 'Линия V1->Танк №8',
        dtype   = 0,
        subtype = 15, -- V_IOLINK_MIXPROOF
        article = 'AL.9615-4003-06',
        AO =
            {
                {
                node          = 4,
                offset        = 169,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 169,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V91',
        descr   = 'Подача воды. Линия V1',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3287,
                physical_port = 7,
                logical_port  = 8,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                8,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V92',
        descr   = 'Линия V1. В дренаж',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3288,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                9,      --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V93',
        descr   = 'Линия V1. Отсечной CIP+',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3289,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                10,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V94',
        descr   = 'CIP-. Дренаж',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 259,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 256
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 259,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 256
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V95',
        descr   = 'Линия V1. CIP-',
        dtype   = 0,
        subtype = 16, -- V_IOLINK_DO1_DI2
        article = 'AL.9615-4004-20',
        AO =
            {
                {
                node          = 5,
                offset        = 261,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 256
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 261,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 256
                },
            },
        par = {10000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'V1V96',
        descr   = 'Линия V1. CIP+',
        dtype   = 0,
        subtype = 13, -- V_IOLINK_VTUG_DO1_FB_OFF
        article = 'IFM.IFT203',
        DI =
            {
                {
                node          = 3,
                offset        = 3290,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 3280
                },
            },
        AO =
            {
                {
                node          = 3,
                offset        = 3,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        rt_par = 
                {
                11,     --R_VTUG_NUMBER
                2,      --R_VTUG_SIZE
                },
        par = {8000 --[[P_ON_TIME]], 1 --[[P_FB]] }
        },

        {
        name    = 'ALMIX1VC1',
        descr   = 'В Almix (регулирующий)',
        dtype   = 1,
        subtype = 1, -- VC
        article = 'BURKERT.8802',
        AO =
            {
                {
                node          = 1,
                offset        = 35,
                physical_port = 6,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'ALMIX2VC1',
        descr   = 'В Almix (регулирующий)',
        dtype   = 1,
        subtype = 1, -- VC
        article = 'BURKERT.8802',
        AO =
            {
                {
                node          = 8,
                offset        = 35,
                physical_port = 6,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'HEAT_EXCR1VC1',
        descr   = 'Теплообменник №1. Регулирующий клапан. пара',
        dtype   = 1,
        subtype = 1, -- VC
        article = 'BURKERT.8802',
        AO =
            {
                {
                node          = 2,
                offset        = 193,
                physical_port = 10,
                logical_port  = 1,
                module_offset = 0
                },
            },
        },

        {
        name    = 'HEAT_EXCR1VC2',
        descr   = 'Теплообменник №1. Регулирующий клапан. Лёд.вода',
        dtype   = 1,
        subtype = 1, -- VC
        article = 'BURKERT.8802',
        AO =
            {
                {
                node          = 2,
                offset        = 194,
                physical_port = 11,
                logical_port  = 2,
                module_offset = 0
                },
            },
        },

        {
        name    = 'HEAT_EXCR2VC1',
        descr   = 'Теплообменник №1. Регулирующий клапан. пара',
        dtype   = 1,
        subtype = 1, -- VC
        article = 'BURKERT.8802',
        AO =
            {
                {
                node          = 2,
                offset        = 195,
                physical_port = 12,
                logical_port  = 3,
                module_offset = 0
                },
            },
        },

        {
        name    = 'HEAT_EXCR2VC2',
        descr   = 'Теплообменник №1. Регулирующий клапан. Лёд.вода',
        dtype   = 1,
        subtype = 1, -- VC
        article = 'BURKERT.8802',
        AO =
            {
                {
                node          = 2,
                offset        = 196,
                physical_port = 13,
                logical_port  = 4,
                module_offset = 0
                },
            },
        },

        {
        name    = 'ALMIX1M1',
        descr   = 'Мешалка Almix',
        dtype   = 2,
        subtype = 2, -- M_FREQ
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 1,
                offset        = 17,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 1,
                offset        = 2712,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 2704
                },
            },
        AO =
            {
                {
                -- Частота вращения
                node          = 1,
                offset        = 32,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        par = {20000 --[[P_ON_TIME]] }
        },

        {
        name    = 'ALMIX1M2',
        descr   = 'Водокольцевой насос',
        dtype   = 2,
        subtype = 2, -- M_FREQ
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 1,
                offset        = 18,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 1,
                offset        = 2713,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 2704
                },
            },
        AO =
            {
                {
                -- Частота вращения
                node          = 1,
                offset        = 33,
                physical_port = 2,
                logical_port  = 2,
                module_offset = 0
                },
            },
        par = {6000 --[[P_ON_TIME]] }
        },

        {
        name    = 'ALMIX1M3',
        descr   = 'Насос смеси',
        dtype   = 2,
        subtype = 2, -- M_FREQ
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 1,
                offset        = 19,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 1,
                offset        = 2714,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 2704
                },
            },
        AO =
            {
                {
                -- Частота вращения
                node          = 1,
                offset        = 34,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'ALMIX1M4',
        descr   = 'Вибромотор',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 30,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 62,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'ALMIX2M1',
        descr   = 'Мешалка Almix',
        dtype   = 2,
        subtype = 2, -- M_FREQ
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 8,
                offset        = 17,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 8,
                offset        = 2712,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 2704
                },
            },
        AO =
            {
                {
                -- Частота вращения
                node          = 8,
                offset        = 32,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        par = {20000 --[[P_ON_TIME]] }
        },

        {
        name    = 'ALMIX2M2',
        descr   = 'Водокольцевой насос',
        dtype   = 2,
        subtype = 2, -- M_FREQ
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 8,
                offset        = 18,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 8,
                offset        = 2713,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 2704
                },
            },
        AO =
            {
                {
                -- Частота вращения
                node          = 8,
                offset        = 33,
                physical_port = 2,
                logical_port  = 2,
                module_offset = 0
                },
            },
        par = {6000 --[[P_ON_TIME]] }
        },

        {
        name    = 'ALMIX2M3',
        descr   = 'Насос смеси',
        dtype   = 2,
        subtype = 2, -- M_FREQ
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 8,
                offset        = 19,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 8,
                offset        = 2714,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 2704
                },
            },
        AO =
            {
                {
                -- Частота вращения
                node          = 8,
                offset        = 34,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 0
                },
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'ALMIX2M4',
        descr   = 'Вибромотор',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 31,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 63,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'CIP1M1',
        descr   = 'Танки №1-4. ВН мойки',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 8,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 40,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 32
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'CIP1M2',
        descr   = 'Танки №5-8. ВН мойки',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 9,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 41,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 32
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'CW_TANK1M1',
        descr   = 'Насос. лед.воды',
        dtype   = 2,
        subtype = 9, -- M_ATV
        article = 'SCH.ATV320U75N4B',
        prop = --Дополнительные свойства
            {
            IP = '192.168.0.59',
            },
        par = {2000 --[[P_ON_TIME]] }
        },

        {
        name    = 'HEAT_EXCR1M1',
        descr   = 'Теплообменник №1. Насос. циркуляции воды',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 2,
                offset        = 17,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 2,
                offset        = 3084,
                physical_port = 44,
                logical_port  = 13,
                module_offset = 3072
                },
            },
        par = {2000 --[[P_ON_TIME]] }
        },

        {
        name    = 'HEAT_EXCR2M1',
        descr   = 'Теплообменник №1. Насос. циркуляции воды',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 2,
                offset        = 18,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 2,
                offset        = 3085,
                physical_port = 45,
                logical_port  = 14,
                module_offset = 3072
                },
            },
        par = {2000 --[[P_ON_TIME]] }
        },

        {
        name    = 'R11M1',
        descr   = 'Насос продукта',
        dtype   = 2,
        subtype = 9, -- M_ATV
        article = 'SCH.ATV320D11N4B',
        prop = --Дополнительные свойства
            {
            IP = '192.168.0.56',
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'R12M1',
        descr   = 'Насос продукта',
        dtype   = 2,
        subtype = 9, -- M_ATV
        article = 'SCH.ATV320D11N4B',
        prop = --Дополнительные свойства
            {
            IP = '192.168.0.55',
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'R21M1',
        descr   = 'Насос продукта',
        dtype   = 2,
        subtype = 9, -- M_ATV
        article = 'SCH.ATV320D11N4B',
        prop = --Дополнительные свойства
            {
            IP = '192.168.0.51',
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'R22M1',
        descr   = 'Насос продукта',
        dtype   = 2,
        subtype = 9, -- M_ATV
        article = 'SCH.ATV320D11N4B',
        prop = --Дополнительные свойства
            {
            IP = '192.168.0.52',
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'R23M1',
        descr   = 'Насос продукта',
        dtype   = 2,
        subtype = 9, -- M_ATV
        article = 'SCH.ATV320D11N4B',
        prop = --Дополнительные свойства
            {
            IP = '192.168.0.53',
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'R24M1',
        descr   = 'Насос продукта',
        dtype   = 2,
        subtype = 9, -- M_ATV
        article = 'SCH.ATV320D11N4B',
        prop = --Дополнительные свойства
            {
            IP = '192.168.0.54',
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'RA1M1',
        descr   = 'Насос продукта',
        dtype   = 2,
        subtype = 9, -- M_ATV
        article = 'SCH.ATV320D11N4B',
        prop = --Дополнительные свойства
            {
            IP = '192.168.0.58',
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'RA2M1',
        descr   = 'Насос продукта',
        dtype   = 2,
        subtype = 9, -- M_ATV
        article = 'SCH.ATV320D11N4B',
        prop = --Дополнительные свойства
            {
            IP = '192.168.0.57',
            },
        par = {5000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK1M1',
        descr   = 'Танк №1. Донная мешалка',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 10,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 42,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 32
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK1M2',
        descr   = 'Танк №1. Мешалка. боковая нижняя ',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 11,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 43,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 32
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK1M3',
        descr   = 'Танк №1. Мешалка. боковая верхняя',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 12,
                physical_port = 44,
                logical_port  = 13,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 44,
                physical_port = 44,
                logical_port  = 13,
                module_offset = 32
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK2M1',
        descr   = 'Танк №2. Донная мешалка',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 13,
                physical_port = 45,
                logical_port  = 14,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 45,
                physical_port = 45,
                logical_port  = 14,
                module_offset = 32
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK2M2',
        descr   = 'Танк №2. Мешалка. боковая нижняя ',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 14,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 46,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 32
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK2M3',
        descr   = 'Танк №2. Мешалка. боковая верхняя',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 15,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 47,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 32
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK3M1',
        descr   = 'Танк №3. Донная мешалка',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 16,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 48,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK3M2',
        descr   = 'Танк №3. Мешалка. боковая нижняя ',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 17,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 49,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK3M3',
        descr   = 'Танк №3. Мешалка. боковая верхняя',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 18,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 50,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK4M1',
        descr   = 'Танк №4. Мешалка',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 19,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 51,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK5M1',
        descr   = 'Танк №5. Мешалка',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 20,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 52,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK6M1',
        descr   = 'Танк №6. Донная мешалка',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 21,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 53,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK6M2',
        descr   = 'Танк №6. Мешалка. боковая нижняя ',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 22,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 54,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK6M3',
        descr   = 'Танк №6. Мешалка. боковая верхняя',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 23,
                physical_port = 7,
                logical_port  = 8,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 55,
                physical_port = 7,
                logical_port  = 8,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK7M1',
        descr   = 'Танк №7. Донная мешалка',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 24,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 56,
                physical_port = 40,
                logical_port  = 9,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK7M2',
        descr   = 'Танк №7. Мешалка. боковая нижняя ',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 25,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 57,
                physical_port = 41,
                logical_port  = 10,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK7M3',
        descr   = 'Танк №7. Мешалка. боковая верхняя',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 26,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 58,
                physical_port = 42,
                logical_port  = 11,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK8M1',
        descr   = 'Танк №8. Донная мешалка',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 27,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 59,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK8M2',
        descr   = 'Танк №8. Мешалка. боковая нижняя ',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 28,
                physical_port = 44,
                logical_port  = 13,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 60,
                physical_port = 44,
                logical_port  = 13,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'TANK8M3',
        descr   = 'Танк №8. Мешалка. боковая верхняя',
        dtype   = 2,
        subtype = 1, -- M
        article = '',
        DO =
            {
                {
                -- Пуск
                node          = 10,
                offset        = 29,
                physical_port = 45,
                logical_port  = 14,
                module_offset = 0
                },
            },
        DI =
            {
                {
                -- Обратная связь
                node          = 10,
                offset        = 61,
                physical_port = 45,
                logical_port  = 14,
                module_offset = 48
                },
            },
        par = {3000 --[[P_ON_TIME]] }
        },

        {
        name    = 'ALMIX1LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'E&H.FTL33-GR7N2ABW5J',
        AI =
            {
                {
                node          = 1,
                offset        = 105,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 100
                },
            },
        par = {1000 --[[P_DT]], 1 --[[P_ERR]] }
        },

        {
        name    = 'ALMIX1LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'E&H.FTL33-GR7N2ABW5J',
        AI =
            {
                {
                node          = 1,
                offset        = 106,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 100
                },
            },
        par = {1000 --[[P_DT]], 1 --[[P_ERR]] }
        },

        {
        name    = 'ALMIX2LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'E&H.FTL33-GR7N2ABW5J',
        AI =
            {
                {
                node          = 8,
                offset        = 105,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 100
                },
            },
        par = {1000 --[[P_DT]], 1 --[[P_ERR]] }
        },

        {
        name    = 'ALMIX2LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'E&H.FTL33-GR7N2ABW5J',
        AI =
            {
                {
                node          = 8,
                offset        = 106,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 100
                },
            },
        par = {1000 --[[P_DT]], 1 --[[P_ERR]] }
        },

        {
        name    = 'CW_TANK1LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 6,
                offset        = 517,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 512
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'CW_TANK1LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 6,
                offset        = 518,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 512
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK1LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 5,
                offset        = 326,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 320
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK1LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 5,
                offset        = 327,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 320
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK2LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 5,
                offset        = 358,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 352
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK2LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 5,
                offset        = 359,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 352
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK3LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 6,
                offset        = 454,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 448
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK3LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 6,
                offset        = 455,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 448
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK4LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'E&H.FTL33-GR7N2ABW5J',
        AI =
            {
                {
                node          = 6,
                offset        = 486,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 480
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK4LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'E&H.FTL33-GR7N2ABW5J',
        AI =
            {
                {
                node          = 6,
                offset        = 487,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 480
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK5LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'E&H.FTL33-GR7N2ABW5J',
        AI =
            {
                {
                node          = 7,
                offset        = 326,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 320
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK5LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'E&H.FTL33-GR7N2ABW5J',
        AI =
            {
                {
                node          = 7,
                offset        = 327,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 320
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK6LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 7,
                offset        = 358,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 352
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK6LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 7,
                offset        = 359,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 352
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK7LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 4,
                offset        = 230,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 224
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK7LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 4,
                offset        = 231,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 224
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK8LS1',
        descr   = 'Нижний уровень',
        dtype   = 3,
        subtype = 3, -- LS_IOLINK_MIN
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 4,
                offset        = 262,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 256
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'TANK8LS2',
        descr   = 'Верхний уровень',
        dtype   = 3,
        subtype = 4, -- LS_IOLINK_MAX
        article = 'IFM.LMT121',
        AI =
            {
                {
                node          = 4,
                offset        = 263,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 256
                },
            },
        par = {1000 --[[P_DT]], -100 --[[P_ERR]] }
        },

        {
        name    = 'ALMIX1TE1',
        descr   = 'Температура воды',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'E&H.TM311-AAC0BH2BBB2A1',
        AI =
            {
                {
                node          = 1,
                offset        = 103,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 100
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'ALMIX2TE1',
        descr   = 'Температура воды',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'E&H.TM311-AAC0BH2BBB2A1',
        AI =
            {
                {
                node          = 8,
                offset        = 103,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 100
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'HEAT_EXCR1TE1',
        descr   = 'Теплообменник №2. Температура воды.  на входе',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 2,
                offset        = 99,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 96
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'HEAT_EXCR1TE2',
        descr   = 'Теплообменник №2. Температура воды.  на выходе',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 2,
                offset        = 100,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 96
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'HEAT_EXCR1TE3',
        descr   = 'Теплообменник №2. Температура продукта. на выходе',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 2,
                offset        = 101,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 96
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'HEAT_EXCR1TE4',
        descr   = 'Температура лёд. воды',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 2,
                offset        = 102,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 96
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'HEAT_EXCR2TE1',
        descr   = 'Теплообменник №2. Температура воды.  на входе',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 2,
                offset        = 131,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 128
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'HEAT_EXCR2TE2',
        descr   = 'Теплообменник №2. Температура воды.  на выходе',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 2,
                offset        = 132,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 128
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'HEAT_EXCR2TE3',
        descr   = 'Теплообменник №2. Температура продукта. на выходе',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 2,
                offset        = 133,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 128
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'HEAT_EXCR2TE4',
        descr   = 'Температура лёд. воды',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 2,
                offset        = 134,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 128
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'M18TE3',
        descr   = 'Теплообменник. Температура продукта. на выходе',
        dtype   = 4,
        subtype = 3, -- TE_VIRT
        article = '',
        },

        {
        name    = 'PM2TE3',
        descr   = 'Теплообменник. Температура продукта. на выходе',
        dtype   = 4,
        subtype = 3, -- TE_VIRT
        article = '',
        },

        {
        name    = 'RC3TE3',
        descr   = 'Теплообменник. Температура продукта. на выходе',
        dtype   = 4,
        subtype = 3, -- TE_VIRT
        article = '',
        },

        {
        name    = 'TANK1TE1',
        descr   = 'Температура в танке',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2532',
        AI =
            {
                {
                node          = 5,
                offset        = 325,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 320
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'TANK2TE1',
        descr   = 'Температура в танке',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 5,
                offset        = 357,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 352
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'TANK3TE1',
        descr   = 'Температура в танке',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2532',
        AI =
            {
                {
                node          = 6,
                offset        = 453,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 448
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'TANK4TE1',
        descr   = 'Температура в танке',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 6,
                offset        = 485,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 480
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'TANK5TE1',
        descr   = 'Температура в танке',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2435',
        AI =
            {
                {
                node          = 7,
                offset        = 325,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 320
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'TANK6TE1',
        descr   = 'Температура в танке',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2532',
        AI =
            {
                {
                node          = 7,
                offset        = 357,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 352
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'TANK7TE1',
        descr   = 'Температура в танке',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2532',
        AI =
            {
                {
                node          = 4,
                offset        = 229,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 224
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'TANK8TE1',
        descr   = 'Температура в танке',
        dtype   = 4,
        subtype = 2, -- TE_IOLINK
        article = 'IFM.TA2532',
        AI =
            {
                {
                node          = 4,
                offset        = 261,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 256
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]] }
        },

        {
        name    = 'ALMIX1FS1',
        descr   = 'Наличие потока',
        dtype   = 5,
        subtype = 1, -- FS
        article = 'IFM.SI6700',
        DI =
            {
                {
                node          = 1,
                offset        = 2130,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 132
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'ALMIX2FS1',
        descr   = 'Наличие потока',
        dtype   = 5,
        subtype = 1, -- FS
        article = 'IFM.SI6700',
        DI =
            {
                {
                node          = 8,
                offset        = 2130,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 132
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'ALMIX1GS1',
        descr   = 'Датчик люка',
        dtype   = 6,
        subtype = 1, -- GS
        article = 'Allen-Bradley.Rotacam',
        DI =
            {
                {
                node          = 1,
                offset        = 2715,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 2704
                },
            },
        par = {100 --[[P_DT]] }
        },

        {
        name    = 'ALMIX2GS1',
        descr   = 'Датчик люка',
        dtype   = 6,
        subtype = 1, -- GS
        article = 'Allen-Bradley.Rotacam',
        DI =
            {
                {
                node          = 8,
                offset        = 2715,
                physical_port = 43,
                logical_port  = 12,
                module_offset = 2704
                },
            },
        par = {100 --[[P_DT]] }
        },

        {
        name    = 'TANK1GS1',
        descr   = 'Танк №1. Датчик. положения люка',
        dtype   = 6,
        subtype = 1, -- GS
        article = 'IFM.IIT205',
        DI =
            {
                {
                node          = 10,
                offset        = 576,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 576
                },
            },
        par = {100 --[[P_DT]] }
        },

        {
        name    = 'TANK2GS1',
        descr   = 'Танк №2. Датчик. положения люка',
        dtype   = 6,
        subtype = 1, -- GS
        article = 'IFM.IIT205',
        DI =
            {
                {
                node          = 10,
                offset        = 577,
                physical_port = 1,
                logical_port  = 2,
                module_offset = 576
                },
            },
        par = {100 --[[P_DT]] }
        },

        {
        name    = 'TANK3GS1',
        descr   = 'Танк №3. Датчик. положения люка',
        dtype   = 6,
        subtype = 1, -- GS
        article = 'IFM.IIT205',
        DI =
            {
                {
                node          = 10,
                offset        = 578,
                physical_port = 2,
                logical_port  = 3,
                module_offset = 576
                },
            },
        par = {100 --[[P_DT]] }
        },

        {
        name    = 'TANK4GS1',
        descr   = 'Танк №4. Датчик. положения люка',
        dtype   = 6,
        subtype = 1, -- GS
        article = 'IFM.IIT205',
        DI =
            {
                {
                node          = 10,
                offset        = 579,
                physical_port = 3,
                logical_port  = 4,
                module_offset = 576
                },
            },
        par = {100 --[[P_DT]] }
        },

        {
        name    = 'TANK5GS1',
        descr   = 'Танк №5. Датчик. положения люка',
        dtype   = 6,
        subtype = 1, -- GS
        article = 'IFM.IIT205',
        DI =
            {
                {
                node          = 10,
                offset        = 580,
                physical_port = 4,
                logical_port  = 5,
                module_offset = 576
                },
            },
        par = {100 --[[P_DT]] }
        },

        {
        name    = 'TANK6GS1',
        descr   = 'Танк №6. Датчик. положения люка',
        dtype   = 6,
        subtype = 1, -- GS
        article = 'IFM.IIT205',
        DI =
            {
                {
                node          = 10,
                offset        = 581,
                physical_port = 5,
                logical_port  = 6,
                module_offset = 576
                },
            },
        par = {100 --[[P_DT]] }
        },

        {
        name    = 'TANK7GS1',
        descr   = 'Танк №7. Датчик. положения люка',
        dtype   = 6,
        subtype = 1, -- GS
        article = 'IFM.IIT205',
        DI =
            {
                {
                node          = 10,
                offset        = 582,
                physical_port = 6,
                logical_port  = 7,
                module_offset = 576
                },
            },
        par = {100 --[[P_DT]] }
        },

        {
        name    = 'TANK8GS1',
        descr   = 'Танк №8. Датчик. положения люка',
        dtype   = 6,
        subtype = 1, -- GS
        article = 'IFM.IIT205',
        DI =
            {
                {
                node          = 10,
                offset        = 583,
                physical_port = 7,
                logical_port  = 8,
                module_offset = 576
                },
            },
        par = {100 --[[P_DT]] }
        },

        {
        name    = 'M18FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 4, -- FQT_VIRT
        article = '',
        },

        {
        name    = 'PM2FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 4, -- FQT_VIRT
        article = '',
        },

        {
        name    = 'R11FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 5H3B50-GRIBAEAFBAFDCS0BA1',
        AI =
            {
                {
                -- Объем
                node          = 3,
                offset        = 198,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 196
                },
                {
                -- Поток
                node          = 3,
                offset        = 192,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 192
                },
            },
        par = {0 --[[P_MIN_F]], 66 --[[P_MAX_F]], 0 --[[P_C0]], 15000 --[[P_DT]], 2 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'R12FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 5H3B50-GRIBAEAFBAFDCS0BA1',
        AI =
            {
                {
                -- Объем
                node          = 3,
                offset        = 201,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 199
                },
                {
                -- Поток
                node          = 3,
                offset        = 193,
                physical_port = 2,
                logical_port  = 2,
                module_offset = 192
                },
            },
        par = {0 --[[P_MIN_F]], 66 --[[P_MAX_F]], 0 --[[P_C0]], 15000 --[[P_DT]], 2 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'R21FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 5H3B50-GRIBAEAFBAFDCS0BA1',
        prop = --Дополнительные свойства
            {
            MT = 'R21M1',
            },
        AI =
            {
                {
                -- Объем
                node          = 6,
                offset        = 550,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 548
                },
                {
                -- Поток
                node          = 6,
                offset        = 544,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 544
                },
            },
        par = {0 --[[P_MIN_F]], 66 --[[P_MAX_F]], 0 --[[P_C0]], 15000 --[[P_DT]], 2 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'R22FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 5H3B50-GRIBAEAFBAFDCS0BA1',
        prop = --Дополнительные свойства
            {
            MT = 'R22M1',
            },
        AI =
            {
                {
                -- Объем
                node          = 6,
                offset        = 553,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 551
                },
                {
                -- Поток
                node          = 6,
                offset        = 545,
                physical_port = 2,
                logical_port  = 2,
                module_offset = 544
                },
            },
        par = {0 --[[P_MIN_F]], 66 --[[P_MAX_F]], 0 --[[P_C0]], 15000 --[[P_DT]], 2 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'R23FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 5H3B50-GRIBAEAFBAFDCS0BA1',
        prop = --Дополнительные свойства
            {
            MT = 'R23M1',
            },
        AI =
            {
                {
                -- Объем
                node          = 7,
                offset        = 422,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 420
                },
                {
                -- Поток
                node          = 7,
                offset        = 416,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 416
                },
            },
        par = {0 --[[P_MIN_F]], 66 --[[P_MAX_F]], 0 --[[P_C0]], 15000 --[[P_DT]], 2 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'R24FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 5H3B50-GRIBAEAFBAFDCS0BA1',
        prop = --Дополнительные свойства
            {
            MT = 'R24M1',
            },
        AI =
            {
                {
                -- Объем
                node          = 7,
                offset        = 425,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 423
                },
                {
                -- Поток
                node          = 7,
                offset        = 417,
                physical_port = 2,
                logical_port  = 2,
                module_offset = 416
                },
            },
        par = {0 --[[P_MIN_F]], 66 --[[P_MAX_F]], 0 --[[P_C0]], 15000 --[[P_DT]], 2 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'RA1FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 53H50-H0B1AA0FAD',
        prop = --Дополнительные свойства
            {
            MT = 'RA1M1',
            },
        AI =
            {
                {
                -- Объем
                node          = 6,
                offset        = 556,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 554
                },
                {
                -- Поток
                node          = 6,
                offset        = 546,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 544
                },
            },
        par = {0 --[[P_MIN_F]], 66 --[[P_MAX_F]], 0 --[[P_C0]], 10000 --[[P_DT]], 1 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'RA2FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 53H50-H0B1AA0FAD',
        prop = --Дополнительные свойства
            {
            MT = 'RA2M1',
            },
        AI =
            {
                {
                -- Объем
                node          = 7,
                offset        = 428,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 426
                },
                {
                -- Поток
                node          = 7,
                offset        = 418,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 416
                },
            },
        par = {0 --[[P_MIN_F]], 66 --[[P_MAX_F]], 0 --[[P_C0]], 10000 --[[P_DT]], 1 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'RC3FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 4, -- FQT_VIRT
        article = '',
        },

        {
        name    = 'V1FQT1',
        descr   = 'Расходомер',
        dtype   = 7,
        subtype = 2, -- FQT_F
        article = 'E&H.Promag 5H3B50-GRIBAEAFBAFDCS0BA1',
        AI =
            {
                {
                -- Объем
                node          = 3,
                offset        = 204,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 202
                },
                {
                -- Поток
                node          = 3,
                offset        = 194,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 192
                },
            },
        par = {0 --[[P_MIN_F]], 66 --[[P_MAX_F]], 0 --[[P_C0]], 15000 --[[P_DT]], 2 --[[P_ERR_MIN_FLOW]] }
        },

        {
        name    = 'CW_TANK1LT1',
        descr   = 'Текущий уровень',
        dtype   = 8,
        subtype = 5, -- LT_IOLINK
        article = 'IFM.PM1708',
        AI =
            {
                {
                node          = 6,
                offset        = 515,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 512
                },
            },
        par = {0 --[[P_C0]], 1000 --[[P_ERR]], 0.25 --[[P_MAX_P]], 0.35 --[[P_R]], 0 --[[P_H_CONE]] }
        },

        {
        name    = 'TANK1LT1',
        descr   = 'Текущий уровень',
        dtype   = 8,
        subtype = 5, -- LT_IOLINK
        article = 'IFM.PM1707',
        AI =
            {
                {
                node          = 5,
                offset        = 323,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 320
                },
            },
        par = {0 --[[P_C0]], 100000 --[[P_ERR]], 0.3 --[[P_MAX_P]], 1.33 --[[P_R]], 0.44 --[[P_H_CONE]] }
        },

        {
        name    = 'TANK2LT1',
        descr   = 'Текущий уровень',
        dtype   = 8,
        subtype = 5, -- LT_IOLINK
        article = 'IFM.PM1707',
        AI =
            {
                {
                node          = 5,
                offset        = 355,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 352
                },
            },
        par = {0 --[[P_C0]], 100000 --[[P_ERR]], 0.3 --[[P_MAX_P]], 1.33 --[[P_R]], 0.44 --[[P_H_CONE]] }
        },

        {
        name    = 'TANK3LT1',
        descr   = 'Текущий уровень',
        dtype   = 8,
        subtype = 5, -- LT_IOLINK
        article = 'IFM.PM1707',
        AI =
            {
                {
                node          = 6,
                offset        = 451,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 448
                },
            },
        par = {0 --[[P_C0]], 100000 --[[P_ERR]], 0.3 --[[P_MAX_P]], 1.33 --[[P_R]], 0.44 --[[P_H_CONE]] }
        },

        {
        name    = 'TANK4LT1',
        descr   = 'Текущий уровень',
        dtype   = 8,
        subtype = 5, -- LT_IOLINK
        article = 'IFM.PM1707',
        AI =
            {
                {
                node          = 6,
                offset        = 483,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 480
                },
            },
        par = {0 --[[P_C0]], 100000 --[[P_ERR]], 0.3 --[[P_MAX_P]], 1.345 --[[P_R]], 0.4 --[[P_H_CONE]] }
        },

        {
        name    = 'TANK5LT1',
        descr   = 'Текущий уровень',
        dtype   = 8,
        subtype = 5, -- LT_IOLINK
        article = 'IFM.PM1707',
        AI =
            {
                {
                node          = 7,
                offset        = 323,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 320
                },
            },
        par = {0 --[[P_C0]], 100000 --[[P_ERR]], 0.3 --[[P_MAX_P]], 1.345 --[[P_R]], 0.4 --[[P_H_CONE]] }
        },

        {
        name    = 'TANK6LT1',
        descr   = 'Текущий уровень',
        dtype   = 8,
        subtype = 5, -- LT_IOLINK
        article = 'IFM.PM1707',
        AI =
            {
                {
                node          = 7,
                offset        = 355,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 352
                },
            },
        par = {0 --[[P_C0]], 100000 --[[P_ERR]], 0.3 --[[P_MAX_P]], 1.33 --[[P_R]], 0.44 --[[P_H_CONE]] }
        },

        {
        name    = 'TANK7LT1',
        descr   = 'Текущий уровень',
        dtype   = 8,
        subtype = 5, -- LT_IOLINK
        article = 'IFM.PM1707',
        AI =
            {
                {
                node          = 4,
                offset        = 227,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 224
                },
            },
        par = {0 --[[P_C0]], 100000 --[[P_ERR]], 0.3 --[[P_MAX_P]], 1.33 --[[P_R]], 0.44 --[[P_H_CONE]] }
        },

        {
        name    = 'TANK8LT1',
        descr   = 'Текущий уровень',
        dtype   = 8,
        subtype = 5, -- LT_IOLINK
        article = 'IFM.PM1707',
        AI =
            {
                {
                node          = 4,
                offset        = 259,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 256
                },
            },
        par = {0 --[[P_C0]], 100000 --[[P_ERR]], 0.3 --[[P_MAX_P]], 1.33 --[[P_R]], 0.44 --[[P_H_CONE]] }
        },

        {
        name    = 'M18QT1',
        descr   = 'Преобразователь проводимости',
        dtype   = 9,
        subtype = 4, -- QT_VIRT
        article = 'IFM.LDL100',
        },

        {
        name    = 'PM2QT1',
        descr   = 'Преобразователь проводимости',
        dtype   = 9,
        subtype = 4, -- QT_VIRT
        article = 'IFM.LDL100',
        },

        {
        name    = 'R11QT1',
        descr   = 'Преобразователь проводимости',
        dtype   = 9,
        subtype = 3, -- QT_IOLINK
        article = 'IFM.LDL100',
        AI =
            {
                {
                node          = 5,
                offset        = 387,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 384
                },
            },
        par = {-100 --[[P_ERR]] }
        },

        {
        name    = 'R12QT1',
        descr   = 'Преобразователь проводимости',
        dtype   = 9,
        subtype = 3, -- QT_IOLINK
        article = 'IFM.LDL100',
        AI =
            {
                {
                node          = 5,
                offset        = 393,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 384
                },
            },
        par = {-100 --[[P_ERR]] }
        },

        {
        name    = 'RC3QT1',
        descr   = 'Преобразователь проводимости',
        dtype   = 9,
        subtype = 4, -- QT_VIRT
        article = 'IFM.LDL100',
        },

        {
        name    = 'ALMIX1HL1',
        descr   = 'Освещение',
        dtype   = 11,
        subtype = 1, -- HL
        article = 'Navigator 71 265 NLL-S-G4-2.5-12-3K',
        DO =
            {
                {
                node          = 1,
                offset        = 2131,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 132
                },
            },
        },

        {
        name    = 'ALMIX2HL1',
        descr   = 'Освещение',
        dtype   = 11,
        subtype = 1, -- HL
        article = 'Navigator 71 265 NLL-S-G4-2.5-12-3K',
        DO =
            {
                {
                node          = 8,
                offset        = 2131,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 132
                },
            },
        },

        {
        name    = 'CAB1SB1',
        descr   = 'Аварийная кнопка ',
        dtype   = 12,
        subtype = 1, -- SB
        article = 'SE.XB4BS8445',
        DI =
            {
                {
                node          = 1,
                offset        = 2719,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 2704
                },
            },
        },

        {
        name    = 'CAB2SB1',
        descr   = 'Аварийная кнопка ',
        dtype   = 12,
        subtype = 1, -- SB
        article = 'SE.XB4BS8445',
        DI =
            {
                {
                node          = 2,
                offset        = 3087,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 3072
                },
            },
        },

        {
        name    = 'CAB3SB1',
        descr   = 'Аварийная кнопка ',
        dtype   = 12,
        subtype = 1, -- SB
        article = 'SE.XB4BS8445',
        DI =
            {
                {
                node          = 3,
                offset        = 3295,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 3280
                },
            },
        },

        {
        name    = 'CAB4SB1',
        descr   = 'Аварийная кнопка ',
        dtype   = 12,
        subtype = 1, -- SB
        article = 'SE.XB4BS8445',
        DI =
            {
                {
                node          = 4,
                offset        = 4626,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 288
                },
            },
        },

        {
        name    = 'CAB5SB1',
        descr   = 'Аварийная кнопка ',
        dtype   = 12,
        subtype = 1, -- SB
        article = 'SE.XB4BS8445',
        DI =
            {
                {
                node          = 5,
                offset        = 6671,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 6656
                },
            },
        },

        {
        name    = 'CAB6SB1',
        descr   = 'Аварийная кнопка ',
        dtype   = 12,
        subtype = 1, -- SB
        article = 'SE.XB4BS8445',
        DI =
            {
                {
                node          = 6,
                offset        = 8943,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 8928
                },
            },
        },

        {
        name    = 'CAB7SB1',
        descr   = 'Аварийная кнопка ',
        dtype   = 12,
        subtype = 1, -- SB
        article = 'SE.XB4BS8445',
        DI =
            {
                {
                node          = 7,
                offset        = 6162,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 384
                },
            },
        },

        {
        name    = 'CAB8SB1',
        descr   = 'Аварийная кнопка ',
        dtype   = 12,
        subtype = 1, -- SB
        article = 'SE.XB4BS8445',
        DI =
            {
                {
                node          = 8,
                offset        = 2719,
                physical_port = 47,
                logical_port  = 16,
                module_offset = 2704
                },
            },
        },

        {
        name    = 'MCC1SB1',
        descr   = 'Аварийная кнопка ',
        dtype   = 12,
        subtype = 1, -- SB
        article = 'SE.XB4BS8445',
        DI =
            {
                {
                node          = 10,
                offset        = 82,
                physical_port = 8,
                logical_port  = 3,
                module_offset = 4
                },
            },
        },

        {
        name    = 'ALMIX1DI1',
        descr   = 'Фильтр №1 готов',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'ALMIX1DI2',
        descr   = 'Фильтр №2 готов',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'ALMIX2DI1',
        descr   = 'Фильтр №1 готов',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'ALMIX2DI2',
        descr   = 'Фильтр №2 готов',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'BOTTLERY1DI1',
        descr   = 'LIFEBIT',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'CAB1DI2',
        descr   = 'Реле безопасности KS1. Выключено',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 1,
                offset        = 2718,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 2704
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'CAB2DI2',
        descr   = 'Реле безопасности KS1. Выключено',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 2,
                offset        = 3086,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 3072
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'CAB3DI2',
        descr   = 'Реле безопасности KS1. Выключено',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 3,
                offset        = 3294,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 3280
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'CAB4DI2',
        descr   = 'Реле безопасности KS1. Выключено',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 4,
                offset        = 4625,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 288
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'CAB5DI2',
        descr   = 'Реле безопасности KS1. Выключено',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 5,
                offset        = 6670,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 6656
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'CAB6DI2',
        descr   = 'Реле безопасности KS1. Выключено',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 6,
                offset        = 8942,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 8928
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'CAB7DI2',
        descr   = 'Реле безопасности KS1. Выключено',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 7,
                offset        = 6161,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 384
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'CAB8DI2',
        descr   = 'Реле безопасности KS1. Выключено',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 8,
                offset        = 2718,
                physical_port = 46,
                logical_port  = 15,
                module_offset = 2704
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'M18DI1',
        descr   = 'Запрос мойки',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'M18DI12',
        descr   = 'Вода',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'M18DI13',
        descr   = 'Продукт',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'M18DI2',
        descr   = 'Мойка завершена',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'M18DI3',
        descr   = 'Мойка идет',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'M18DI4',
        descr   = 'Дезинфекция',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'M18DI5',
        descr   = 'Мойка завершена некорректно',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4DI1',
        descr   = 'LIFEBIT',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI1',
        descr   = 'Линия свободна',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI11',
        descr   = 'Выбран объект CIP. Линия V1',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI12',
        descr   = 'Выбран объект CIP. Линия R21',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI13',
        descr   = 'Выбран объект CIP. Линия R22',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI14',
        descr   = 'Выбран объект CIP. Линия R23',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI15',
        descr   = 'Выбран объект CIP. Линия R24',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI2',
        descr   = 'Включение ВН',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI21',
        descr   = 'Выбран объект CIP. Танк №5',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI22',
        descr   = 'Выбран объект CIP. Танк №6',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI23',
        descr   = 'Выбран объект CIP. Танк №7',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI24',
        descr   = 'Выбран объект CIP. Танк №8',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI3',
        descr   = 'Мойка окончена',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI4',
        descr   = 'Смена среды',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI5',
        descr   = 'Флипы разрешены',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI6',
        descr   = 'Мойка идет',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI7',
        descr   = 'Дезинфекция',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DI8',
        descr   = 'Мойка завершена некорректно',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI1',
        descr   = 'Линия свободна',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI11',
        descr   = 'Выбран объект CIP. Линия R11',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI12',
        descr   = 'Выбран объект CIP. Линия R12',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI13',
        descr   = 'Выбран объект CIP. Линия RA1',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI14',
        descr   = 'Выбран объект CIP. Линия RA2',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI2',
        descr   = 'Включение ВН',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI21',
        descr   = 'Выбран объект CIP. Танк №1',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI22',
        descr   = 'Выбран объект CIP. Танк №2',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI23',
        descr   = 'Выбран объект CIP. Танк №3',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI24',
        descr   = 'Выбран объект CIP. Танк №4',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI3',
        descr   = 'Мойка окончена',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI4',
        descr   = 'Смена среды',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI5',
        descr   = 'Флипы разрешены',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI6',
        descr   = 'Мойка идет',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI7',
        descr   = 'Дезинфекция',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DI8',
        descr   = 'Мойка завершена некорректно',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'MCC1DI2',
        descr   = 'Реле безопасности KS1. Выключено',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 10,
                offset        = 81,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 4
                },
            },
        par = {1000 --[[P_DT]] }
        },

        {
        name    = 'PM2DI1',
        descr   = 'Запрос мойки',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'PM2DI11',
        descr   = 'Готов к производству',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'PM2DI12',
        descr   = 'Вода',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'PM2DI13',
        descr   = 'Продукт',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'PM2DI2',
        descr   = 'Мойка завершена',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'PM2DI3',
        descr   = 'Мойка идет',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'PM2DI4',
        descr   = 'Дезинфекция',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'PM2DI5',
        descr   = 'Мойка завершена некорректно',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R21DI1',
        descr   = 'Мойка готова',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R21DI11',
        descr   = 'Готов к производству',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R21DI12',
        descr   = 'Запрос продукта',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R21DI13',
        descr   = 'Ошибка стерилизатора',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R21DI14',
        descr   = 'Запрос проталкивания',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R21DI2',
        descr   = 'Пауза',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R22DI1',
        descr   = 'Мойка готова',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R22DI11',
        descr   = 'Готов к производству',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R22DI12',
        descr   = 'Запрос продукта',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R22DI13',
        descr   = 'Ошибка стерилизатора',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R22DI14',
        descr   = 'Запрос проталкивания',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R22DI2',
        descr   = 'Пауза',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R23DI1',
        descr   = 'Мойка готова',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R23DI11',
        descr   = 'Готов к производству',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R23DI12',
        descr   = 'Запрос продукта',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R23DI13',
        descr   = 'Ошибка стерилизатора',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R23DI14',
        descr   = 'Запрос проталкивания',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R23DI2',
        descr   = 'Пауза',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R24DI1',
        descr   = 'Мойка готова',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R24DI11',
        descr   = 'Готов к производству',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R24DI12',
        descr   = 'Запрос продукта',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R24DI13',
        descr   = 'Ошибка стерилизатора',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R24DI14',
        descr   = 'Запрос проталкивания',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'R24DI2',
        descr   = 'Пауза',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'RC3DI1',
        descr   = 'Запрос мойки',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'RC3DI11',
        descr   = 'Готов к производству',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'RC3DI12',
        descr   = 'Вода',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'RC3DI13',
        descr   = 'Продукт',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'RC3DI2',
        descr   = 'Мойка завершена',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'RC3DI3',
        descr   = 'Мойка идет',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'RC3DI4',
        descr   = 'Дезинфекция',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'RC3DI5',
        descr   = 'Мойка завершена некорректно',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'T_N1DI1',
        descr   = 'LIFEBIT',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'T_PM1DI1',
        descr   = 'LIFEBIT',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'T_RC1DI1',
        descr   = 'LIFEBIT',
        dtype   = 13,
        subtype = 2, -- DI_VIRT
        article = '',
        },

        {
        name    = 'WATER1DI1',
        descr   = 'Давление воды',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 1,
                offset        = 1107,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 68
                },
            },
        },

        {
        name    = 'WATER1DI2',
        descr   = 'Давление воды',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 1,
                offset        = 1616,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 100
                },
            },
        },

        {
        name    = 'WATER2DI1',
        descr   = 'Давление воды',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 8,
                offset        = 1107,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 68
                },
            },
        },

        {
        name    = 'WATER2DI2',
        descr   = 'Давление воды',
        dtype   = 13,
        subtype = 1, -- DI
        article = '',
        DI =
            {
                {
                node          = 8,
                offset        = 1616,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 100
                },
            },
        },

        {
        name    = 'BOTTLERY1DO1',
        descr   = 'LIFEBIT',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'M18DO1',
        descr   = 'Мойка готова',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'M18DO11',
        descr   = 'Приёмник готов',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'M18DO12',
        descr   = 'Запрос воды',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'M18DO2',
        descr   = 'Пауза',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4DO1',
        descr   = 'LIFEBIT',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO1',
        descr   = 'Объект опорожнен',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO11',
        descr   = 'Линия V1',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO12',
        descr   = 'Линия R21',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO13',
        descr   = 'Линия R22',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO14',
        descr   = 'Линия R23',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO15',
        descr   = 'Линия R24',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO2',
        descr   = 'Пауза',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO21',
        descr   = 'Танк №5',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO22',
        descr   = 'Танк №6',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO23',
        descr   = 'Танк №7',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO24',
        descr   = 'Танк №8',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3DO3',
        descr   = 'Флипы завершены',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO1',
        descr   = 'Объект опорожнен',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO11',
        descr   = 'Линия R11',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO12',
        descr   = 'Линия R12',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO13',
        descr   = 'Линия RA1',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO14',
        descr   = 'Линия RA2',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO2',
        descr   = 'Пауза',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO21',
        descr   = 'Танк №1',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO22',
        descr   = 'Танк №2',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO23',
        descr   = 'Танк №3',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO24',
        descr   = 'Танк №4',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4DO3',
        descr   = 'Флипы завершены',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'PM2DO1',
        descr   = 'Мойка готова',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'PM2DO11',
        descr   = 'Приёмник готов',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'PM2DO12',
        descr   = 'Запрос воды',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'PM2DO2',
        descr   = 'Пауза',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R21DO1',
        descr   = 'Запрос мойки',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R21DO11',
        descr   = 'Источник готов',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R21DO12',
        descr   = 'Вода на входе',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R21DO13',
        descr   = 'Продукт на входе',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R21DO14',
        descr   = 'Насос включен',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R21DO15',
        descr   = 'Ошибка производства',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R21DO2',
        descr   = 'Мойка завершена',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R21DO3',
        descr   = 'Мойка идет',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R22DO1',
        descr   = 'Запрос мойки',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R22DO11',
        descr   = 'Источник готов',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R22DO12',
        descr   = 'Вода на входе',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R22DO13',
        descr   = 'Продукт на входе',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R22DO14',
        descr   = 'Насос включен',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R22DO15',
        descr   = 'Ошибка производства',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R22DO2',
        descr   = 'Мойка завершена',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R22DO3',
        descr   = 'Мойка идет',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R23DO1',
        descr   = 'Запрос мойки',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R23DO11',
        descr   = 'Источник готов',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R23DO12',
        descr   = 'Вода на входе',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R23DO13',
        descr   = 'Продукт на входе',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R23DO14',
        descr   = 'Насос включен',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R23DO15',
        descr   = 'Ошибка производства',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R23DO2',
        descr   = 'Мойка завершена',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R23DO3',
        descr   = 'Мойка идет',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R24DO1',
        descr   = 'Запрос мойки',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R24DO11',
        descr   = 'Источник готов',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R24DO12',
        descr   = 'Вода на входе',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R24DO13',
        descr   = 'Продукт на входе',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R24DO14',
        descr   = 'Насос включен',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R24DO15',
        descr   = 'Ошибка производства',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R24DO2',
        descr   = 'Мойка завершена',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'R24DO3',
        descr   = 'Мойка идет',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'RC3DO1',
        descr   = 'Мойка готова',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'RC3DO11',
        descr   = 'Приёмник готов',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'RC3DO12',
        descr   = 'Запрос воды',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'RC3DO2',
        descr   = 'Пауза',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'T_N1DO1',
        descr   = 'LIFEBIT',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'T_PM1DO1',
        descr   = 'LIFEBIT',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'T_RC1DO1',
        descr   = 'LIFEBIT',
        dtype   = 14,
        subtype = 2, -- DO_VIRT
        article = '',
        },

        {
        name    = 'ALMIX1AI1',
        descr   = 'Текущий ток миксера',
        dtype   = 15,
        subtype = 1, -- AI
        article = '',
        AI =
            {
                {
                node          = 1,
                offset        = 167,
                physical_port = 6,
                logical_port  = 4,
                module_offset = 164
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 70.4 --[[P_MAX_V]] }
        },

        {
        name    = 'ALMIX2AI1',
        descr   = 'Текущий ток миксера',
        dtype   = 15,
        subtype = 1, -- AI
        article = '',
        AI =
            {
                {
                node          = 8,
                offset        = 167,
                physical_port = 6,
                logical_port  = 4,
                module_offset = 164
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 91.5 --[[P_MAX_V]] }
        },

        {
        name    = 'R21AI11',
        descr   = 'Номер стерилизатора',
        dtype   = 15,
        subtype = 2, -- AI_VIRT
        article = '',
        },

        {
        name    = 'R21AI12',
        descr   = 'Производительность насоса',
        dtype   = 15,
        subtype = 2, -- AI_VIRT
        article = '',
        },

        {
        name    = 'R22AI11',
        descr   = 'Номер стерилизатора',
        dtype   = 15,
        subtype = 2, -- AI_VIRT
        article = '',
        },

        {
        name    = 'R22AI12',
        descr   = 'Производительность насоса',
        dtype   = 15,
        subtype = 2, -- AI_VIRT
        article = '',
        },

        {
        name    = 'R23AI11',
        descr   = 'Номер стерилизатора',
        dtype   = 15,
        subtype = 2, -- AI_VIRT
        article = '',
        },

        {
        name    = 'R23AI12',
        descr   = 'Производительность насоса',
        dtype   = 15,
        subtype = 2, -- AI_VIRT
        article = '',
        },

        {
        name    = 'R24AI11',
        descr   = 'Номер стерилизатора',
        dtype   = 15,
        subtype = 2, -- AI_VIRT
        article = '',
        },

        {
        name    = 'R24AI12',
        descr   = 'Производительность насоса',
        dtype   = 15,
        subtype = 2, -- AI_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE3AO1',
        descr   = 'Задание потока (м3/ч)',
        dtype   = 16,
        subtype = 2, -- AO_VIRT
        article = '',
        },

        {
        name    = 'MCA4LINE4AO1',
        descr   = 'Задание потока (м3/ч)',
        dtype   = 16,
        subtype = 2, -- AO_VIRT
        article = '',
        },

        {
        name    = 'ALMIX1WT1',
        descr   = 'Весы',
        dtype   = 17,
        subtype = 5, -- WT_PXC_AXL
        article = 'SMS.7MH5108-5AD00',
        AO =
            {
                {
                node          = 1,
                offset        = 170,
                physical_port = 10,
                logical_port  = 1,
                module_offset = 170
                },
            },
        AI =
            {
                {
                node          = 1,
                offset        = 172,
                physical_port = 10,
                logical_port  = 1,
                module_offset = 170
                },
            },
        par = {500 --[[P_DT]], 0 --[[P_C0]], 3.05 --[[P_K]] }
        },

        {
        name    = 'ALMIX2WT1',
        descr   = 'Весы',
        dtype   = 17,
        subtype = 5, -- WT_PXC_AXL
        article = 'SMS.7MH5108-5AD00',
        AO =
            {
                {
                node          = 8,
                offset        = 170,
                physical_port = 10,
                logical_port  = 1,
                module_offset = 170
                },
            },
        AI =
            {
                {
                node          = 8,
                offset        = 172,
                physical_port = 10,
                logical_port  = 1,
                module_offset = 170
                },
            },
        par = {500 --[[P_DT]], 0 --[[P_C0]], 3.03 --[[P_K]] }
        },

        {
        name    = 'ALMIX1PT1',
        descr   = 'Давление в Almix',
        dtype   = 18,
        subtype = 1, -- PT
        article = 'E&H.PMP23-CA7N2KB3CJ',
        AI =
            {
                {
                node          = 1,
                offset        = 164,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 164
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 2 --[[P_MAX_V]] }
        },

        {
        name    = 'ALMIX1PT2',
        descr   = 'Давление в линии',
        dtype   = 18,
        subtype = 1, -- PT
        article = 'E&H.PMP23-CA7N1KB3CJ',
        AI =
            {
                {
                node          = 1,
                offset        = 165,
                physical_port = 2,
                logical_port  = 2,
                module_offset = 164
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 25 --[[P_MAX_V]] }
        },

        {
        name    = 'ALMIX1PT3',
        descr   = 'Давление в линии',
        dtype   = 18,
        subtype = 1, -- PT
        article = 'E&H.PMP23-CA7N1KB3CJ',
        AI =
            {
                {
                node          = 1,
                offset        = 166,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 164
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 25 --[[P_MAX_V]] }
        },

        {
        name    = 'ALMIX1PT4',
        descr   = 'Разность давлений',
        dtype   = 18,
        subtype = 3, -- PT_VIRT
        article = '',
        },

        {
        name    = 'ALMIX2PT1',
        descr   = 'Давление в Almix',
        dtype   = 18,
        subtype = 1, -- PT
        article = 'E&H.PMP23-CA7N2KB3CJ',
        AI =
            {
                {
                node          = 8,
                offset        = 164,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 164
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 2 --[[P_MAX_V]] }
        },

        {
        name    = 'ALMIX2PT2',
        descr   = 'Давление в линии',
        dtype   = 18,
        subtype = 1, -- PT
        article = 'E&H.PMP23-CA7N1KB3CJ',
        AI =
            {
                {
                node          = 8,
                offset        = 165,
                physical_port = 2,
                logical_port  = 2,
                module_offset = 164
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 25 --[[P_MAX_V]] }
        },

        {
        name    = 'ALMIX2PT3',
        descr   = 'Давление в линии',
        dtype   = 18,
        subtype = 1, -- PT
        article = 'E&H.PMP23-CA7N1KB3CJ',
        AI =
            {
                {
                node          = 8,
                offset        = 166,
                physical_port = 4,
                logical_port  = 3,
                module_offset = 164
                },
            },
        par = {0 --[[P_C0]], 0 --[[P_MIN_V]], 25 --[[P_MAX_V]] }
        },

        {
        name    = 'ALMIX2PT4',
        descr   = 'Разность давлений',
        dtype   = 18,
        subtype = 3, -- PT_VIRT
        article = '',
        },

        {
        name    = 'HEAT_EXCR1PT1',
        descr   = 'Давление воды',
        dtype   = 18,
        subtype = 2, -- PT_IOLINK
        article = 'IFM.PM1705',
        AI =
            {
                {
                node          = 2,
                offset        = 163,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 160
                },
            },
        par = {-1 --[[P_ERR]] }
        },

        {
        name    = 'HEAT_EXCR2PT1',
        descr   = 'Давление воды',
        dtype   = 18,
        subtype = 2, -- PT_IOLINK
        article = 'IFM.PM1705',
        AI =
            {
                {
                node          = 2,
                offset        = 165,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 160
                },
            },
        par = {-1 --[[P_ERR]] }
        },

        {
        name    = 'ALMIX1FC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'RA1FQT1',
            OUT_VALUE = 'ALMIX1VC1',
            },
        par =
            {
            P_k = 1.5,
            P_Ti = 15,
            P_Td = 0.05,
            P_dt = 1000,
            P_max = 66,
            P_min = 0,
            P_acceleration_time = 30,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 30,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'ALMIX1PC1',
        descr   = 'Регулятор разряжения',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'ALMIX1PT1',
            OUT_VALUE = 'ALMIX1M2',
            },
        par =
            {
            P_k = 1.5,
            P_Ti = 25,
            P_Td = 0.03,
            P_dt = 500,
            P_max = 2,
            P_min = 0,
            P_acceleration_time = 30,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 55,
            P_is_reverse = 1,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'ALMIX1WC1',
        descr   = 'Регулятор ВН',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'ALMIX1WT1',
            OUT_VALUE = 'ALMIX1M3',
            },
        par =
            {
            P_k = 1.25,
            P_Ti = 20,
            P_Td = 0.05,
            P_dt = 1000,
            P_max = 600,
            P_min = 0,
            P_acceleration_time = 60,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 20,
            P_is_reverse = 1,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'ALMIX2FC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'RA2FQT1',
            OUT_VALUE = 'ALMIX2VC1',
            },
        par =
            {
            P_k = 1.5,
            P_Ti = 15,
            P_Td = 0.05,
            P_dt = 1000,
            P_max = 66,
            P_min = 0,
            P_acceleration_time = 30,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 30,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'ALMIX2PC1',
        descr   = 'Регулятор разряжения',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'ALMIX2PT1',
            OUT_VALUE = 'ALMIX2M2',
            },
        par =
            {
            P_k = 1.5,
            P_Ti = 25,
            P_Td = 0.03,
            P_dt = 500,
            P_max = 2,
            P_min = 0,
            P_acceleration_time = 30,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 55,
            P_is_reverse = 1,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'ALMIX2WC1',
        descr   = 'Регулятор ВН',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'ALMIX2WT1',
            OUT_VALUE = 'ALMIX2M3',
            },
        par =
            {
            P_k = 1.25,
            P_Ti = 20,
            P_Td = 0.05,
            P_dt = 1000,
            P_max = 600,
            P_min = 0,
            P_acceleration_time = 60,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 20,
            P_is_reverse = 1,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'CW_TANK1LC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'CW_TANK1LT1',
            OUT_VALUE = 'CW_TANK1M1',
            },
        par =
            {
            P_k = 1.5,
            P_Ti = 15,
            P_Td = 0.05,
            P_dt = 1000,
            P_max = 100,
            P_min = 0,
            P_acceleration_time = 20,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 33,
            P_is_reverse = 1,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'HEAT_EXCR1TC1',
        descr   = 'Ведущий регулятор температуры',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'HEAT_EXCR1TE3',
            OUT_VALUE = 'HEAT_EXCR1TC2',
            },
        par =
            {
            P_k = 2,
            P_Ti = 25,
            P_Td = 0.03,
            P_dt = 1000,
            P_max = 100,
            P_min = 0,
            P_acceleration_time = 80,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 80,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'HEAT_EXCR1TC2',
        descr   = 'Регулятор температуры',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'HEAT_EXCR1TE1',
            OUT_VALUE = 'HEAT_EXCR1VC1',
            },
        par =
            {
            P_k = 1,
            P_Ti = 30,
            P_Td = 0.03,
            P_dt = 1000,
            P_max = 100,
            P_min = 0,
            P_acceleration_time = 80,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'HEAT_EXCR1TC3',
        descr   = 'Ведущий регулятор температуры',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'HEAT_EXCR1TE3',
            OUT_VALUE = 'HEAT_EXCR1VC2',
            },
        par =
            {
            P_k = 2,
            P_Ti = 20,
            P_Td = 0.03,
            P_dt = 1000,
            P_max = 100,
            P_min = 0,
            P_acceleration_time = 80,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 10,
            P_is_reverse = 1,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'HEAT_EXCR2TC1',
        descr   = 'Ведущий регулятор температуры',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'HEAT_EXCR2TE3',
            OUT_VALUE = 'HEAT_EXCR2TC2',
            },
        par =
            {
            P_k = 2,
            P_Ti = 25,
            P_Td = 0.03,
            P_dt = 1000,
            P_max = 100,
            P_min = 0,
            P_acceleration_time = 80,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 80,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'HEAT_EXCR2TC2',
        descr   = 'Регулятор температуры',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'HEAT_EXCR2TE1',
            OUT_VALUE = 'HEAT_EXCR2VC1',
            },
        par =
            {
            P_k = 1,
            P_Ti = 30,
            P_Td = 0.03,
            P_dt = 1000,
            P_max = 100,
            P_min = 0,
            P_acceleration_time = 80,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'HEAT_EXCR2TC3',
        descr   = 'Ведущий регулятор температуры',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'HEAT_EXCR2TE3',
            OUT_VALUE = 'HEAT_EXCR2VC2',
            },
        par =
            {
            P_k = 2,
            P_Ti = 20,
            P_Td = 0.03,
            P_dt = 1000,
            P_max = 100,
            P_min = 0,
            P_acceleration_time = 80,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 10,
            P_is_reverse = 1,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'R11FC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'R11FQT1',
            OUT_VALUE = 'R11M1',
            },
        par =
            {
            P_k = 1,
            P_Ti = 15,
            P_Td = 0.01,
            P_dt = 1000,
            P_max = 66,
            P_min = 0,
            P_acceleration_time = 30,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'R12FC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'R12FQT1',
            OUT_VALUE = 'R12M1',
            },
        par =
            {
            P_k = 1,
            P_Ti = 15,
            P_Td = 0.01,
            P_dt = 1000,
            P_max = 66,
            P_min = 0,
            P_acceleration_time = 30,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'R21FC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'R21FQT1',
            OUT_VALUE = 'R21M1',
            },
        par =
            {
            P_k = 1,
            P_Ti = 12,
            P_Td = 0.01,
            P_dt = 1000,
            P_max = 66,
            P_min = 0,
            P_acceleration_time = 60,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'R22FC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'R22FQT1',
            OUT_VALUE = 'R22M1',
            },
        par =
            {
            P_k = 1,
            P_Ti = 12,
            P_Td = 0.01,
            P_dt = 1000,
            P_max = 66,
            P_min = 0,
            P_acceleration_time = 60,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'R23FC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'R23FQT1',
            OUT_VALUE = 'R23M1',
            },
        par =
            {
            P_k = 1,
            P_Ti = 12,
            P_Td = 0.01,
            P_dt = 1000,
            P_max = 66,
            P_min = 0,
            P_acceleration_time = 60,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'R24FC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'R24FQT1',
            OUT_VALUE = 'R24M1',
            },
        par =
            {
            P_k = 1,
            P_Ti = 12,
            P_Td = 0.01,
            P_dt = 1000,
            P_max = 66,
            P_min = 0,
            P_acceleration_time = 80,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'RA1FC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'RA1FQT1',
            OUT_VALUE = 'RA1M1',
            },
        par =
            {
            P_k = 1,
            P_Ti = 12,
            P_Td = 0.01,
            P_dt = 1000,
            P_max = 66,
            P_min = 0,
            P_acceleration_time = 80,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'RA2FC1',
        descr   = 'Регулятор расхода',
        dtype   = 20,
        subtype = 1, -- C_PID
        article = '',
        prop = --Дополнительные свойства
            {
            IN_VALUE = 'RA2FQT1',
            OUT_VALUE = 'RA2M1',
            },
        par =
            {
            P_k = 1,
            P_Ti = 12,
            P_Td = 0.01,
            P_dt = 1000,
            P_max = 66,
            P_min = 0,
            P_acceleration_time = 80,
            P_is_manual_mode = 0,
            P_U_manual = 65,
            P_k2 = 0,
            P_Ti2 = 0,
            P_Td2 = 0,
            P_out_max = 100,
            P_out_min = 0,
            P_is_reverse = 0,
            P_is_zero_start = 1
            }
        },

        {
        name    = 'CAB1HLA1',
        descr   = 'Сигнальная колонна. ',
        dtype   = 21,
        subtype = 3, -- HLA_IOLINK
        article = 'PXC.1191993',
        prop = --Дополнительные свойства
            {
            SIGNALS_SEQUENCE = 'GYRA',
            },
        AO =
            {
                {
                node          = 1,
                offset        = 135,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 132
                },
            },
        AI =
            {
                {
                node          = 1,
                offset        = 135,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 132
                },
            },
        },

        {
        name    = 'CAB8HLA1',
        descr   = 'Сигнальная колонна. ',
        dtype   = 21,
        subtype = 3, -- HLA_IOLINK
        article = 'PXC.1191993',
        prop = --Дополнительные свойства
            {
            SIGNALS_SEQUENCE = 'GYRA',
            },
        AO =
            {
                {
                node          = 8,
                offset        = 135,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 132
                },
            },
        AI =
            {
                {
                node          = 8,
                offset        = 135,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 132
                },
            },
        },

        {
        name    = 'MCC1HLA1',
        descr   = 'Сигнальная колонна. ',
        dtype   = 21,
        subtype = 3, -- HLA_IOLINK
        article = 'PXC.1191993',
        prop = --Дополнительные свойства
            {
            SIGNALS_SEQUENCE = 'GYRA',
            },
        AO =
            {
                {
                node          = 10,
                offset        = 16,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 4
                },
            },
        AI =
            {
                {
                node          = 10,
                offset        = 16,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 4
                },
            },
        },

        {
        name    = 'CAB1G1',
        descr   = '',
        dtype   = 25,
        subtype = 1, -- G_IOL_4
        article = 'PXC.1252696',
        AO =
            {
                {
                node          = 1,
                offset        = 136,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 132
                },
            },
        AI =
            {
                {
                node          = 1,
                offset        = 136,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 132
                },
            },
        },

        {
        name    = 'CAB2G1',
        descr   = '',
        dtype   = 25,
        subtype = 1, -- G_IOL_4
        article = 'PXC.1252696',
        AO =
            {
                {
                node          = 2,
                offset        = 167,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 2,
                offset        = 167,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        },

        {
        name    = 'CAB3G1',
        descr   = '',
        dtype   = 25,
        subtype = 1, -- G_IOL_4
        article = 'PXC.1252696',
        AO =
            {
                {
                node          = 3,
                offset        = 163,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        AI =
            {
                {
                node          = 3,
                offset        = 163,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 160
                },
            },
        },

        {
        name    = 'CAB4G1',
        descr   = '',
        dtype   = 25,
        subtype = 1, -- G_IOL_4
        article = 'PXC.1252696',
        AO =
            {
                {
                node          = 4,
                offset        = 291,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 288
                },
            },
        AI =
            {
                {
                node          = 4,
                offset        = 291,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 288
                },
            },
        },

        {
        name    = 'CAB5G1',
        descr   = '',
        dtype   = 25,
        subtype = 1, -- G_IOL_4
        article = 'PXC.1252696',
        AO =
            {
                {
                node          = 5,
                offset        = 399,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 384
                },
            },
        AI =
            {
                {
                node          = 5,
                offset        = 399,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 384
                },
            },
        },

        {
        name    = 'CAB6G1',
        descr   = '',
        dtype   = 25,
        subtype = 1, -- G_IOL_4
        article = 'PXC.1252696',
        AO =
            {
                {
                node          = 6,
                offset        = 519,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 512
                },
            },
        AI =
            {
                {
                node          = 6,
                offset        = 519,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 512
                },
            },
        },

        {
        name    = 'CAB7G1',
        descr   = '',
        dtype   = 25,
        subtype = 1, -- G_IOL_4
        article = 'PXC.1252696',
        AO =
            {
                {
                node          = 7,
                offset        = 387,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 384
                },
            },
        AI =
            {
                {
                node          = 7,
                offset        = 387,
                physical_port = 12,
                logical_port  = 4,
                module_offset = 384
                },
            },
        },

        {
        name    = 'CAB8G1',
        descr   = '',
        dtype   = 25,
        subtype = 1, -- G_IOL_4
        article = 'PXC.1252696',
        AO =
            {
                {
                node          = 8,
                offset        = 136,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 132
                },
            },
        AI =
            {
                {
                node          = 8,
                offset        = 136,
                physical_port = 4,
                logical_port  = 2,
                module_offset = 132
                },
            },
        },

        {
        name    = 'MCC1G1',
        descr   = '',
        dtype   = 25,
        subtype = 2, -- G_IOL_8
        article = 'PXC.1252697',
        AO =
            {
                {
                node          = 10,
                offset        = 7,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 4
                },
            },
        AI =
            {
                {
                node          = 10,
                offset        = 7,
                physical_port = 0,
                logical_port  = 1,
                module_offset = 4
                },
            },
        },

        {
        name    = 'BOTTLERY1WATCHDOG1',
        descr   = 'Гребёнка розлива',
        dtype   = 26,
        subtype = 1, -- WATCHDOG
        article = '',
        prop = --Дополнительные свойства
            {
            DI_dev = 'BOTTLERY1DI1',
            DO_dev = 'BOTTLERY1DO1',
            },
        par = {4000 --[[P_T_GEN]], 20000 --[[P_T_ERR]] }
        },

        {
        name    = 'MCA4WATCHDOG1',
        descr   = 'MCA4',
        dtype   = 26,
        subtype = 1, -- WATCHDOG
        article = '',
        prop = --Дополнительные свойства
            {
            DI_dev = 'MCA4DI1',
            DO_dev = 'MCA4DO1',
            },
        par = {4000 --[[P_T_GEN]], 10000 --[[P_T_ERR]] }
        },

        {
        name    = 'T_N1WATCHDOG1',
        descr   = 'Танки нормализации',
        dtype   = 26,
        subtype = 1, -- WATCHDOG
        article = '',
        prop = --Дополнительные свойства
            {
            DI_dev = 'T_N1DI1',
            DO_dev = 'T_N1DO1',
            },
        par = {4000 --[[P_T_GEN]], 10000 --[[P_T_ERR]] }
        },

        {
        name    = 'T_PM1WATCHDOG1',
        descr   = 'Танки аппаратного(ОБМ)',
        dtype   = 26,
        subtype = 1, -- WATCHDOG
        article = '',
        prop = --Дополнительные свойства
            {
            DI_dev = 'T_PM1DI1',
            DO_dev = 'T_PM1DO1',
            },
        par = {4000 --[[P_T_GEN]], 10000 --[[P_T_ERR]] }
        },

        {
        name    = 'T_RC1WATCHDOG1',
        descr   = 'Сырые сливки',
        dtype   = 26,
        subtype = 1, -- WATCHDOG
        article = '',
        prop = --Дополнительные свойства
            {
            DI_dev = 'T_RC1DI1',
            DO_dev = 'T_RC1DO1',
            },
        par = {4000 --[[P_T_GEN]], 10000 --[[P_T_ERR]] }
        },

    }
