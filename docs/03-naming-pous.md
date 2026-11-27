# 03 – Naming: POUs (function blocks, functions, programs, methods, interfaces)

| Element | Prefix / style | Example |
|---|---|---|
| Function block | `fb` + PascalCase name | `fbMotorController` |
| Function | `fc` + verb phrase | `fcScaleAnalog` |
| Program | `prg` | `prgMain`, `prgConveyor` |
| Organization block (TIA) | `ob` | `obMain`, `obStartup` |
| Interface | `itf` | `itfMotor` |
| Method | PascalCase verb, no prefix | `Reset`, `MoveAbsolute` |
| Property | PascalCase noun/adjective, no prefix | `Speed`, `IsReady` |
| Action | PascalCase verb, no prefix | `HandleAlarms` |
| Transition (SFC) | `trans` + PascalCase | `transDoorClosed` |
| Step (SFC) | `step` + PascalCase | `stepWaitForPart` |

---

### NAM-POU-001 – POU names describe responsibility
- **Level:** Rule
- **Applies to:** all POUs
- **Status:** Draft

Function blocks are named after the *thing* they control or the *job* they
do (`fbMotorController`, `fbAnalogSignal`, `fbRecipeManager`).
Functions are named with a verb (`fcScaleAnalog`, `fcGetMachineState`).

### NAM-POU-002 – Function block types use the prefix `fb`
- **Level:** Rule
- **Applies to:** `FUNCTION_BLOCK`
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `fbMotorController`, `fbAnalogSignal` | `FB_Motor`, `MotorFB`, `MotorController` |

**Rationale:** The type is easy to tell apart from its instances (`inst`)
and from data types at the call site and in the project tree.

### NAM-POU-003 – Functions use the prefix `fc`
- **Level:** Rule
- **Applies to:** `FUNCTION`
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `fcScaleAnalog`, `fcCalcAverage` | `F_Scale`, `ScaleFC`, `scale` |

### NAM-POU-004 – Programs use the prefix `prg`
- **Level:** Rule
- **Applies to:** `PROGRAM`
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `prgMain`, `prgConveyorLine` | `MAIN`, `P_Conveyor` |

**Platform notes:** TIA Portal has no `PROGRAM` POU; organization blocks use
`ob` (NAM-POU-005). Sysmac programs are named the same way.

### NAM-POU-005 – TIA organization blocks use the prefix `ob`
- **Level:** Rule
- **Applies to:** TIA Portal OBs
- **Status:** Draft

`obMain`, `obCyclic100ms`, `obStartup`, `obDiagnosticError`.

### NAM-POU-006 – Interfaces use the prefix `itf`
- **Level:** Rule
- **Applies to:** `INTERFACE`
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `itfMotor`, `itfAlarmSource` | `I_Motor`, `IMotor` |

Variables that hold an interface are named without `itf`, after the role:
`motor : itfMotor`.

### NAM-POU-007 – Methods, properties and actions use PascalCase without prefix
- **Level:** Rule
- **Applies to:** `METHOD`, `PROPERTY`, `ACTION`
- **Status:** Draft

Methods start with a verb, Boolean properties with `Is`/`Has`/`Can`.

| Correct | Incorrect |
|---|---|
| `instMotorA.Reset()`, `instMotorA.IsReady` | `instMotorA.M_Reset()`, `instMotorA.reset()` |

**Rationale:** Members are always accessed through their instance, so a
prefix adds no information.

### NAM-POU-008 – Block interfaces follow PLCopen naming
- **Level:** Recommendation
- **Applies to:** asynchronous FBs
- **Status:** Draft

Blocks that run over several cycles use the standard PLCopen parameter
names: inputs `enable` or `execute`; outputs `valid`/`done`, `busy`,
`error`, `status`, `commandAborted`.
