--version  = 1
--Eplanner version = 2025.12.9487.21403
--PAC_name = 'BN1-Растворение'
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--Базовая функциональность
require( "cooler" )
require( "line" )
require( "master" )
require( "mixer" )
require( "tank" )

-- Основные объекты проекта (объекты, описанные в Eplan).
local prg =
    {
    control_modules =
        {
        ALMIX1V1 = V('ALMIX1V1'),
        ALMIX1V10 = V('ALMIX1V10'),
        ALMIX1V101 = V('ALMIX1V101'),
        ALMIX1V103 = V('ALMIX1V103'),
        ALMIX1V104 = V('ALMIX1V104'),
        ALMIX1V11 = V('ALMIX1V11'),
        ALMIX1V12 = V('ALMIX1V12'),
        ALMIX1V2 = V('ALMIX1V2'),
        ALMIX1V20 = V('ALMIX1V20'),
        ALMIX1V21 = V('ALMIX1V21'),
        ALMIX1V22 = V('ALMIX1V22'),
        ALMIX1V23 = V('ALMIX1V23'),
        ALMIX1V3 = V('ALMIX1V3'),
        ALMIX1V4 = V('ALMIX1V4'),
        ALMIX1V5 = V('ALMIX1V5'),
        ALMIX1V6 = V('ALMIX1V6'),
        ALMIX1V7 = V('ALMIX1V7'),
        ALMIX1V8 = V('ALMIX1V8'),
        ALMIX1V9 = V('ALMIX1V9'),
        ALMIX2V1 = V('ALMIX2V1'),
        ALMIX2V10 = V('ALMIX2V10'),
        ALMIX2V101 = V('ALMIX2V101'),
        ALMIX2V103 = V('ALMIX2V103'),
        ALMIX2V104 = V('ALMIX2V104'),
        ALMIX2V11 = V('ALMIX2V11'),
        ALMIX2V12 = V('ALMIX2V12'),
        ALMIX2V2 = V('ALMIX2V2'),
        ALMIX2V20 = V('ALMIX2V20'),
        ALMIX2V21 = V('ALMIX2V21'),
        ALMIX2V22 = V('ALMIX2V22'),
        ALMIX2V23 = V('ALMIX2V23'),
        ALMIX2V3 = V('ALMIX2V3'),
        ALMIX2V4 = V('ALMIX2V4'),
        ALMIX2V5 = V('ALMIX2V5'),
        ALMIX2V6 = V('ALMIX2V6'),
        ALMIX2V7 = V('ALMIX2V7'),
        ALMIX2V8 = V('ALMIX2V8'),
        ALMIX2V9 = V('ALMIX2V9'),
        CIP1V1 = V('CIP1V1'),
        CIP1V2 = V('CIP1V2'),
        HEAT_EXCR1V1 = V('HEAT_EXCR1V1'),
        HEAT_EXCR1V101 = V('HEAT_EXCR1V101'),
        HEAT_EXCR1V2 = V('HEAT_EXCR1V2'),
        HEAT_EXCR1V3 = V('HEAT_EXCR1V3'),
        HEAT_EXCR1V4 = V('HEAT_EXCR1V4'),
        HEAT_EXCR1V5 = V('HEAT_EXCR1V5'),
        HEAT_EXCR1V6 = V('HEAT_EXCR1V6'),
        HEAT_EXCR2V1 = V('HEAT_EXCR2V1'),
        HEAT_EXCR2V101 = V('HEAT_EXCR2V101'),
        HEAT_EXCR2V2 = V('HEAT_EXCR2V2'),
        HEAT_EXCR2V3 = V('HEAT_EXCR2V3'),
        HEAT_EXCR2V4 = V('HEAT_EXCR2V4'),
        HEAT_EXCR2V5 = V('HEAT_EXCR2V5'),
        HEAT_EXCR2V6 = V('HEAT_EXCR2V6'),
        M18V91 = V('M18V91'),
        M18V92 = V('M18V92'),
        MCA4V3001 = V('MCA4V3001'),
        MCA4V3002 = V('MCA4V3002'),
        MCA4V3102 = V('MCA4V3102'),
        MCA4V4001 = V('MCA4V4001'),
        MCA4V4002 = V('MCA4V4002'),
        MCA4V4102 = V('MCA4V4102'),
        MCA4V91 = V('MCA4V91'),
        MCA4V92 = V('MCA4V92'),
        PM2V91 = V('PM2V91'),
        PM2V92 = V('PM2V92'),
        R11V1 = V('R11V1'),
        R11V101 = V('R11V101'),
        R11V102 = V('R11V102'),
        R11V2 = V('R11V2'),
        R11V21 = V('R11V21'),
        R11V22 = V('R11V22'),
        R11V23 = V('R11V23'),
        R11V24 = V('R11V24'),
        R11V25 = V('R11V25'),
        R11V26 = V('R11V26'),
        R11V27 = V('R11V27'),
        R11V28 = V('R11V28'),
        R11V3 = V('R11V3'),
        R11V4 = V('R11V4'),
        R11V41 = V('R11V41'),
        R11V42 = V('R11V42'),
        R11V43 = V('R11V43'),
        R11V5 = V('R11V5'),
        R11V6 = V('R11V6'),
        R11V7 = V('R11V7'),
        R11V8 = V('R11V8'),
        R11V91 = V('R11V91'),
        R11V92 = V('R11V92'),
        R11V93 = V('R11V93'),
        R11V94 = V('R11V94'),
        R11V95 = V('R11V95'),
        R12V1 = V('R12V1'),
        R12V101 = V('R12V101'),
        R12V102 = V('R12V102'),
        R12V2 = V('R12V2'),
        R12V21 = V('R12V21'),
        R12V22 = V('R12V22'),
        R12V23 = V('R12V23'),
        R12V24 = V('R12V24'),
        R12V25 = V('R12V25'),
        R12V26 = V('R12V26'),
        R12V27 = V('R12V27'),
        R12V28 = V('R12V28'),
        R12V3 = V('R12V3'),
        R12V4 = V('R12V4'),
        R12V41 = V('R12V41'),
        R12V42 = V('R12V42'),
        R12V43 = V('R12V43'),
        R12V5 = V('R12V5'),
        R12V6 = V('R12V6'),
        R12V7 = V('R12V7'),
        R12V8 = V('R12V8'),
        R12V91 = V('R12V91'),
        R12V92 = V('R12V92'),
        R12V93 = V('R12V93'),
        R12V94 = V('R12V94'),
        R12V95 = V('R12V95'),
        R21V1 = V('R21V1'),
        R21V101 = V('R21V101'),
        R21V2 = V('R21V2'),
        R21V3 = V('R21V3'),
        R21V4 = V('R21V4'),
        R21V5 = V('R21V5'),
        R21V6 = V('R21V6'),
        R21V7 = V('R21V7'),
        R21V8 = V('R21V8'),
        R21V91 = V('R21V91'),
        R22V1 = V('R22V1'),
        R22V101 = V('R22V101'),
        R22V2 = V('R22V2'),
        R22V3 = V('R22V3'),
        R22V4 = V('R22V4'),
        R22V5 = V('R22V5'),
        R22V6 = V('R22V6'),
        R22V7 = V('R22V7'),
        R22V8 = V('R22V8'),
        R22V91 = V('R22V91'),
        R23V1 = V('R23V1'),
        R23V101 = V('R23V101'),
        R23V2 = V('R23V2'),
        R23V3 = V('R23V3'),
        R23V4 = V('R23V4'),
        R23V5 = V('R23V5'),
        R23V6 = V('R23V6'),
        R23V7 = V('R23V7'),
        R23V8 = V('R23V8'),
        R23V91 = V('R23V91'),
        R24V1 = V('R24V1'),
        R24V101 = V('R24V101'),
        R24V2 = V('R24V2'),
        R24V3 = V('R24V3'),
        R24V4 = V('R24V4'),
        R24V5 = V('R24V5'),
        R24V6 = V('R24V6'),
        R24V7 = V('R24V7'),
        R24V8 = V('R24V8'),
        R24V91 = V('R24V91'),
        RA1V1 = V('RA1V1'),
        RA1V101 = V('RA1V101'),
        RA1V2 = V('RA1V2'),
        RA1V21 = V('RA1V21'),
        RA1V22 = V('RA1V22'),
        RA1V23 = V('RA1V23'),
        RA1V24 = V('RA1V24'),
        RA1V25 = V('RA1V25'),
        RA1V26 = V('RA1V26'),
        RA1V27 = V('RA1V27'),
        RA1V28 = V('RA1V28'),
        RA1V3 = V('RA1V3'),
        RA1V4 = V('RA1V4'),
        RA1V5 = V('RA1V5'),
        RA1V6 = V('RA1V6'),
        RA1V7 = V('RA1V7'),
        RA1V8 = V('RA1V8'),
        RA1V91 = V('RA1V91'),
        RA1V92 = V('RA1V92'),
        RA1V93 = V('RA1V93'),
        RA2V1 = V('RA2V1'),
        RA2V101 = V('RA2V101'),
        RA2V2 = V('RA2V2'),
        RA2V21 = V('RA2V21'),
        RA2V22 = V('RA2V22'),
        RA2V23 = V('RA2V23'),
        RA2V24 = V('RA2V24'),
        RA2V25 = V('RA2V25'),
        RA2V26 = V('RA2V26'),
        RA2V27 = V('RA2V27'),
        RA2V28 = V('RA2V28'),
        RA2V3 = V('RA2V3'),
        RA2V4 = V('RA2V4'),
        RA2V5 = V('RA2V5'),
        RA2V6 = V('RA2V6'),
        RA2V7 = V('RA2V7'),
        RA2V8 = V('RA2V8'),
        RA2V91 = V('RA2V91'),
        RA2V92 = V('RA2V92'),
        RA2V93 = V('RA2V93'),
        RC3V91 = V('RC3V91'),
        RC3V92 = V('RC3V92'),
        TANK1V1 = V('TANK1V1'),
        TANK1V11 = V('TANK1V11'),
        TANK1V12 = V('TANK1V12'),
        TANK1V13 = V('TANK1V13'),
        TANK1V14 = V('TANK1V14'),
        TANK1V15 = V('TANK1V15'),
        TANK1V2 = V('TANK1V2'),
        TANK1V21 = V('TANK1V21'),
        TANK2V1 = V('TANK2V1'),
        TANK2V11 = V('TANK2V11'),
        TANK2V12 = V('TANK2V12'),
        TANK2V13 = V('TANK2V13'),
        TANK2V14 = V('TANK2V14'),
        TANK2V15 = V('TANK2V15'),
        TANK2V2 = V('TANK2V2'),
        TANK2V21 = V('TANK2V21'),
        TANK3V1 = V('TANK3V1'),
        TANK3V11 = V('TANK3V11'),
        TANK3V12 = V('TANK3V12'),
        TANK3V13 = V('TANK3V13'),
        TANK3V14 = V('TANK3V14'),
        TANK3V15 = V('TANK3V15'),
        TANK3V2 = V('TANK3V2'),
        TANK3V21 = V('TANK3V21'),
        TANK4V1 = V('TANK4V1'),
        TANK4V11 = V('TANK4V11'),
        TANK4V12 = V('TANK4V12'),
        TANK4V13 = V('TANK4V13'),
        TANK4V14 = V('TANK4V14'),
        TANK4V15 = V('TANK4V15'),
        TANK4V2 = V('TANK4V2'),
        TANK4V21 = V('TANK4V21'),
        TANK5V1 = V('TANK5V1'),
        TANK5V11 = V('TANK5V11'),
        TANK5V12 = V('TANK5V12'),
        TANK5V13 = V('TANK5V13'),
        TANK5V14 = V('TANK5V14'),
        TANK5V15 = V('TANK5V15'),
        TANK5V2 = V('TANK5V2'),
        TANK5V21 = V('TANK5V21'),
        TANK6V1 = V('TANK6V1'),
        TANK6V11 = V('TANK6V11'),
        TANK6V12 = V('TANK6V12'),
        TANK6V13 = V('TANK6V13'),
        TANK6V14 = V('TANK6V14'),
        TANK6V15 = V('TANK6V15'),
        TANK6V2 = V('TANK6V2'),
        TANK6V21 = V('TANK6V21'),
        TANK7V1 = V('TANK7V1'),
        TANK7V11 = V('TANK7V11'),
        TANK7V12 = V('TANK7V12'),
        TANK7V13 = V('TANK7V13'),
        TANK7V14 = V('TANK7V14'),
        TANK7V15 = V('TANK7V15'),
        TANK7V2 = V('TANK7V2'),
        TANK7V21 = V('TANK7V21'),
        TANK8V1 = V('TANK8V1'),
        TANK8V11 = V('TANK8V11'),
        TANK8V12 = V('TANK8V12'),
        TANK8V13 = V('TANK8V13'),
        TANK8V14 = V('TANK8V14'),
        TANK8V15 = V('TANK8V15'),
        TANK8V2 = V('TANK8V2'),
        TANK8V21 = V('TANK8V21'),
        V101 = V('V101'),
        V102 = V('V102'),
        V1V1 = V('V1V1'),
        V1V2 = V('V1V2'),
        V1V3 = V('V1V3'),
        V1V4 = V('V1V4'),
        V1V5 = V('V1V5'),
        V1V6 = V('V1V6'),
        V1V7 = V('V1V7'),
        V1V8 = V('V1V8'),
        V1V91 = V('V1V91'),
        V1V92 = V('V1V92'),
        V1V93 = V('V1V93'),
        V1V94 = V('V1V94'),
        V1V95 = V('V1V95'),
        V1V96 = V('V1V96'),
        ALMIX1VC1 = VC('ALMIX1VC1'),
        ALMIX2VC1 = VC('ALMIX2VC1'),
        HEAT_EXCR1VC1 = VC('HEAT_EXCR1VC1'),
        HEAT_EXCR1VC2 = VC('HEAT_EXCR1VC2'),
        HEAT_EXCR2VC1 = VC('HEAT_EXCR2VC1'),
        HEAT_EXCR2VC2 = VC('HEAT_EXCR2VC2'),
        ALMIX1M1 = M('ALMIX1M1'),
        ALMIX1M2 = M('ALMIX1M2'),
        ALMIX1M3 = M('ALMIX1M3'),
        ALMIX1M4 = M('ALMIX1M4'),
        ALMIX2M1 = M('ALMIX2M1'),
        ALMIX2M2 = M('ALMIX2M2'),
        ALMIX2M3 = M('ALMIX2M3'),
        ALMIX2M4 = M('ALMIX2M4'),
        CIP1M1 = M('CIP1M1'),
        CIP1M2 = M('CIP1M2'),
        CW_TANK1M1 = M('CW_TANK1M1'),
        HEAT_EXCR1M1 = M('HEAT_EXCR1M1'),
        HEAT_EXCR2M1 = M('HEAT_EXCR2M1'),
        R11M1 = M('R11M1'),
        R12M1 = M('R12M1'),
        R21M1 = M('R21M1'),
        R22M1 = M('R22M1'),
        R23M1 = M('R23M1'),
        R24M1 = M('R24M1'),
        RA1M1 = M('RA1M1'),
        RA2M1 = M('RA2M1'),
        TANK1M1 = M('TANK1M1'),
        TANK1M2 = M('TANK1M2'),
        TANK1M3 = M('TANK1M3'),
        TANK2M1 = M('TANK2M1'),
        TANK2M2 = M('TANK2M2'),
        TANK2M3 = M('TANK2M3'),
        TANK3M1 = M('TANK3M1'),
        TANK3M2 = M('TANK3M2'),
        TANK3M3 = M('TANK3M3'),
        TANK4M1 = M('TANK4M1'),
        TANK5M1 = M('TANK5M1'),
        TANK6M1 = M('TANK6M1'),
        TANK6M2 = M('TANK6M2'),
        TANK6M3 = M('TANK6M3'),
        TANK7M1 = M('TANK7M1'),
        TANK7M2 = M('TANK7M2'),
        TANK7M3 = M('TANK7M3'),
        TANK8M1 = M('TANK8M1'),
        TANK8M2 = M('TANK8M2'),
        TANK8M3 = M('TANK8M3'),
        ALMIX1LS1 = LS('ALMIX1LS1'),
        ALMIX1LS2 = LS('ALMIX1LS2'),
        ALMIX2LS1 = LS('ALMIX2LS1'),
        ALMIX2LS2 = LS('ALMIX2LS2'),
        CW_TANK1LS1 = LS('CW_TANK1LS1'),
        CW_TANK1LS2 = LS('CW_TANK1LS2'),
        TANK1LS1 = LS('TANK1LS1'),
        TANK1LS2 = LS('TANK1LS2'),
        TANK2LS1 = LS('TANK2LS1'),
        TANK2LS2 = LS('TANK2LS2'),
        TANK3LS1 = LS('TANK3LS1'),
        TANK3LS2 = LS('TANK3LS2'),
        TANK4LS1 = LS('TANK4LS1'),
        TANK4LS2 = LS('TANK4LS2'),
        TANK5LS1 = LS('TANK5LS1'),
        TANK5LS2 = LS('TANK5LS2'),
        TANK6LS1 = LS('TANK6LS1'),
        TANK6LS2 = LS('TANK6LS2'),
        TANK7LS1 = LS('TANK7LS1'),
        TANK7LS2 = LS('TANK7LS2'),
        TANK8LS1 = LS('TANK8LS1'),
        TANK8LS2 = LS('TANK8LS2'),
        ALMIX1TE1 = TE('ALMIX1TE1'),
        ALMIX2TE1 = TE('ALMIX2TE1'),
        HEAT_EXCR1TE1 = TE('HEAT_EXCR1TE1'),
        HEAT_EXCR1TE2 = TE('HEAT_EXCR1TE2'),
        HEAT_EXCR1TE3 = TE('HEAT_EXCR1TE3'),
        HEAT_EXCR1TE4 = TE('HEAT_EXCR1TE4'),
        HEAT_EXCR2TE1 = TE('HEAT_EXCR2TE1'),
        HEAT_EXCR2TE2 = TE('HEAT_EXCR2TE2'),
        HEAT_EXCR2TE3 = TE('HEAT_EXCR2TE3'),
        HEAT_EXCR2TE4 = TE('HEAT_EXCR2TE4'),
        M18TE3 = TE('M18TE3'),
        PM2TE3 = TE('PM2TE3'),
        RC3TE3 = TE('RC3TE3'),
        TANK1TE1 = TE('TANK1TE1'),
        TANK2TE1 = TE('TANK2TE1'),
        TANK3TE1 = TE('TANK3TE1'),
        TANK4TE1 = TE('TANK4TE1'),
        TANK5TE1 = TE('TANK5TE1'),
        TANK6TE1 = TE('TANK6TE1'),
        TANK7TE1 = TE('TANK7TE1'),
        TANK8TE1 = TE('TANK8TE1'),
        ALMIX1FS1 = FS('ALMIX1FS1'),
        ALMIX2FS1 = FS('ALMIX2FS1'),
        ALMIX1GS1 = GS('ALMIX1GS1'),
        ALMIX2GS1 = GS('ALMIX2GS1'),
        TANK1GS1 = GS('TANK1GS1'),
        TANK2GS1 = GS('TANK2GS1'),
        TANK3GS1 = GS('TANK3GS1'),
        TANK4GS1 = GS('TANK4GS1'),
        TANK5GS1 = GS('TANK5GS1'),
        TANK6GS1 = GS('TANK6GS1'),
        TANK7GS1 = GS('TANK7GS1'),
        TANK8GS1 = GS('TANK8GS1'),
        M18FQT1 = FQT('M18FQT1'),
        PM2FQT1 = FQT('PM2FQT1'),
        R11FQT1 = FQT('R11FQT1'),
        R12FQT1 = FQT('R12FQT1'),
        R21FQT1 = FQT('R21FQT1'),
        R22FQT1 = FQT('R22FQT1'),
        R23FQT1 = FQT('R23FQT1'),
        R24FQT1 = FQT('R24FQT1'),
        RA1FQT1 = FQT('RA1FQT1'),
        RA2FQT1 = FQT('RA2FQT1'),
        RC3FQT1 = FQT('RC3FQT1'),
        V1FQT1 = FQT('V1FQT1'),
        CW_TANK1LT1 = LT('CW_TANK1LT1'),
        TANK1LT1 = LT('TANK1LT1'),
        TANK2LT1 = LT('TANK2LT1'),
        TANK3LT1 = LT('TANK3LT1'),
        TANK4LT1 = LT('TANK4LT1'),
        TANK5LT1 = LT('TANK5LT1'),
        TANK6LT1 = LT('TANK6LT1'),
        TANK7LT1 = LT('TANK7LT1'),
        TANK8LT1 = LT('TANK8LT1'),
        M18QT1 = QT('M18QT1'),
        PM2QT1 = QT('PM2QT1'),
        R11QT1 = QT('R11QT1'),
        R12QT1 = QT('R12QT1'),
        RC3QT1 = QT('RC3QT1'),
        ALMIX1HL1 = HL('ALMIX1HL1'),
        ALMIX2HL1 = HL('ALMIX2HL1'),
        CAB1SB1 = SB('CAB1SB1'),
        CAB2SB1 = SB('CAB2SB1'),
        CAB3SB1 = SB('CAB3SB1'),
        CAB4SB1 = SB('CAB4SB1'),
        CAB5SB1 = SB('CAB5SB1'),
        CAB6SB1 = SB('CAB6SB1'),
        CAB7SB1 = SB('CAB7SB1'),
        CAB8SB1 = SB('CAB8SB1'),
        MCC1SB1 = SB('MCC1SB1'),
        ALMIX1DI1 = DI('ALMIX1DI1'),
        ALMIX1DI2 = DI('ALMIX1DI2'),
        ALMIX2DI1 = DI('ALMIX2DI1'),
        ALMIX2DI2 = DI('ALMIX2DI2'),
        BOTTLERY1DI1 = DI('BOTTLERY1DI1'),
        CAB1DI2 = DI('CAB1DI2'),
        CAB2DI2 = DI('CAB2DI2'),
        CAB3DI2 = DI('CAB3DI2'),
        CAB4DI2 = DI('CAB4DI2'),
        CAB5DI2 = DI('CAB5DI2'),
        CAB6DI2 = DI('CAB6DI2'),
        CAB7DI2 = DI('CAB7DI2'),
        CAB8DI2 = DI('CAB8DI2'),
        M18DI1 = DI('M18DI1'),
        M18DI12 = DI('M18DI12'),
        M18DI13 = DI('M18DI13'),
        M18DI2 = DI('M18DI2'),
        M18DI3 = DI('M18DI3'),
        M18DI4 = DI('M18DI4'),
        M18DI5 = DI('M18DI5'),
        MCA4DI1 = DI('MCA4DI1'),
        MCA4LINE3DI1 = DI('MCA4LINE3DI1'),
        MCA4LINE3DI11 = DI('MCA4LINE3DI11'),
        MCA4LINE3DI12 = DI('MCA4LINE3DI12'),
        MCA4LINE3DI13 = DI('MCA4LINE3DI13'),
        MCA4LINE3DI14 = DI('MCA4LINE3DI14'),
        MCA4LINE3DI15 = DI('MCA4LINE3DI15'),
        MCA4LINE3DI2 = DI('MCA4LINE3DI2'),
        MCA4LINE3DI21 = DI('MCA4LINE3DI21'),
        MCA4LINE3DI22 = DI('MCA4LINE3DI22'),
        MCA4LINE3DI23 = DI('MCA4LINE3DI23'),
        MCA4LINE3DI24 = DI('MCA4LINE3DI24'),
        MCA4LINE3DI3 = DI('MCA4LINE3DI3'),
        MCA4LINE3DI4 = DI('MCA4LINE3DI4'),
        MCA4LINE3DI5 = DI('MCA4LINE3DI5'),
        MCA4LINE3DI6 = DI('MCA4LINE3DI6'),
        MCA4LINE3DI7 = DI('MCA4LINE3DI7'),
        MCA4LINE3DI8 = DI('MCA4LINE3DI8'),
        MCA4LINE4DI1 = DI('MCA4LINE4DI1'),
        MCA4LINE4DI11 = DI('MCA4LINE4DI11'),
        MCA4LINE4DI12 = DI('MCA4LINE4DI12'),
        MCA4LINE4DI13 = DI('MCA4LINE4DI13'),
        MCA4LINE4DI14 = DI('MCA4LINE4DI14'),
        MCA4LINE4DI2 = DI('MCA4LINE4DI2'),
        MCA4LINE4DI21 = DI('MCA4LINE4DI21'),
        MCA4LINE4DI22 = DI('MCA4LINE4DI22'),
        MCA4LINE4DI23 = DI('MCA4LINE4DI23'),
        MCA4LINE4DI24 = DI('MCA4LINE4DI24'),
        MCA4LINE4DI3 = DI('MCA4LINE4DI3'),
        MCA4LINE4DI4 = DI('MCA4LINE4DI4'),
        MCA4LINE4DI5 = DI('MCA4LINE4DI5'),
        MCA4LINE4DI6 = DI('MCA4LINE4DI6'),
        MCA4LINE4DI7 = DI('MCA4LINE4DI7'),
        MCA4LINE4DI8 = DI('MCA4LINE4DI8'),
        MCC1DI2 = DI('MCC1DI2'),
        PM2DI1 = DI('PM2DI1'),
        PM2DI11 = DI('PM2DI11'),
        PM2DI12 = DI('PM2DI12'),
        PM2DI13 = DI('PM2DI13'),
        PM2DI2 = DI('PM2DI2'),
        PM2DI3 = DI('PM2DI3'),
        PM2DI4 = DI('PM2DI4'),
        PM2DI5 = DI('PM2DI5'),
        R21DI1 = DI('R21DI1'),
        R21DI11 = DI('R21DI11'),
        R21DI12 = DI('R21DI12'),
        R21DI13 = DI('R21DI13'),
        R21DI14 = DI('R21DI14'),
        R21DI2 = DI('R21DI2'),
        R22DI1 = DI('R22DI1'),
        R22DI11 = DI('R22DI11'),
        R22DI12 = DI('R22DI12'),
        R22DI13 = DI('R22DI13'),
        R22DI14 = DI('R22DI14'),
        R22DI2 = DI('R22DI2'),
        R23DI1 = DI('R23DI1'),
        R23DI11 = DI('R23DI11'),
        R23DI12 = DI('R23DI12'),
        R23DI13 = DI('R23DI13'),
        R23DI14 = DI('R23DI14'),
        R23DI2 = DI('R23DI2'),
        R24DI1 = DI('R24DI1'),
        R24DI11 = DI('R24DI11'),
        R24DI12 = DI('R24DI12'),
        R24DI13 = DI('R24DI13'),
        R24DI14 = DI('R24DI14'),
        R24DI2 = DI('R24DI2'),
        RC3DI1 = DI('RC3DI1'),
        RC3DI11 = DI('RC3DI11'),
        RC3DI12 = DI('RC3DI12'),
        RC3DI13 = DI('RC3DI13'),
        RC3DI2 = DI('RC3DI2'),
        RC3DI3 = DI('RC3DI3'),
        RC3DI4 = DI('RC3DI4'),
        RC3DI5 = DI('RC3DI5'),
        T_N1DI1 = DI('T_N1DI1'),
        T_PM1DI1 = DI('T_PM1DI1'),
        T_RC1DI1 = DI('T_RC1DI1'),
        WATER1DI1 = DI('WATER1DI1'),
        WATER1DI2 = DI('WATER1DI2'),
        WATER2DI1 = DI('WATER2DI1'),
        WATER2DI2 = DI('WATER2DI2'),
        BOTTLERY1DO1 = DO('BOTTLERY1DO1'),
        M18DO1 = DO('M18DO1'),
        M18DO11 = DO('M18DO11'),
        M18DO12 = DO('M18DO12'),
        M18DO2 = DO('M18DO2'),
        MCA4DO1 = DO('MCA4DO1'),
        MCA4LINE3DO1 = DO('MCA4LINE3DO1'),
        MCA4LINE3DO11 = DO('MCA4LINE3DO11'),
        MCA4LINE3DO12 = DO('MCA4LINE3DO12'),
        MCA4LINE3DO13 = DO('MCA4LINE3DO13'),
        MCA4LINE3DO14 = DO('MCA4LINE3DO14'),
        MCA4LINE3DO15 = DO('MCA4LINE3DO15'),
        MCA4LINE3DO2 = DO('MCA4LINE3DO2'),
        MCA4LINE3DO21 = DO('MCA4LINE3DO21'),
        MCA4LINE3DO22 = DO('MCA4LINE3DO22'),
        MCA4LINE3DO23 = DO('MCA4LINE3DO23'),
        MCA4LINE3DO24 = DO('MCA4LINE3DO24'),
        MCA4LINE3DO3 = DO('MCA4LINE3DO3'),
        MCA4LINE4DO1 = DO('MCA4LINE4DO1'),
        MCA4LINE4DO11 = DO('MCA4LINE4DO11'),
        MCA4LINE4DO12 = DO('MCA4LINE4DO12'),
        MCA4LINE4DO13 = DO('MCA4LINE4DO13'),
        MCA4LINE4DO14 = DO('MCA4LINE4DO14'),
        MCA4LINE4DO2 = DO('MCA4LINE4DO2'),
        MCA4LINE4DO21 = DO('MCA4LINE4DO21'),
        MCA4LINE4DO22 = DO('MCA4LINE4DO22'),
        MCA4LINE4DO23 = DO('MCA4LINE4DO23'),
        MCA4LINE4DO24 = DO('MCA4LINE4DO24'),
        MCA4LINE4DO3 = DO('MCA4LINE4DO3'),
        PM2DO1 = DO('PM2DO1'),
        PM2DO11 = DO('PM2DO11'),
        PM2DO12 = DO('PM2DO12'),
        PM2DO2 = DO('PM2DO2'),
        R21DO1 = DO('R21DO1'),
        R21DO11 = DO('R21DO11'),
        R21DO12 = DO('R21DO12'),
        R21DO13 = DO('R21DO13'),
        R21DO14 = DO('R21DO14'),
        R21DO15 = DO('R21DO15'),
        R21DO2 = DO('R21DO2'),
        R21DO3 = DO('R21DO3'),
        R22DO1 = DO('R22DO1'),
        R22DO11 = DO('R22DO11'),
        R22DO12 = DO('R22DO12'),
        R22DO13 = DO('R22DO13'),
        R22DO14 = DO('R22DO14'),
        R22DO15 = DO('R22DO15'),
        R22DO2 = DO('R22DO2'),
        R22DO3 = DO('R22DO3'),
        R23DO1 = DO('R23DO1'),
        R23DO11 = DO('R23DO11'),
        R23DO12 = DO('R23DO12'),
        R23DO13 = DO('R23DO13'),
        R23DO14 = DO('R23DO14'),
        R23DO15 = DO('R23DO15'),
        R23DO2 = DO('R23DO2'),
        R23DO3 = DO('R23DO3'),
        R24DO1 = DO('R24DO1'),
        R24DO11 = DO('R24DO11'),
        R24DO12 = DO('R24DO12'),
        R24DO13 = DO('R24DO13'),
        R24DO14 = DO('R24DO14'),
        R24DO15 = DO('R24DO15'),
        R24DO2 = DO('R24DO2'),
        R24DO3 = DO('R24DO3'),
        RC3DO1 = DO('RC3DO1'),
        RC3DO11 = DO('RC3DO11'),
        RC3DO12 = DO('RC3DO12'),
        RC3DO2 = DO('RC3DO2'),
        T_N1DO1 = DO('T_N1DO1'),
        T_PM1DO1 = DO('T_PM1DO1'),
        T_RC1DO1 = DO('T_RC1DO1'),
        ALMIX1AI1 = AI('ALMIX1AI1'),
        ALMIX2AI1 = AI('ALMIX2AI1'),
        R21AI11 = AI('R21AI11'),
        R21AI12 = AI('R21AI12'),
        R22AI11 = AI('R22AI11'),
        R22AI12 = AI('R22AI12'),
        R23AI11 = AI('R23AI11'),
        R23AI12 = AI('R23AI12'),
        R24AI11 = AI('R24AI11'),
        R24AI12 = AI('R24AI12'),
        MCA4LINE3AO1 = AO('MCA4LINE3AO1'),
        MCA4LINE4AO1 = AO('MCA4LINE4AO1'),
        ALMIX1WT1 = WT('ALMIX1WT1'),
        ALMIX2WT1 = WT('ALMIX2WT1'),
        ALMIX1PT1 = PT('ALMIX1PT1'),
        ALMIX1PT2 = PT('ALMIX1PT2'),
        ALMIX1PT3 = PT('ALMIX1PT3'),
        ALMIX1PT4 = PT('ALMIX1PT4'),
        ALMIX2PT1 = PT('ALMIX2PT1'),
        ALMIX2PT2 = PT('ALMIX2PT2'),
        ALMIX2PT3 = PT('ALMIX2PT3'),
        ALMIX2PT4 = PT('ALMIX2PT4'),
        HEAT_EXCR1PT1 = PT('HEAT_EXCR1PT1'),
        HEAT_EXCR2PT1 = PT('HEAT_EXCR2PT1'),
        ALMIX1FC1 = C('ALMIX1FC1'),
        ALMIX1PC1 = C('ALMIX1PC1'),
        ALMIX1WC1 = C('ALMIX1WC1'),
        ALMIX2FC1 = C('ALMIX2FC1'),
        ALMIX2PC1 = C('ALMIX2PC1'),
        ALMIX2WC1 = C('ALMIX2WC1'),
        CW_TANK1LC1 = C('CW_TANK1LC1'),
        HEAT_EXCR1TC1 = C('HEAT_EXCR1TC1'),
        HEAT_EXCR1TC2 = C('HEAT_EXCR1TC2'),
        HEAT_EXCR1TC3 = C('HEAT_EXCR1TC3'),
        HEAT_EXCR2TC1 = C('HEAT_EXCR2TC1'),
        HEAT_EXCR2TC2 = C('HEAT_EXCR2TC2'),
        HEAT_EXCR2TC3 = C('HEAT_EXCR2TC3'),
        R11FC1 = C('R11FC1'),
        R12FC1 = C('R12FC1'),
        R21FC1 = C('R21FC1'),
        R22FC1 = C('R22FC1'),
        R23FC1 = C('R23FC1'),
        R24FC1 = C('R24FC1'),
        RA1FC1 = C('RA1FC1'),
        RA2FC1 = C('RA2FC1'),
        CAB1HLA1 = HLA('CAB1HLA1'),
        CAB8HLA1 = HLA('CAB8HLA1'),
        MCC1HLA1 = HLA('MCC1HLA1'),
        CAB1G1 = G('CAB1G1'),
        CAB2G1 = G('CAB2G1'),
        CAB3G1 = G('CAB3G1'),
        CAB4G1 = G('CAB4G1'),
        CAB5G1 = G('CAB5G1'),
        CAB6G1 = G('CAB6G1'),
        CAB7G1 = G('CAB7G1'),
        CAB8G1 = G('CAB8G1'),
        MCC1G1 = G('MCC1G1'),
        BOTTLERY1WATCHDOG1 = WATCHDOG('BOTTLERY1WATCHDOG1'),
        MCA4WATCHDOG1 = WATCHDOG('MCA4WATCHDOG1'),
        T_N1WATCHDOG1 = WATCHDOG('T_N1WATCHDOG1'),
        T_PM1WATCHDOG1 = WATCHDOG('T_PM1WATCHDOG1'),
        T_RC1WATCHDOG1 = WATCHDOG('T_RC1WATCHDOG1'),
    },

    master1 = OBJECT1,

    tank1 = OBJECT2,
    tank2 = OBJECT3,
    tank3 = OBJECT4,
    tank4 = OBJECT5,
    tank5 = OBJECT6,
    tank6 = OBJECT7,
    tank7 = OBJECT8,
    tank8 = OBJECT9,

    user_object_user91 = OBJECT10,

    mix_node_tank1 = OBJECT11,
    mix_node_tank2 = OBJECT12,
    mix_node_tank3 = OBJECT13,
    mix_node_tank4 = OBJECT14,
    mix_node_tank5 = OBJECT15,
    mix_node_tank6 = OBJECT16,
    mix_node_tank7 = OBJECT17,
    mix_node_tank8 = OBJECT18,

    user_object_user92 = OBJECT19,

    cooler_node_tank1 = OBJECT20,
    cooler_node_tank2 = OBJECT21,
    cooler_node_tank3 = OBJECT22,
    cooler_node_tank4 = OBJECT23,
    cooler_node_tank5 = OBJECT24,
    cooler_node_tank6 = OBJECT25,
    cooler_node_tank7 = OBJECT26,
    cooler_node_tank8 = OBJECT27,

    user_object_user93 = OBJECT28,

    cw_tank1 = OBJECT29,

    line_in_m18 = OBJECT30,

    line_in_pm2 = OBJECT31,

    line_in_rc3 = OBJECT32,

    line_pumping_r11 = OBJECT33,
    line_pumping_r12 = OBJECT34,
    line_out_r21 = OBJECT35,
    line_out_r22 = OBJECT36,
    line_out_r23 = OBJECT37,
    line_out_r24 = OBJECT38,

    line_pumping_ra1 = OBJECT39,

    user_object_almix1 = OBJECT40,

    user_object_heat_excr1 = OBJECT41,
    user_object_heat_excr2 = OBJECT42,

    line_in_v1 = OBJECT43,

    line_pumping_ra2 = OBJECT44,

    user_object_almix2 = OBJECT45,
    }

prg.tank1.mix_node = prg.mix_node_tank1
prg.tank1.cooler_node = prg.cooler_node_tank1
prg.tank2.mix_node = prg.mix_node_tank2
prg.tank2.cooler_node = prg.cooler_node_tank2
prg.tank3.mix_node = prg.mix_node_tank3
prg.tank3.cooler_node = prg.cooler_node_tank3
prg.tank4.mix_node = prg.mix_node_tank4
prg.tank4.cooler_node = prg.cooler_node_tank4
prg.tank5.mix_node = prg.mix_node_tank5
prg.tank5.cooler_node = prg.cooler_node_tank5
prg.tank6.mix_node = prg.mix_node_tank6
prg.tank6.cooler_node = prg.cooler_node_tank6
prg.tank7.mix_node = prg.mix_node_tank7
prg.tank7.cooler_node = prg.cooler_node_tank7
prg.tank8.mix_node = prg.mix_node_tank8
prg.tank8.cooler_node = prg.cooler_node_tank8

prg.cooler_node_tank1.ice_water_pump_tank = prg.cw_tank1
prg.cooler_node_tank2.ice_water_pump_tank = prg.cw_tank1
prg.cooler_node_tank3.ice_water_pump_tank = prg.cw_tank1
prg.cooler_node_tank4.ice_water_pump_tank = prg.cw_tank1
prg.cooler_node_tank5.ice_water_pump_tank = prg.cw_tank1
prg.cooler_node_tank6.ice_water_pump_tank = prg.cw_tank1
prg.cooler_node_tank7.ice_water_pump_tank = prg.cw_tank1
prg.cooler_node_tank8.ice_water_pump_tank = prg.cw_tank1

prg.tank1.master = prg.master1
prg.tank1.reset_before_wash =
    {
    prg.tank1.PAR_FLOAT.V_ACCEPTING_CURRENT,
    prg.tank1.PAR_FLOAT.PRODUCT_TYPE,
    prg.tank1.PAR_FLOAT.V_ACCEPTING_SET
    }
prg.tank1.properties =
    {
    IGNORE_LS_DOWN = false,
    NO_CHECK_CURRENT_LEVEL = false,
    IGNORE_LEVELS_ERROR = false,
    }
prg.tank2.master = prg.master1
prg.tank2.reset_before_wash =
    {
    prg.tank2.PAR_FLOAT.V_ACCEPTING_CURRENT,
    prg.tank2.PAR_FLOAT.PRODUCT_TYPE,
    prg.tank2.PAR_FLOAT.V_ACCEPTING_SET
    }
prg.tank2.properties =
    {
    IGNORE_LS_DOWN = false,
    NO_CHECK_CURRENT_LEVEL = false,
    IGNORE_LEVELS_ERROR = false,
    }
prg.tank3.master = prg.master1
prg.tank3.reset_before_wash =
    {
    prg.tank3.PAR_FLOAT.V_ACCEPTING_CURRENT,
    prg.tank3.PAR_FLOAT.PRODUCT_TYPE,
    prg.tank3.PAR_FLOAT.V_ACCEPTING_SET
    }
prg.tank3.properties =
    {
    IGNORE_LS_DOWN = false,
    NO_CHECK_CURRENT_LEVEL = false,
    IGNORE_LEVELS_ERROR = false,
    }
prg.tank4.master = prg.master1
prg.tank4.reset_before_wash =
    {
    prg.tank4.PAR_FLOAT.V_ACCEPTING_CURRENT,
    prg.tank4.PAR_FLOAT.PRODUCT_TYPE,
    prg.tank4.PAR_FLOAT.V_ACCEPTING_SET
    }
prg.tank4.properties =
    {
    IGNORE_LS_DOWN = false,
    NO_CHECK_CURRENT_LEVEL = false,
    IGNORE_LEVELS_ERROR = false,
    }
prg.tank5.master = prg.master1
prg.tank5.reset_before_wash =
    {
    prg.tank5.PAR_FLOAT.V_ACCEPTING_CURRENT,
    prg.tank5.PAR_FLOAT.PRODUCT_TYPE,
    prg.tank5.PAR_FLOAT.V_ACCEPTING_SET
    }
prg.tank5.properties =
    {
    IGNORE_LS_DOWN = false,
    NO_CHECK_CURRENT_LEVEL = false,
    IGNORE_LEVELS_ERROR = false,
    }
prg.tank6.master = prg.master1
prg.tank6.reset_before_wash =
    {
    prg.tank6.PAR_FLOAT.V_ACCEPTING_CURRENT,
    prg.tank6.PAR_FLOAT.PRODUCT_TYPE,
    prg.tank6.PAR_FLOAT.V_ACCEPTING_SET
    }
prg.tank6.properties =
    {
    IGNORE_LS_DOWN = false,
    NO_CHECK_CURRENT_LEVEL = false,
    IGNORE_LEVELS_ERROR = false,
    }
prg.tank7.master = prg.master1
prg.tank7.reset_before_wash =
    {
    prg.tank7.PAR_FLOAT.V_ACCEPTING_CURRENT,
    prg.tank7.PAR_FLOAT.PRODUCT_TYPE,
    prg.tank7.PAR_FLOAT.V_ACCEPTING_SET
    }
prg.tank7.properties =
    {
    IGNORE_LS_DOWN = false,
    NO_CHECK_CURRENT_LEVEL = false,
    IGNORE_LEVELS_ERROR = false,
    }
prg.tank8.master = prg.master1
prg.tank8.reset_before_wash =
    {
    prg.tank8.PAR_FLOAT.V_ACCEPTING_CURRENT,
    prg.tank8.PAR_FLOAT.PRODUCT_TYPE,
    prg.tank8.PAR_FLOAT.V_ACCEPTING_SET
    }
prg.tank8.properties =
    {
    IGNORE_LS_DOWN = false,
    NO_CHECK_CURRENT_LEVEL = false,
    IGNORE_LEVELS_ERROR = false,
    }
prg.line_in_m18.tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_in_m18.reset_before_wash =
    {
    prg.line_in_m18.PAR_FLOAT.PROD_V,
    prg.line_in_m18.PAR_FLOAT.WATER_V,
    }
prg.line_in_pm2.tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_in_pm2.reset_before_wash =
    {
    prg.line_in_pm2.PAR_FLOAT.PROD_V,
    prg.line_in_pm2.PAR_FLOAT.WATER_V,
    }
prg.line_in_rc3.tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_in_rc3.reset_before_wash =
    {
    prg.line_in_rc3.PAR_FLOAT.PROD_V,
    prg.line_in_rc3.PAR_FLOAT.WATER_V,
    }
prg.line_pumping_r11.dst_tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_pumping_r11.src_tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_pumping_r11.reset_before_wash =
    {
    prg.line_pumping_r11.PAR_FLOAT.PROD_V,
    prg.line_pumping_r11.PAR_FLOAT.WATER_V,
    }
prg.line_pumping_r12.dst_tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_pumping_r12.src_tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_pumping_r12.reset_before_wash =
    {
    prg.line_pumping_r12.PAR_FLOAT.PROD_V,
    prg.line_pumping_r12.PAR_FLOAT.WATER_V,
    }
prg.line_out_r21.tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_out_r22.tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_out_r23.tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_out_r24.tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_pumping_ra1.dst_tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_pumping_ra1.src_tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_pumping_ra1.reset_before_wash =
    {
    prg.line_pumping_ra1.PAR_FLOAT.PROD_V,
    prg.line_pumping_ra1.PAR_FLOAT.WATER_V,
    }
prg.line_in_v1.tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_in_v1.reset_before_wash =
    {
    prg.line_in_v1.PAR_FLOAT.PROD_V,
    prg.line_in_v1.PAR_FLOAT.WATER_V,
    }
prg.line_pumping_ra2.dst_tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_pumping_ra2.src_tanks =
    {
    prg.tank1,
    prg.tank2,
    prg.tank3,
    prg.tank4,
    prg.tank5,
    prg.tank6,
    prg.tank7,
    prg.tank8,
    }
prg.line_pumping_ra2.reset_before_wash =
    {
    prg.line_pumping_ra2.PAR_FLOAT.PROD_V,
    prg.line_pumping_ra2.PAR_FLOAT.WATER_V,
    }

prg.tank1.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    STORING = 3,
    OUT = 4,
    WORK = 5,
    LEAVENING = 6,
    }
prg.tank2.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    STORING = 3,
    OUT = 4,
    WORK = 5,
    LEAVENING = 6,
    }
prg.tank3.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    STORING = 3,
    OUT = 4,
    WORK = 5,
    LEAVENING = 6,
    }
prg.tank4.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    STORING = 3,
    OUT = 4,
    WORK = 5,
    LEAVENING = 6,
    }
prg.tank5.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    STORING = 3,
    OUT = 4,
    WORK = 5,
    LEAVENING = 6,
    }
prg.tank6.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    STORING = 3,
    OUT = 4,
    WORK = 5,
    LEAVENING = 6,
    }
prg.tank7.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    STORING = 3,
    OUT = 4,
    WORK = 5,
    LEAVENING = 6,
    }
prg.tank8.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    STORING = 3,
    OUT = 4,
    WORK = 5,
    LEAVENING = 6,
    }
prg.mix_node_tank1.operations =         --Операции.
    {
    MIXING = 1,
    }
prg.mix_node_tank2.operations =         --Операции.
    {
    MIXING = 1,
    }
prg.mix_node_tank3.operations =         --Операции.
    {
    MIXING = 1,
    }
prg.mix_node_tank4.operations =         --Операции.
    {
    MIXING = 1,
    }
prg.mix_node_tank5.operations =         --Операции.
    {
    MIXING = 1,
    }
prg.mix_node_tank6.operations =         --Операции.
    {
    MIXING = 1,
    }
prg.mix_node_tank7.operations =         --Операции.
    {
    MIXING = 1,
    }
prg.mix_node_tank8.operations =         --Операции.
    {
    MIXING = 1,
    }
prg.cooler_node_tank1.operations =         --Операции.
    {
    COOLING = 1,
    }
prg.cooler_node_tank2.operations =         --Операции.
    {
    COOLING = 1,
    }
prg.cooler_node_tank3.operations =         --Операции.
    {
    COOLING = 1,
    }
prg.cooler_node_tank4.operations =         --Операции.
    {
    COOLING = 1,
    }
prg.cooler_node_tank5.operations =         --Операции.
    {
    COOLING = 1,
    }
prg.cooler_node_tank6.operations =         --Операции.
    {
    COOLING = 1,
    }
prg.cooler_node_tank7.operations =         --Операции.
    {
    COOLING = 1,
    }
prg.cooler_node_tank8.operations =         --Операции.
    {
    COOLING = 1,
    }
prg.cw_tank1.operations =         --Операции.
    {
    COOLING = 1,
    }
prg.line_in_m18.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    }
prg.line_in_pm2.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    }
prg.line_in_rc3.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    }
prg.line_pumping_r11.operations =         --Операции.
    {
    WASHING_CIP = 1,
    PUMPING = 2,
    }
prg.line_pumping_r12.operations =         --Операции.
    {
    WASHING_CIP = 1,
    PUMPING = 2,
    }
prg.line_out_r21.operations =         --Операции.
    {
    WASHING_CIP = 1,
    OUT = 2,
    }
prg.line_out_r22.operations =         --Операции.
    {
    WASHING_CIP = 1,
    OUT = 2,
    }
prg.line_out_r23.operations =         --Операции.
    {
    WASHING_CIP = 1,
    OUT = 2,
    }
prg.line_out_r24.operations =         --Операции.
    {
    WASHING_CIP = 1,
    OUT = 2,
    }
prg.line_pumping_ra1.operations =         --Операции.
    {
    WASHING_CIP = 1,
    PUMPING = 2,
    }
prg.line_in_v1.operations =         --Операции.
    {
    WASHING_CIP = 1,
    FILL = 2,
    }
prg.line_pumping_ra2.operations =         --Операции.
    {
    WASHING_CIP = 1,
    PUMPING = 2,
    }

prg.tank1.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            MEDIUM_CHANGE = 7,
            OBJECT_EMPTY = 8,
            DRAINAGE = 9,
            },
        },
    WORK =
        {
        RUN =
            {
            WAIT = 1,
            IN_TANK = 2,
            OUT_TANK = 3,
            },
        },
    }
prg.tank2.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            MEDIUM_CHANGE = 7,
            OBJECT_EMPTY = 8,
            DRAINAGE = 9,
            },
        },
    WORK =
        {
        RUN =
            {
            WAIT = 1,
            IN_TANK = 2,
            OUT_TANK = 3,
            },
        },
    }
prg.tank3.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            MEDIUM_CHANGE = 7,
            OBJECT_EMPTY = 8,
            DRAINAGE = 9,
            },
        },
    WORK =
        {
        RUN =
            {
            WAIT = 1,
            IN_TANK = 2,
            OUT_TANK = 3,
            },
        },
    }
prg.tank4.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            MEDIUM_CHANGE = 7,
            OBJECT_EMPTY = 8,
            DRAINAGE = 9,
            },
        },
    WORK =
        {
        RUN =
            {
            WAIT = 1,
            IN_TANK = 2,
            OUT_TANK = 3,
            },
        },
    }
prg.tank5.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            MEDIUM_CHANGE = 7,
            OBJECT_EMPTY = 8,
            DRAINAGE = 9,
            },
        },
    WORK =
        {
        RUN =
            {
            WAIT = 1,
            IN_TANK = 2,
            OUT_TANK = 3,
            },
        },
    }
prg.tank6.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            MEDIUM_CHANGE = 7,
            OBJECT_EMPTY = 8,
            DRAINAGE = 9,
            },
        },
    WORK =
        {
        RUN =
            {
            WAIT = 1,
            IN_TANK = 2,
            OUT_TANK = 3,
            },
        },
    }
prg.tank7.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            MEDIUM_CHANGE = 7,
            OBJECT_EMPTY = 8,
            DRAINAGE = 9,
            },
        },
    WORK =
        {
        RUN =
            {
            WAIT = 1,
            IN_TANK = 2,
            OUT_TANK = 3,
            },
        },
    }
prg.tank8.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            MEDIUM_CHANGE = 7,
            OBJECT_EMPTY = 8,
            DRAINAGE = 9,
            },
        },
    WORK =
        {
        RUN =
            {
            WAIT = 1,
            IN_TANK = 2,
            OUT_TANK = 3,
            },
        },
    }
prg.cooler_node_tank1.steps =         --Шаги операций.
    {
    COOLING =
        {
        RUN =
            {
            WORKING = 1,
            WAITING = 2,
            },
        },
    }
prg.cooler_node_tank2.steps =         --Шаги операций.
    {
    COOLING =
        {
        RUN =
            {
            WORKING = 1,
            WAITING = 2,
            },
        },
    }
prg.cooler_node_tank3.steps =         --Шаги операций.
    {
    COOLING =
        {
        RUN =
            {
            WORKING = 1,
            WAITING = 2,
            },
        },
    }
prg.cooler_node_tank4.steps =         --Шаги операций.
    {
    COOLING =
        {
        RUN =
            {
            WORKING = 1,
            WAITING = 2,
            },
        },
    }
prg.cooler_node_tank5.steps =         --Шаги операций.
    {
    COOLING =
        {
        RUN =
            {
            WORKING = 1,
            WAITING = 2,
            },
        },
    }
prg.cooler_node_tank6.steps =         --Шаги операций.
    {
    COOLING =
        {
        RUN =
            {
            WORKING = 1,
            WAITING = 2,
            },
        },
    }
prg.cooler_node_tank7.steps =         --Шаги операций.
    {
    COOLING =
        {
        RUN =
            {
            WORKING = 1,
            WAITING = 2,
            },
        },
    }
prg.cooler_node_tank8.steps =         --Шаги операций.
    {
    COOLING =
        {
        RUN =
            {
            WORKING = 1,
            WAITING = 2,
            },
        },
    }
prg.cw_tank1.steps =         --Шаги операций.
    {
    COOLING =
        {
        RUN =
            {
            WAITING_HI_LS = 1,
            WAITING_LOW_LS = 2,
            },
        },
    }
prg.line_in_m18.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 6,
            },
        },
    FILL =
        {
        RUN =
            {
            WAITING_KEY = 1,
            PRODUCT_PUSH = 2,
            IN_DRAINAGE = 3,
            IN_TANK = 4,
            },
        },
    }
prg.line_in_pm2.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 6,
            },
        },
    FILL =
        {
        RUN =
            {
            WAITING_KEY = 1,
            PRODUCT_PUSH = 2,
            IN_DRAINAGE = 3,
            IN_TANK = 4,
            },
        },
    }
prg.line_in_rc3.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 6,
            },
        },
    FILL =
        {
        RUN =
            {
            WAITING_KEY = 1,
            PRODUCT_PUSH = 2,
            IN_DRAINAGE = 3,
            IN_TANK = 4,
            },
        },
    }
prg.line_pumping_r11.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 7,
            },
        },
    PUMPING =
        {
        RUN =
            {
            WAITING = 1,
            IN_DRAINAGE = 2,
            OUT_WATER = 3,
            OUT_TANK = 4,
            IN_TANK = 16,
            },
        },
    }
prg.line_pumping_r12.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 7,
            },
        },
    PUMPING =
        {
        RUN =
            {
            WAITING = 1,
            IN_DRAINAGE = 2,
            OUT_WATER = 3,
            OUT_TANK = 4,
            IN_TANK = 16,
            },
        },
    }
prg.line_out_r21.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 4,
            },
        },
    OUT =
        {
        RUN =
            {
            WAITING_KEY = 1,
            IN_DRAINAGE = 2,
            IN_DESTINATION = 3,
            OUT_WATER = 4,
            OUT_TANK = 5,
            },
        },
    }
prg.line_out_r22.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 4,
            },
        },
    OUT =
        {
        RUN =
            {
            WAITING_KEY = 1,
            IN_DRAINAGE = 2,
            IN_DESTINATION = 3,
            OUT_WATER = 4,
            OUT_TANK = 5,
            },
        },
    }
prg.line_out_r23.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 4,
            },
        },
    OUT =
        {
        RUN =
            {
            WAITING_KEY = 1,
            IN_DRAINAGE = 2,
            IN_DESTINATION = 3,
            OUT_WATER = 4,
            OUT_TANK = 5,
            },
        },
    }
prg.line_out_r24.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 4,
            },
        },
    OUT =
        {
        RUN =
            {
            WAITING_KEY = 1,
            IN_DRAINAGE = 2,
            IN_DESTINATION = 3,
            OUT_WATER = 4,
            OUT_TANK = 5,
            },
        },
    }
prg.line_pumping_ra1.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 2,
            },
        },
    PUMPING =
        {
        RUN =
            {
            WAITING = 1,
            IN_DRAINAGE = 2,
            OUT_WATER = 3,
            OUT_TANK = 4,
            IN_TANK = 16,
            },
        },
    }
prg.line_in_v1.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 6,
            },
        },
    FILL =
        {
        RUN =
            {
            PRODUCT_PUSH = 2,
            IN_DRAINAGE = 3,
            IN_TANK = 4,
            },
        },
    }
prg.line_pumping_ra2.steps =         --Шаги операций.
    {
    WASHING_CIP =
        {
        RUN =
            {
            DRAINAGE = 2,
            },
        },
    PUMPING =
        {
        RUN =
            {
            WAITING = 1,
            IN_DRAINAGE = 2,
            OUT_WATER = 3,
            OUT_TANK = 4,
            IN_TANK = 16,
            },
        },
    }

prg.tank1.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE4DI8,
    FLIP_ENABLE = prg.control_modules.MCA4LINE4DI5,
    DI_CIP_FREE = prg.control_modules.MCA4LINE4DI1,
    MEDIUM_CHANGE_REQUEST = prg.control_modules.MCA4LINE4DI4,
    CIP_WASH_END = prg.control_modules.MCA4LINE4DI3,
    DES_SIGNAL = prg.control_modules.MCA4LINE4DI7,
    FLIP_END = prg.control_modules.MCA4LINE4DO3,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank1.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank1.PAR_FLOAT.WASHING_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank1.PAR_FLOAT.WASHING_MIX_WAIT_TIME,
    NEED_COOLING = false,
    }
prg.tank1.FILL =
    {
    OPERATION_AFTER_FILL = prg.tank1.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank1.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank1.PAR_FLOAT.FILL_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank1.PAR_FLOAT.FILL_MIX_WAIT_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank1.PAR_FLOAT.COOL_TEMP_FILL,
    COOLING_TEMPERATURE_DELTA = prg.tank1.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank1.STORING =
    {
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank1.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank1.PAR_FLOAT.STORE_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank1.PAR_FLOAT.STORE_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank1.PAR_FLOAT.COOL_TEMP_STORING1,
    COOLING_TEMPERATURE_DELTA = prg.tank1.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank1.OUT =
    {
    NEED_STORING_AFTER = true,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank1.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank1.PAR_FLOAT.OUT_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank1.PAR_FLOAT.OUT_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank1.PAR_FLOAT.COOL_TEMP_OUT,
    COOLING_TEMPERATURE_DELTA = prg.tank1.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank1.WORK =
    {
    OPERATION_AFTER = prg.tank1.operations.STORING,
    WORK_FILL_AND_OUT = false,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank1.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank1.PAR_FLOAT.WORK_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank1.PAR_FLOAT.WORK_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank1.PAR_FLOAT.COOL_TEMP_WORK,
    COOLING_TEMPERATURE_DELTA = prg.tank1.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank1.LEAVENING =
    {
    LEAVENING_TIME = prg.tank1.PAR_FLOAT.TIME_EXCERPT,
    OPERATION_AFTER = prg.tank1.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank1.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank1.PAR_FLOAT.EXCERPT_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank1.PAR_FLOAT.EXCERPT_MIX_OFF_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank1.PAR_FLOAT.COOL_TEMP_EXCERPT,
    COOLING_TEMPERATURE_DELTA = prg.tank1.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank2.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE4DI8,
    FLIP_ENABLE = prg.control_modules.MCA4LINE4DI5,
    DI_CIP_FREE = prg.control_modules.MCA4LINE4DI1,
    MEDIUM_CHANGE_REQUEST = prg.control_modules.MCA4LINE4DI4,
    CIP_WASH_END = prg.control_modules.MCA4LINE4DI3,
    DES_SIGNAL = prg.control_modules.MCA4LINE4DI7,
    FLIP_END = prg.control_modules.MCA4LINE4DO3,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank2.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank2.PAR_FLOAT.WASHING_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank2.PAR_FLOAT.WASHING_MIX_WAIT_TIME,
    NEED_COOLING = false,
    }
prg.tank2.FILL =
    {
    OPERATION_AFTER_FILL = prg.tank2.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank2.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank2.PAR_FLOAT.FILL_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank2.PAR_FLOAT.FILL_MIX_WAIT_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank2.PAR_FLOAT.COOL_TEMP_FILL,
    COOLING_TEMPERATURE_DELTA = prg.tank2.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank2.STORING =
    {
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank2.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank2.PAR_FLOAT.STORE_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank2.PAR_FLOAT.STORE_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank2.PAR_FLOAT.COOL_TEMP_STORING1,
    COOLING_TEMPERATURE_DELTA = prg.tank2.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank2.OUT =
    {
    NEED_STORING_AFTER = true,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank2.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank2.PAR_FLOAT.OUT_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank2.PAR_FLOAT.OUT_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank2.PAR_FLOAT.COOL_TEMP_OUT,
    COOLING_TEMPERATURE_DELTA = prg.tank2.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank2.WORK =
    {
    OPERATION_AFTER = prg.tank2.operations.STORING,
    WORK_FILL_AND_OUT = false,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank2.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank2.PAR_FLOAT.WORK_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank2.PAR_FLOAT.WORK_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank2.PAR_FLOAT.COOL_TEMP_WORK,
    COOLING_TEMPERATURE_DELTA = prg.tank2.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank2.LEAVENING =
    {
    LEAVENING_TIME = prg.tank2.PAR_FLOAT.TIME_EXCERPT,
    OPERATION_AFTER = prg.tank2.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank2.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank2.PAR_FLOAT.EXCERPT_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank2.PAR_FLOAT.EXCERPT_MIX_OFF_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank2.PAR_FLOAT.COOL_TEMP_EXCERPT,
    COOLING_TEMPERATURE_DELTA = prg.tank2.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank3.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE4DI8,
    FLIP_ENABLE = prg.control_modules.MCA4LINE4DI5,
    DI_CIP_FREE = prg.control_modules.MCA4LINE4DI1,
    MEDIUM_CHANGE_REQUEST = prg.control_modules.MCA4LINE4DI4,
    CIP_WASH_END = prg.control_modules.MCA4LINE4DI3,
    DES_SIGNAL = prg.control_modules.MCA4LINE4DI7,
    FLIP_END = prg.control_modules.MCA4LINE4DO3,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank3.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank3.PAR_FLOAT.WASHING_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank3.PAR_FLOAT.WASHING_MIX_WAIT_TIME,
    NEED_COOLING = false,
    }
prg.tank3.FILL =
    {
    OPERATION_AFTER_FILL = prg.tank3.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank3.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank3.PAR_FLOAT.FILL_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank3.PAR_FLOAT.FILL_MIX_WAIT_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank3.PAR_FLOAT.COOL_TEMP_FILL,
    COOLING_TEMPERATURE_DELTA = prg.tank3.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank3.STORING =
    {
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank3.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank3.PAR_FLOAT.STORE_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank3.PAR_FLOAT.STORE_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank3.PAR_FLOAT.COOL_TEMP_STORING1,
    COOLING_TEMPERATURE_DELTA = prg.tank3.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank3.OUT =
    {
    NEED_STORING_AFTER = true,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank3.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank3.PAR_FLOAT.OUT_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank3.PAR_FLOAT.OUT_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank3.PAR_FLOAT.COOL_TEMP_OUT,
    COOLING_TEMPERATURE_DELTA = prg.tank3.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank3.WORK =
    {
    OPERATION_AFTER = prg.tank3.operations.STORING,
    WORK_FILL_AND_OUT = false,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank3.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank3.PAR_FLOAT.WORK_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank3.PAR_FLOAT.WORK_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank3.PAR_FLOAT.COOL_TEMP_WORK,
    COOLING_TEMPERATURE_DELTA = prg.tank3.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank3.LEAVENING =
    {
    LEAVENING_TIME = prg.tank3.PAR_FLOAT.TIME_EXCERPT,
    OPERATION_AFTER = prg.tank3.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank3.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank3.PAR_FLOAT.EXCERPT_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank3.PAR_FLOAT.EXCERPT_MIX_OFF_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank3.PAR_FLOAT.COOL_TEMP_EXCERPT,
    COOLING_TEMPERATURE_DELTA = prg.tank3.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank4.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE4DI8,
    FLIP_ENABLE = prg.control_modules.MCA4LINE4DI5,
    DI_CIP_FREE = prg.control_modules.MCA4LINE4DI1,
    MEDIUM_CHANGE_REQUEST = prg.control_modules.MCA4LINE4DI4,
    CIP_WASH_END = prg.control_modules.MCA4LINE4DI3,
    DES_SIGNAL = prg.control_modules.MCA4LINE4DI7,
    FLIP_END = prg.control_modules.MCA4LINE4DO3,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank4.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank4.PAR_FLOAT.WASHING_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank4.PAR_FLOAT.WASHING_MIX_WAIT_TIME,
    NEED_COOLING = false,
    }
prg.tank4.FILL =
    {
    OPERATION_AFTER_FILL = prg.tank4.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank4.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank4.PAR_FLOAT.FILL_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank4.PAR_FLOAT.FILL_MIX_WAIT_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank4.PAR_FLOAT.COOL_TEMP_FILL,
    COOLING_TEMPERATURE_DELTA = prg.tank4.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank4.STORING =
    {
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank4.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank4.PAR_FLOAT.STORE_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank4.PAR_FLOAT.STORE_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank4.PAR_FLOAT.COOL_TEMP_STORING1,
    COOLING_TEMPERATURE_DELTA = prg.tank4.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank4.OUT =
    {
    NEED_STORING_AFTER = true,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank4.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank4.PAR_FLOAT.OUT_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank4.PAR_FLOAT.OUT_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank4.PAR_FLOAT.COOL_TEMP_OUT,
    COOLING_TEMPERATURE_DELTA = prg.tank4.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank4.WORK =
    {
    OPERATION_AFTER = prg.tank4.operations.STORING,
    WORK_FILL_AND_OUT = false,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank4.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank4.PAR_FLOAT.WORK_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank4.PAR_FLOAT.WORK_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank4.PAR_FLOAT.COOL_TEMP_WORK,
    COOLING_TEMPERATURE_DELTA = prg.tank4.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank4.LEAVENING =
    {
    LEAVENING_TIME = prg.tank4.PAR_FLOAT.TIME_EXCERPT,
    OPERATION_AFTER = prg.tank4.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank4.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank4.PAR_FLOAT.EXCERPT_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank4.PAR_FLOAT.EXCERPT_MIX_OFF_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank4.PAR_FLOAT.COOL_TEMP_EXCERPT,
    COOLING_TEMPERATURE_DELTA = prg.tank4.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank5.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE3DI8,
    FLIP_ENABLE = prg.control_modules.MCA4LINE3DI5,
    DI_CIP_FREE = prg.control_modules.MCA4LINE3DI1,
    MEDIUM_CHANGE_REQUEST = prg.control_modules.MCA4LINE3DI4,
    CIP_WASH_END = prg.control_modules.MCA4LINE3DI3,
    DES_SIGNAL = prg.control_modules.MCA4LINE3DI7,
    FLIP_END = prg.control_modules.MCA4LINE3DO3,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank5.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank5.PAR_FLOAT.WASHING_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank5.PAR_FLOAT.WASHING_MIX_WAIT_TIME,
    NEED_COOLING = false,
    }
prg.tank5.FILL =
    {
    OPERATION_AFTER_FILL = prg.tank5.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank5.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank5.PAR_FLOAT.FILL_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank5.PAR_FLOAT.FILL_MIX_WAIT_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank5.PAR_FLOAT.COOL_TEMP_FILL,
    COOLING_TEMPERATURE_DELTA = prg.tank5.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank5.STORING =
    {
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank5.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank5.PAR_FLOAT.STORE_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank5.PAR_FLOAT.STORE_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank5.PAR_FLOAT.COOL_TEMP_STORING1,
    COOLING_TEMPERATURE_DELTA = prg.tank5.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank5.OUT =
    {
    NEED_STORING_AFTER = true,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank5.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank5.PAR_FLOAT.OUT_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank5.PAR_FLOAT.OUT_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank5.PAR_FLOAT.COOL_TEMP_OUT,
    COOLING_TEMPERATURE_DELTA = prg.tank5.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank5.WORK =
    {
    OPERATION_AFTER = prg.tank5.operations.STORING,
    WORK_FILL_AND_OUT = false,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank5.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank5.PAR_FLOAT.WORK_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank5.PAR_FLOAT.WORK_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank5.PAR_FLOAT.COOL_TEMP_WORK,
    COOLING_TEMPERATURE_DELTA = prg.tank5.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank5.LEAVENING =
    {
    LEAVENING_TIME = prg.tank5.PAR_FLOAT.TIME_EXCERPT,
    OPERATION_AFTER = prg.tank5.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank5.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank5.PAR_FLOAT.EXCERPT_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank5.PAR_FLOAT.EXCERPT_MIX_OFF_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank5.PAR_FLOAT.COOL_TEMP_EXCERPT,
    COOLING_TEMPERATURE_DELTA = prg.tank5.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank6.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE3DI8,
    FLIP_ENABLE = prg.control_modules.MCA4LINE3DI5,
    DI_CIP_FREE = prg.control_modules.MCA4LINE3DI1,
    MEDIUM_CHANGE_REQUEST = prg.control_modules.MCA4LINE3DI4,
    CIP_WASH_END = prg.control_modules.MCA4LINE3DI3,
    DES_SIGNAL = prg.control_modules.MCA4LINE3DI7,
    FLIP_END = prg.control_modules.MCA4LINE3DO3,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank6.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank6.PAR_FLOAT.WASHING_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank6.PAR_FLOAT.WASHING_MIX_WAIT_TIME,
    NEED_COOLING = false,
    }
prg.tank6.FILL =
    {
    OPERATION_AFTER_FILL = prg.tank6.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank6.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank6.PAR_FLOAT.FILL_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank6.PAR_FLOAT.FILL_MIX_WAIT_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank6.PAR_FLOAT.COOL_TEMP_FILL,
    COOLING_TEMPERATURE_DELTA = prg.tank6.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank6.STORING =
    {
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank6.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank6.PAR_FLOAT.STORE_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank6.PAR_FLOAT.STORE_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank6.PAR_FLOAT.COOL_TEMP_STORING1,
    COOLING_TEMPERATURE_DELTA = prg.tank6.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank6.OUT =
    {
    NEED_STORING_AFTER = true,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank6.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank6.PAR_FLOAT.OUT_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank6.PAR_FLOAT.OUT_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank6.PAR_FLOAT.COOL_TEMP_OUT,
    COOLING_TEMPERATURE_DELTA = prg.tank6.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank6.WORK =
    {
    OPERATION_AFTER = prg.tank6.operations.STORING,
    WORK_FILL_AND_OUT = false,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank6.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank6.PAR_FLOAT.WORK_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank6.PAR_FLOAT.WORK_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank6.PAR_FLOAT.COOL_TEMP_WORK,
    COOLING_TEMPERATURE_DELTA = prg.tank6.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank6.LEAVENING =
    {
    LEAVENING_TIME = prg.tank6.PAR_FLOAT.TIME_EXCERPT,
    OPERATION_AFTER = prg.tank6.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank6.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank6.PAR_FLOAT.EXCERPT_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank6.PAR_FLOAT.EXCERPT_MIX_OFF_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank6.PAR_FLOAT.COOL_TEMP_EXCERPT,
    COOLING_TEMPERATURE_DELTA = prg.tank6.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank7.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE3DI8,
    FLIP_ENABLE = prg.control_modules.MCA4LINE3DI5,
    DI_CIP_FREE = prg.control_modules.MCA4LINE3DI1,
    MEDIUM_CHANGE_REQUEST = prg.control_modules.MCA4LINE3DI4,
    CIP_WASH_END = prg.control_modules.MCA4LINE3DI3,
    DES_SIGNAL = prg.control_modules.MCA4LINE3DI7,
    FLIP_END = prg.control_modules.MCA4LINE3DO3,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank7.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank7.PAR_FLOAT.WASHING_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank7.PAR_FLOAT.WASHING_MIX_WAIT_TIME,
    NEED_COOLING = false,
    }
prg.tank7.FILL =
    {
    OPERATION_AFTER_FILL = prg.tank7.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank7.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank7.PAR_FLOAT.FILL_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank7.PAR_FLOAT.FILL_MIX_WAIT_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank7.PAR_FLOAT.COOL_TEMP_FILL,
    COOLING_TEMPERATURE_DELTA = prg.tank7.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank7.STORING =
    {
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank7.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank7.PAR_FLOAT.STORE_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank7.PAR_FLOAT.STORE_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank7.PAR_FLOAT.COOL_TEMP_STORING1,
    COOLING_TEMPERATURE_DELTA = prg.tank7.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank7.OUT =
    {
    NEED_STORING_AFTER = true,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank7.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank7.PAR_FLOAT.OUT_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank7.PAR_FLOAT.OUT_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank7.PAR_FLOAT.COOL_TEMP_OUT,
    COOLING_TEMPERATURE_DELTA = prg.tank7.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank7.WORK =
    {
    OPERATION_AFTER = prg.tank7.operations.STORING,
    WORK_FILL_AND_OUT = false,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank7.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank7.PAR_FLOAT.WORK_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank7.PAR_FLOAT.WORK_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank7.PAR_FLOAT.COOL_TEMP_WORK,
    COOLING_TEMPERATURE_DELTA = prg.tank7.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank7.LEAVENING =
    {
    LEAVENING_TIME = prg.tank7.PAR_FLOAT.TIME_EXCERPT,
    OPERATION_AFTER = prg.tank7.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank7.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank7.PAR_FLOAT.EXCERPT_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank7.PAR_FLOAT.EXCERPT_MIX_OFF_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank7.PAR_FLOAT.COOL_TEMP_EXCERPT,
    COOLING_TEMPERATURE_DELTA = prg.tank7.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank8.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE3DI8,
    FLIP_ENABLE = prg.control_modules.MCA4LINE3DI5,
    DI_CIP_FREE = prg.control_modules.MCA4LINE3DI1,
    MEDIUM_CHANGE_REQUEST = prg.control_modules.MCA4LINE3DI4,
    CIP_WASH_END = prg.control_modules.MCA4LINE3DI3,
    DES_SIGNAL = prg.control_modules.MCA4LINE3DI7,
    FLIP_END = prg.control_modules.MCA4LINE3DO3,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank8.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank8.PAR_FLOAT.WASHING_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank8.PAR_FLOAT.WASHING_MIX_WAIT_TIME,
    NEED_COOLING = false,
    }
prg.tank8.FILL =
    {
    OPERATION_AFTER_FILL = prg.tank8.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank8.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank8.PAR_FLOAT.FILL_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank8.PAR_FLOAT.FILL_MIX_WAIT_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank8.PAR_FLOAT.COOL_TEMP_FILL,
    COOLING_TEMPERATURE_DELTA = prg.tank8.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank8.STORING =
    {
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank8.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank8.PAR_FLOAT.STORE_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank8.PAR_FLOAT.STORE_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank8.PAR_FLOAT.COOL_TEMP_STORING1,
    COOLING_TEMPERATURE_DELTA = prg.tank8.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.tank8.OUT =
    {
    NEED_STORING_AFTER = true,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank8.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank8.PAR_FLOAT.OUT_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank8.PAR_FLOAT.OUT_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank8.PAR_FLOAT.COOL_TEMP_OUT,
    COOLING_TEMPERATURE_DELTA = prg.tank8.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank8.WORK =
    {
    OPERATION_AFTER = prg.tank8.operations.STORING,
    WORK_FILL_AND_OUT = false,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank8.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank8.PAR_FLOAT.WORK_MIX_ON_PHASE1_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank8.PAR_FLOAT.WORK_MIX_WAIT_PHASE1_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank8.PAR_FLOAT.COOL_TEMP_WORK,
    COOLING_TEMPERATURE_DELTA = prg.tank8.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = false,
    }
prg.tank8.LEAVENING =
    {
    LEAVENING_TIME = prg.tank8.PAR_FLOAT.TIME_EXCERPT,
    OPERATION_AFTER = prg.tank8.operations.STORING,
    NEED_MIXING = true,
    MIX_NODE_MIX_OPERATION = prg.mix_node_tank8.operations.MIXING,
    MIX_NODE_MIX_ON_TIME = prg.tank8.PAR_FLOAT.EXCERPT_MIX_ON_TIME,
    MIX_NODE_MIX_OFF_TIME = prg.tank8.PAR_FLOAT.EXCERPT_MIX_OFF_TIME,
    NEED_COOLING = true,
    COOLING_TEMPERATURE = prg.tank8.PAR_FLOAT.COOL_TEMP_EXCERPT,
    COOLING_TEMPERATURE_DELTA = prg.tank8.PAR_FLOAT.COOL_DELTA_TEMP,
    NEED_PAUSE_COOLING = true,
    }
prg.mix_node_tank1.MIXING =
    {
    WORK_WITH_SECTIONS = false,
    }
prg.mix_node_tank2.MIXING =
    {
    WORK_WITH_SECTIONS = false,
    }
prg.mix_node_tank3.MIXING =
    {
    WORK_WITH_SECTIONS = false,
    }
prg.mix_node_tank4.MIXING =
    {
    WORK_WITH_SECTIONS = false,
    }
prg.mix_node_tank5.MIXING =
    {
    WORK_WITH_SECTIONS = false,
    }
prg.mix_node_tank6.MIXING =
    {
    WORK_WITH_SECTIONS = false,
    }
prg.mix_node_tank7.MIXING =
    {
    WORK_WITH_SECTIONS = false,
    }
prg.mix_node_tank8.MIXING =
    {
    WORK_WITH_SECTIONS = false,
    }
prg.cooler_node_tank1.COOLING =
    {
    COOL_TEMPERATURE = prg.cooler_node_tank1.PAR_FLOAT.COOL_TEMPERATURE,
    COOL_DELTA_TEMPERATURE = prg.cooler_node_tank1.PAR_FLOAT.TE_COOL_DELTA,
    NEED_ICE_WATER_PUMP_TANK = true,
    NEED_PAUSE_ICE_WATER_PUMP_TANK = true,
    }
prg.cooler_node_tank2.COOLING =
    {
    COOL_TEMPERATURE = prg.cooler_node_tank2.PAR_FLOAT.COOL_TEMPERATURE,
    COOL_DELTA_TEMPERATURE = prg.cooler_node_tank2.PAR_FLOAT.TE_COOL_DELTA,
    NEED_ICE_WATER_PUMP_TANK = true,
    NEED_PAUSE_ICE_WATER_PUMP_TANK = true,
    }
prg.cooler_node_tank3.COOLING =
    {
    COOL_TEMPERATURE = prg.cooler_node_tank3.PAR_FLOAT.COOL_TEMPERATURE,
    COOL_DELTA_TEMPERATURE = prg.cooler_node_tank3.PAR_FLOAT.TE_COOL_DELTA,
    NEED_ICE_WATER_PUMP_TANK = true,
    NEED_PAUSE_ICE_WATER_PUMP_TANK = true,
    }
prg.cooler_node_tank4.COOLING =
    {
    COOL_TEMPERATURE = prg.cooler_node_tank4.PAR_FLOAT.COOL_TEMPERATURE,
    COOL_DELTA_TEMPERATURE = prg.cooler_node_tank4.PAR_FLOAT.TE_COOL_DELTA,
    NEED_ICE_WATER_PUMP_TANK = true,
    NEED_PAUSE_ICE_WATER_PUMP_TANK = true,
    }
prg.cooler_node_tank5.COOLING =
    {
    COOL_TEMPERATURE = prg.cooler_node_tank5.PAR_FLOAT.COOL_TEMPERATURE,
    COOL_DELTA_TEMPERATURE = prg.cooler_node_tank5.PAR_FLOAT.TE_COOL_DELTA,
    NEED_ICE_WATER_PUMP_TANK = true,
    NEED_PAUSE_ICE_WATER_PUMP_TANK = true,
    }
prg.cooler_node_tank6.COOLING =
    {
    COOL_TEMPERATURE = prg.cooler_node_tank6.PAR_FLOAT.COOL_TEMPERATURE,
    COOL_DELTA_TEMPERATURE = prg.cooler_node_tank6.PAR_FLOAT.TE_COOL_DELTA,
    NEED_ICE_WATER_PUMP_TANK = true,
    NEED_PAUSE_ICE_WATER_PUMP_TANK = true,
    }
prg.cooler_node_tank7.COOLING =
    {
    COOL_TEMPERATURE = prg.cooler_node_tank7.PAR_FLOAT.COOL_TEMPERATURE,
    COOL_DELTA_TEMPERATURE = prg.cooler_node_tank7.PAR_FLOAT.TE_COOL_DELTA,
    NEED_ICE_WATER_PUMP_TANK = true,
    NEED_PAUSE_ICE_WATER_PUMP_TANK = true,
    }
prg.cooler_node_tank8.COOLING =
    {
    COOL_TEMPERATURE = prg.cooler_node_tank8.PAR_FLOAT.COOL_TEMPERATURE,
    COOL_DELTA_TEMPERATURE = prg.cooler_node_tank8.PAR_FLOAT.TE_COOL_DELTA,
    NEED_ICE_WATER_PUMP_TANK = true,
    NEED_PAUSE_ICE_WATER_PUMP_TANK = true,
    }
prg.cw_tank1.COOLING =
    {
    ACTIVE_WORKING = false,
    }
prg.line_in_m18.WASHING_CIP =
    {
    CIP_WASH_REQUEST = prg.control_modules.M18DI1,
    DES_SIGNAL = prg.control_modules.M18DI3,
    CIP_WASH_END = prg.control_modules.M18DI2,
    IGNORE_WATER_FLAG = false,
    }
prg.line_in_m18.FILL =
    {
    MIN_FLOW = prg.line_in_m18.PAR_FLOAT.MIN_FLOW,
    CONCENTRATION = prg.line_in_m18.PAR_FLOAT.CONCENTRATION_MILK,
    DELTA_CONCENTRATION = prg.line_in_m18.PAR_FLOAT.DELTA_CONCENTRATION_MILK,
    NO_FLOW_TIME = prg.line_in_m18.PAR_FLOAT.NO_FLOW_TIME,
    IS_END_ON_FULL_TANK = false,
    MOVE_TO_STEP_WAITING_BY_SIGNALS = false,
    NEED_PAUSE_AFTER_FULL_LAST_TANK = true,
    CONTINUE_PRODUCT_PUSH = true,
    }
prg.line_in_pm2.WASHING_CIP =
    {
    CIP_WASH_REQUEST = prg.control_modules.PM2DI1,
    DES_SIGNAL = prg.control_modules.PM2DI3,
    CIP_WASH_END = prg.control_modules.PM2DI2,
    IGNORE_WATER_FLAG = false,
    }
prg.line_in_pm2.FILL =
    {
    MIN_FLOW = prg.line_in_pm2.PAR_FLOAT.MIN_FLOW,
    CONCENTRATION = prg.line_in_pm2.PAR_FLOAT.CONCENTRATION_MILK,
    DELTA_CONCENTRATION = prg.line_in_pm2.PAR_FLOAT.DELTA_CONCENTRATION_MILK,
    NO_FLOW_TIME = prg.line_in_pm2.PAR_FLOAT.NO_FLOW_TIME,
    IS_END_ON_FULL_TANK = false,
    MOVE_TO_STEP_WAITING_BY_SIGNALS = false,
    NEED_PAUSE_AFTER_FULL_LAST_TANK = true,
    CONTINUE_PRODUCT_PUSH = true,
    }
prg.line_in_rc3.WASHING_CIP =
    {
    CIP_WASH_REQUEST = prg.control_modules.RC3DI1,
    DES_SIGNAL = prg.control_modules.RC3DI3,
    CIP_WASH_END = prg.control_modules.RC3DI2,
    IGNORE_WATER_FLAG = false,
    }
prg.line_in_rc3.FILL =
    {
    MIN_FLOW = prg.line_in_rc3.PAR_FLOAT.MIN_FLOW,
    CONCENTRATION = prg.line_in_rc3.PAR_FLOAT.CONCENTRATION_MILK,
    DELTA_CONCENTRATION = prg.line_in_rc3.PAR_FLOAT.DELTA_CONCENTRATION_MILK,
    NO_FLOW_TIME = prg.line_in_rc3.PAR_FLOAT.NO_FLOW_TIME,
    IS_END_ON_FULL_TANK = false,
    MOVE_TO_STEP_WAITING_BY_SIGNALS = false,
    NEED_PAUSE_AFTER_FULL_LAST_TANK = true,
    CONTINUE_PRODUCT_PUSH = true,
    }
prg.line_pumping_r11.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE4DI8,
    DES_SIGNAL = prg.control_modules.MCA4LINE4DI7,
    FLIP_ENABLE = prg.control_modules.MCA4LINE4DI5,
    FLIP_END = prg.control_modules.MCA4LINE4DO3,
    CIP_WASH_END = prg.control_modules.MCA4LINE4DI3,
    IGNORE_WATER_FLAG = false,
    }
prg.line_pumping_r11.PUMPING =
    {
    DST = prg.line_pumping_r11.PAR_FLOAT.CURRENT_DST,
    SRC = prg.line_pumping_r11.PAR_FLOAT.CURRENT_SRC,
    }
prg.line_pumping_r12.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE4DI8,
    DES_SIGNAL = prg.control_modules.MCA4LINE4DI7,
    FLIP_ENABLE = prg.control_modules.MCA4LINE4DI5,
    FLIP_END = prg.control_modules.MCA4LINE4DO3,
    CIP_WASH_END = prg.control_modules.MCA4LINE4DI3,
    IGNORE_WATER_FLAG = false,
    }
prg.line_pumping_r12.PUMPING =
    {
    DST = prg.line_pumping_r12.PAR_FLOAT.CURRENT_DST,
    SRC = prg.line_pumping_r12.PAR_FLOAT.CURRENT_SRC,
    }
prg.line_out_r21.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE3DI8,
    DES_SIGNAL = prg.control_modules.MCA4LINE3DI7,
    FLIP_ENABLE = prg.control_modules.MCA4LINE3DI5,
    FLIP_END = prg.control_modules.MCA4LINE3DO3,
    CIP_WASH_END = prg.control_modules.MCA4LINE3DI3,
    IGNORE_WATER_FLAG = false,
    }
prg.line_out_r21.OUT =
    {
    product_DO = prg.control_modules.R21DO13,
    product_request = prg.control_modules.R21DI12,
    water_request = prg.control_modules.R21DI14,
    water_DO = prg.control_modules.R21DO12,
    USE_VOLUME = false,
    CONTINUE_WATER_PUSH = false,
    NEED_PAUSE_AFTER_EMPTY_LAST_TANK = false,
    WAITING_WATER_REQUEST = false,
    }
prg.line_out_r22.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE3DI8,
    DES_SIGNAL = prg.control_modules.MCA4LINE3DI7,
    FLIP_ENABLE = prg.control_modules.MCA4LINE3DI5,
    FLIP_END = prg.control_modules.MCA4LINE3DO3,
    CIP_WASH_END = prg.control_modules.MCA4LINE3DI3,
    IGNORE_WATER_FLAG = false,
    }
prg.line_out_r22.OUT =
    {
    product_DO = prg.control_modules.R22DO13,
    product_request = prg.control_modules.R22DI12,
    water_request = prg.control_modules.R22DI14,
    water_DO = prg.control_modules.R22DO12,
    USE_VOLUME = false,
    CONTINUE_WATER_PUSH = false,
    NEED_PAUSE_AFTER_EMPTY_LAST_TANK = false,
    WAITING_WATER_REQUEST = false,
    }
prg.line_out_r23.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE3DI8,
    DES_SIGNAL = prg.control_modules.MCA4LINE3DI7,
    FLIP_ENABLE = prg.control_modules.MCA4LINE3DI5,
    FLIP_END = prg.control_modules.MCA4LINE3DO3,
    CIP_WASH_END = prg.control_modules.MCA4LINE3DI3,
    IGNORE_WATER_FLAG = false,
    }
prg.line_out_r23.OUT =
    {
    product_DO = prg.control_modules.R23DO13,
    product_request = prg.control_modules.R23DI12,
    water_request = prg.control_modules.R23DI14,
    water_DO = prg.control_modules.R23DO12,
    USE_VOLUME = false,
    CONTINUE_WATER_PUSH = false,
    NEED_PAUSE_AFTER_EMPTY_LAST_TANK = false,
    WAITING_WATER_REQUEST = false,
    }
prg.line_out_r24.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE3DI8,
    DES_SIGNAL = prg.control_modules.MCA4LINE3DI7,
    FLIP_ENABLE = prg.control_modules.MCA4LINE3DI5,
    FLIP_END = prg.control_modules.MCA4LINE3DO3,
    CIP_WASH_END = prg.control_modules.MCA4LINE3DI3,
    IGNORE_WATER_FLAG = false,
    }
prg.line_out_r24.OUT =
    {
    product_DO = prg.control_modules.R24DO13,
    product_request = prg.control_modules.R24DI12,
    water_request = prg.control_modules.R24DI14,
    water_DO = prg.control_modules.R24DO12,
    USE_VOLUME = false,
    CONTINUE_WATER_PUSH = false,
    NEED_PAUSE_AFTER_EMPTY_LAST_TANK = false,
    WAITING_WATER_REQUEST = false,
    }
prg.line_pumping_ra1.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE4DI8,
    DES_SIGNAL = prg.control_modules.MCA4LINE4DI7,
    FLIP_ENABLE = prg.control_modules.MCA4LINE4DI5,
    FLIP_END = prg.control_modules.MCA4LINE4DO3,
    CIP_WASH_END = prg.control_modules.MCA4LINE4DI3,
    IGNORE_WATER_FLAG = false,
    }
prg.line_pumping_ra1.PUMPING =
    {
    DST = prg.line_pumping_ra1.PAR_FLOAT.CURRENT_DST,
    SRC = prg.line_pumping_ra1.PAR_FLOAT.CURRENT_SRC,
    }
prg.line_in_v1.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE3DI8,
    DES_SIGNAL = prg.control_modules.MCA4LINE3DI7,
    FLIP_ENABLE = prg.control_modules.MCA4LINE3DI5,
    FLIP_END = prg.control_modules.MCA4LINE3DO3,
    CIP_WASH_END = prg.control_modules.MCA4LINE3DI3,
    IGNORE_WATER_FLAG = true,
    }
prg.line_in_v1.FILL =
    {
    MIN_FLOW = prg.line_in_v1.PAR_FLOAT.MIN_FLOW,
    NO_FLOW_TIME = prg.line_in_v1.PAR_FLOAT.NO_FLOW_TIME,
    IS_END_ON_FULL_TANK = true,
    MOVE_TO_STEP_WAITING_BY_SIGNALS = false,
    NEED_PAUSE_AFTER_FULL_LAST_TANK = false,
    CONTINUE_PRODUCT_PUSH = false,
    }
prg.line_pumping_ra2.WASHING_CIP =
    {
    INCORRECT_CIP = prg.control_modules.MCA4LINE4DI8,
    DES_SIGNAL = prg.control_modules.MCA4LINE4DI7,
    FLIP_ENABLE = prg.control_modules.MCA4LINE4DI5,
    FLIP_END = prg.control_modules.MCA4LINE4DO3,
    CIP_WASH_END = prg.control_modules.MCA4LINE4DI3,
    IGNORE_WATER_FLAG = false,
    }
prg.line_pumping_ra2.PUMPING =
    {
    DST = prg.line_pumping_ra2.PAR_FLOAT.CURRENT_DST,
    SRC = prg.line_pumping_ra2.PAR_FLOAT.CURRENT_SRC,
    }

prg.tank1.LS_up = prg.control_modules.TANK1LS2
prg.tank1.hatch = prg.control_modules.TANK1GS1
prg.tank1.LS_down = prg.control_modules.TANK1LS1
prg.tank1.LT = prg.control_modules.TANK1LT1
prg.tank1.TE = prg.control_modules.TANK1TE1
prg.tank1.out_pump = prg.control_modules.CIP1M1
prg.tank1.signal_column = prg.control_modules.MCC1HLA1
prg.tank2.LS_up = prg.control_modules.TANK2LS2
prg.tank2.hatch = prg.control_modules.TANK2GS1
prg.tank2.LS_down = prg.control_modules.TANK2LS1
prg.tank2.LT = prg.control_modules.TANK2LT1
prg.tank2.TE = prg.control_modules.TANK2TE1
prg.tank2.out_pump = prg.control_modules.CIP1M1
prg.tank2.signal_column = prg.control_modules.MCC1HLA1
prg.tank3.LS_up = prg.control_modules.TANK3LS2
prg.tank3.hatch = prg.control_modules.TANK3GS1
prg.tank3.LS_down = prg.control_modules.TANK3LS1
prg.tank3.LT = prg.control_modules.TANK3LT1
prg.tank3.TE = prg.control_modules.TANK3TE1
prg.tank3.out_pump = prg.control_modules.CIP1M1
prg.tank3.signal_column = prg.control_modules.MCC1HLA1
prg.tank4.LS_up = prg.control_modules.TANK4LS2
prg.tank4.hatch = prg.control_modules.TANK4GS1
prg.tank4.LS_down = prg.control_modules.TANK4LS1
prg.tank4.LT = prg.control_modules.TANK4LT1
prg.tank4.TE = prg.control_modules.TANK4TE1
prg.tank4.out_pump = prg.control_modules.CIP1M1
prg.tank4.signal_column = prg.control_modules.MCC1HLA1
prg.tank5.LS_up = prg.control_modules.TANK5LS2
prg.tank5.hatch = prg.control_modules.TANK5GS1
prg.tank5.LS_down = prg.control_modules.TANK5LS1
prg.tank5.LT = prg.control_modules.TANK5LT1
prg.tank5.TE = prg.control_modules.TANK5TE1
prg.tank5.out_pump = prg.control_modules.CIP1M2
prg.tank5.signal_column = prg.control_modules.MCC1HLA1
prg.tank6.LS_up = prg.control_modules.TANK6LS2
prg.tank6.hatch = prg.control_modules.TANK6GS1
prg.tank6.LS_down = prg.control_modules.TANK6LS1
prg.tank6.LT = prg.control_modules.TANK6LT1
prg.tank6.TE = prg.control_modules.TANK6TE1
prg.tank6.out_pump = prg.control_modules.CIP1M2
prg.tank6.signal_column = prg.control_modules.MCC1HLA1
prg.tank7.LS_up = prg.control_modules.TANK7LS2
prg.tank7.hatch = prg.control_modules.TANK7GS1
prg.tank7.LS_down = prg.control_modules.TANK7LS1
prg.tank7.LT = prg.control_modules.TANK7LT1
prg.tank7.TE = prg.control_modules.TANK7TE1
prg.tank7.out_pump = prg.control_modules.CIP1M2
prg.tank7.signal_column = prg.control_modules.MCC1HLA1
prg.tank8.LS_up = prg.control_modules.TANK8LS2
prg.tank8.hatch = prg.control_modules.TANK8GS1
prg.tank8.LS_down = prg.control_modules.TANK8LS1
prg.tank8.LT = prg.control_modules.TANK8LT1
prg.tank8.TE = prg.control_modules.TANK8TE1
prg.tank8.out_pump = prg.control_modules.CIP1M2
prg.tank8.signal_column = prg.control_modules.MCC1HLA1
prg.mix_node_tank1.hatch = prg.control_modules.TANK1GS1
prg.mix_node_tank1.LT = prg.control_modules.TANK1LT1
prg.mix_node_tank1.mix = prg.control_modules.TANK1M1
prg.mix_node_tank2.hatch = prg.control_modules.TANK2GS1
prg.mix_node_tank2.LT = prg.control_modules.TANK2LT1
prg.mix_node_tank2.mix = prg.control_modules.TANK2M1
prg.mix_node_tank3.hatch = prg.control_modules.TANK3GS1
prg.mix_node_tank3.LT = prg.control_modules.TANK3LT1
prg.mix_node_tank3.mix = prg.control_modules.TANK3M1
prg.mix_node_tank4.hatch = prg.control_modules.TANK4GS1
prg.mix_node_tank4.LT = prg.control_modules.TANK4LT1
prg.mix_node_tank4.mix = prg.control_modules.TANK4M1
prg.mix_node_tank5.hatch = prg.control_modules.TANK5GS1
prg.mix_node_tank5.LT = prg.control_modules.TANK5LT1
prg.mix_node_tank5.mix = prg.control_modules.TANK5M1
prg.mix_node_tank6.hatch = prg.control_modules.TANK6GS1
prg.mix_node_tank6.LT = prg.control_modules.TANK6LT1
prg.mix_node_tank6.mix = prg.control_modules.TANK6M1
prg.mix_node_tank7.hatch = prg.control_modules.TANK7GS1
prg.mix_node_tank7.LT = prg.control_modules.TANK7LT1
prg.mix_node_tank7.mix = prg.control_modules.TANK7M1
prg.mix_node_tank8.hatch = prg.control_modules.TANK8GS1
prg.mix_node_tank8.LT = prg.control_modules.TANK8LT1
prg.mix_node_tank8.mix = prg.control_modules.TANK8M1
prg.cooler_node_tank1.TE = prg.control_modules.TANK1TE1
prg.cooler_node_tank2.TE = prg.control_modules.TANK2TE1
prg.cooler_node_tank3.TE = prg.control_modules.TANK3TE1
prg.cooler_node_tank4.TE = prg.control_modules.TANK4TE1
prg.cooler_node_tank5.TE = prg.control_modules.TANK5TE1
prg.cooler_node_tank6.TE = prg.control_modules.TANK6TE1
prg.cooler_node_tank7.TE = prg.control_modules.TANK7TE1
prg.cooler_node_tank8.TE = prg.control_modules.TANK8TE1
prg.cw_tank1.UPPER_SET_VALUE = prg.cw_tank1.PAR_FLOAT.UPPER_SET_VALUE
prg.cw_tank1.LS_up = prg.control_modules.CW_TANK1LS2
prg.cw_tank1.LS_down = prg.control_modules.CW_TANK1LS1
prg.cw_tank1.LT = prg.control_modules.CW_TANK1LT1
prg.cw_tank1.M1 = prg.control_modules.CW_TANK1M1
prg.cw_tank1.LOWER_SET_VALUE = prg.cw_tank1.PAR_FLOAT.LOWER_SET_VALUE
prg.line_pumping_r11.product_CTR = prg.control_modules.R11FQT1
prg.line_pumping_r12.product_CTR = prg.control_modules.R12FQT1
prg.line_out_r21.water_V = prg.control_modules.R21V101
prg.line_out_r21.product_CTR = prg.control_modules.R21FQT1
prg.line_out_r22.water_V = prg.control_modules.R22V101
prg.line_out_r22.product_CTR = prg.control_modules.R22FQT1
prg.line_out_r23.water_V = prg.control_modules.R23V101
prg.line_out_r23.product_CTR = prg.control_modules.R23FQT1
prg.line_out_r24.water_V = prg.control_modules.R24V101
prg.line_out_r24.product_CTR = prg.control_modules.R24FQT1
prg.line_pumping_ra1.product_CTR = prg.control_modules.RA1FQT1
prg.line_in_v1.product_CTR = prg.control_modules.V1FQT1
prg.line_pumping_ra2.product_CTR = prg.control_modules.RA2FQT1

add_functionality(prg.master1, basic_master)

add_functionality(prg.tank1, basic_tank)
add_functionality(prg.tank2, basic_tank)
add_functionality(prg.tank3, basic_tank)
add_functionality(prg.tank4, basic_tank)
add_functionality(prg.tank5, basic_tank)
add_functionality(prg.tank6, basic_tank)
add_functionality(prg.tank7, basic_tank)
add_functionality(prg.tank8, basic_tank)

add_functionality(prg.user_object_user91, basic_user_object)

add_functionality(prg.mix_node_tank1, basic_mix_node)
add_functionality(prg.mix_node_tank2, basic_mix_node)
add_functionality(prg.mix_node_tank3, basic_mix_node)
add_functionality(prg.mix_node_tank4, basic_mix_node)
add_functionality(prg.mix_node_tank5, basic_mix_node)
add_functionality(prg.mix_node_tank6, basic_mix_node)
add_functionality(prg.mix_node_tank7, basic_mix_node)
add_functionality(prg.mix_node_tank8, basic_mix_node)

add_functionality(prg.user_object_user92, basic_user_object)

add_functionality(prg.cooler_node_tank1, basic_cooler_node)
add_functionality(prg.cooler_node_tank2, basic_cooler_node)
add_functionality(prg.cooler_node_tank3, basic_cooler_node)
add_functionality(prg.cooler_node_tank4, basic_cooler_node)
add_functionality(prg.cooler_node_tank5, basic_cooler_node)
add_functionality(prg.cooler_node_tank6, basic_cooler_node)
add_functionality(prg.cooler_node_tank7, basic_cooler_node)
add_functionality(prg.cooler_node_tank8, basic_cooler_node)

add_functionality(prg.user_object_user93, basic_user_object)

add_functionality(prg.cw_tank1, basic_ice_water_pump_tank)

add_functionality(prg.line_in_m18, basic_line)

add_functionality(prg.line_in_pm2, basic_line)

add_functionality(prg.line_in_rc3, basic_line)

add_functionality(prg.line_pumping_r11, basic_line)
add_functionality(prg.line_pumping_r12, basic_line)

add_functionality(prg.line_out_r21, basic_line)
add_functionality(prg.line_out_r22, basic_line)
add_functionality(prg.line_out_r23, basic_line)
add_functionality(prg.line_out_r24, basic_line)

add_functionality(prg.line_pumping_ra1, basic_line)

add_functionality(prg.user_object_almix1, basic_user_object)

add_functionality(prg.user_object_heat_excr1, basic_user_object)
add_functionality(prg.user_object_heat_excr2, basic_user_object)

add_functionality(prg.line_in_v1, basic_line)

add_functionality(prg.line_pumping_ra2, basic_line)

add_functionality(prg.user_object_almix2, basic_user_object)
return prg
