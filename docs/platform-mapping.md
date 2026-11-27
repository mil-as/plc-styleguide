# Platform mapping

How the terms used in this guide map to each platform.

| Guide term | TwinCAT 3 | TIA Portal | Omron Sysmac | CODESYS | Prefix |
|---|---|---|---|---|---|
| Function block | FUNCTION_BLOCK | FB | Function block | FUNCTION_BLOCK | `fb` |
| Function | FUNCTION | FC | Function | FUNCTION | `fc` |
| Program | PROGRAM | – (OB) | Program | PROGRAM | `prg` |
| Organization block | – | OB | – | – | `ob` |
| Interface | INTERFACE | – | – | INTERFACE | `itf` |
| Method / Property | METHOD / PROPERTY | – | – | METHOD / PROPERTY | *(PascalCase)* |
| Structure | DUT STRUCT | PLC data type (UDT) | Structure data type | DUT STRUCT | `type` |
| Enumeration | DUT ENUM | Named value data type | Enumeration | DUT ENUM | `enum` |
| Union | DUT UNION | – | Union | DUT UNION | `union` |
| Global variables | GVL | Global DB / PLC tags | Global variable table | GVL | `gvl` (TIA DB: none) |
| FB instance | instance variable | multi-instance / instance DB | instance variable | instance variable | `inst` |
| Temporary variable | VAR_TEMP (VAR in FC/method) | Temp | Internal var. in function | VAR_TEMP | `temp` |
| Internal static | VAR | Static | Internal variable | VAR | `stat` |
| Static for HMI/SCADA | VAR | Static | Internal variable | VAR | `ext` |
| Task | Task | (cyclic interrupt OB) | Task | Task | `task` |
| Physical I/O | `AT %I*` / `AT %Q*` | I/Q tags | Device variables | `AT %I*` / `AT %Q*` | `di`/`do`/`ai`/`ao` |
