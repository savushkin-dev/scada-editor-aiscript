--Eplanner version = 2025.10.9414.27057
remote_gateways =
{
    ['BN1-Гребенка-розлива'] =
    {
        ip         = '10.170.100.190', -- адрес удаленного контроллера
        ipemulator = '127.0.0.1',      -- адрес удаленного контроллера при эмуляции на столе
        emulation  = false,            -- включение эмуляции
        cycletime  = 200,              -- время ожидания между опросами контроллера
        timeout    = 300,              -- таймаут для modbus клиента
        port       = 10502,            -- modbus - порт удаленного контроллера
        enabled    = true,             -- включить/выключить шлюз
        station    = 4,                -- номер станции modbus удаленного клиента
        AI =
        {
        __R21AI11,
        __R21AI12,
        __R22AI11,
        __R22AI12,
        __R23AI11,
        __R23AI12,
        },
        DI =
        {
        __R21DI1,
        __R21DI2,
        __R21DI11,
        __R21DI12,
        __R21DI13,
        __R21DI14,
        __R22DI1,
        __R22DI2,
        __R22DI11,
        __R22DI12,
        __R22DI13,
        __R22DI14,
        __R23DI1,
        __R23DI2,
        __R23DI11,
        __R23DI12,
        __R23DI13,
        __R23DI14,
        __BOTTLERY1DI1,
        },
        DO =
        {
        R21DO1,
        R21DO2,
        R21DO3,
        R21DO11,
        R21DO12,
        R21DO13,
        R21DO14,
        R21DO15,
        R22DO1,
        R22DO2,
        R22DO3,
        R22DO11,
        R22DO12,
        R22DO13,
        R22DO14,
        R22DO15,
        R23DO1,
        R23DO2,
        R23DO3,
        R23DO11,
        R23DO12,
        R23DO13,
        R23DO14,
        R23DO15,
        BOTTLERY1DO1,
        },
    },
    ['BN1-Сырые-сливки'] =
    {
        ip         = '10.170.98.100', -- адрес удаленного контроллера
        ipemulator = '127.0.0.1',     -- адрес удаленного контроллера при эмуляции на столе
        emulation  = false,           -- включение эмуляции
        cycletime  = 200,             -- время ожидания между опросами контроллера
        timeout    = 300,             -- таймаут для modbus клиента
        port       = 10502,           -- modbus - порт удаленного контроллера
        enabled    = true,            -- включить/выключить шлюз
        station    = 12,              -- номер станции modbus удаленного клиента
        DI =
        {
        __RC3DI1,
        __RC3DI2,
        __RC3DI3,
        __RC3DI11,
        __RC3DI12,
        __RC3DI13,
        __T_RC1DI1,
        },
        DO =
        {
        RC3DO1,
        RC3DO2,
        RC3DO11,
        RC3DO12,
        T_RC1DO1,
        },
    },
}
shared_devices =
{
    [4] =
    {
        projectName = "BN1-Танки-аппаратного-цеха",
        DI =
        {
        __T_PM1DI1,
        __PM2DI1,
        __PM2DI2,
        __PM2DI11,
        __PM2DI12,
        __PM2DI13,
        },
        DO =
        {
        T_PM1DO1,
        PM2DO1,
        PM2DO2,
        PM2DO11,
        PM2DO12,
        },
    },
    [223] =
    {
        projectName = "BN1-МСА4",
        AO =
        {
        MCA4LINE3AO1,
        MCA4LINE4AO1,
        },
        DI =
        {
        __MCA4LINE3DI1,
        __MCA4LINE3DI2,
        __MCA4LINE3DI3,
        __MCA4LINE3DI4,
        __MCA4LINE3DI5,
        __MCA4LINE3DI6,
        __MCA4LINE3DI7,
        __MCA4LINE3DI8,
        __MCA4LINE3DI11,
        __MCA4LINE3DI12,
        __MCA4LINE3DI13,
        __MCA4LINE3DI14,
        __MCA4LINE3DI15,
        __MCA4LINE3DI21,
        __MCA4LINE3DI22,
        __MCA4LINE3DI23,
        __MCA4LINE3DI24,
        __MCA4DI1,
        __MCA4LINE4DI1,
        __MCA4LINE4DI2,
        __MCA4LINE4DI3,
        __MCA4LINE4DI4,
        __MCA4LINE4DI5,
        __MCA4LINE4DI6,
        __MCA4LINE4DI7,
        __MCA4LINE4DI8,
        __MCA4LINE4DI11,
        __MCA4LINE4DI12,
        __MCA4LINE4DI13,
        __MCA4LINE4DI14,
        __MCA4LINE4DI21,
        __MCA4LINE4DI22,
        __MCA4LINE4DI23,
        __MCA4LINE4DI24,
        },
        DO =
        {
        MCA4LINE3DO1,
        MCA4LINE3DO2,
        MCA4LINE3DO3,
        MCA4LINE3DO11,
        MCA4LINE3DO12,
        MCA4LINE3DO13,
        MCA4LINE3DO14,
        MCA4LINE3DO15,
        MCA4LINE3DO21,
        MCA4LINE3DO22,
        MCA4LINE3DO23,
        MCA4LINE3DO24,
        MCA4DO1,
        MCA4LINE4DO1,
        MCA4LINE4DO2,
        MCA4LINE4DO3,
        MCA4LINE4DO11,
        MCA4LINE4DO12,
        MCA4LINE4DO13,
        MCA4LINE4DO14,
        MCA4LINE4DO21,
        MCA4LINE4DO22,
        MCA4LINE4DO23,
        MCA4LINE4DO24,
        },
    },
    [2] =
    {
        projectName = "BN1-Танки-нормализации-молока",
        DI =
        {
        __T_N1DI1,
        __M18DI1,
        __M18DI2,
        __M18DI3,
        __M18DI12,
        __M18DI13,
        },
        DO =
        {
        T_N1DO1,
        M18DO1,
        M18DO2,
        M18DO11,
        M18DO12,
        },
    },
}
