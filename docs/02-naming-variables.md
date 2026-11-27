# 02 – Naming: variables, parameters, instances and constants

## Overview

| Declaration section | Prefix | Example |
|---|---|---|
| `VAR_INPUT` | *(none)* | `enable`, `speedSetpoint` |
| `VAR_OUTPUT` | *(none)* | `done`, `busy`, `error`, `status` |
| `VAR_IN_OUT` | *(none)* | `axis`, `recipe` |
| `VAR` in FB (internal static) | `stat` | `statStep`, `statTriggerOld` |
| `VAR` in FB read/written by HMI/SCADA/MES | `ext` | `extHmiCommand` |
| `VAR_TEMP`, `VAR` in functions/methods | `temp` | `tempIndex` |
| `VAR CONSTANT` (local or global) | *(UPPER_SNAKE_CASE)* | `MAX_RETRIES` |
| Any FB instance | `inst` | `instMotorA`, `instStartDelay` |
| Pointer | `ptr` | `ptrBuffer` |
| Reference | `ref` | `refAxis` |
| Variable in a GVL / global DB | *(none)* | `isMachineReady` |

---

### NAM-VAR-001 – No prefix on formal parameters
- **Level:** Rule
- **Applies to:** `VAR_INPUT`, `VAR_OUTPUT`, `VAR_IN_OUT`, function return values
- **Status:** Draft

Parameters are written in `lowerCamelCase` without prefix. They are the public
interface of the block and should read naturally at the call site.

| Correct | Incorrect |
|---|---|
| `instMotorA(enable := TRUE, speedSetpoint := 1500.0);` | `instMotorA(i_bEnable := TRUE, inSpeed := 1500.0);` |

### NAM-VAR-002 – Temporary variables use the prefix `temp`
- **Level:** Rule
- **Applies to:** `VAR_TEMP`; local `VAR` in functions and methods
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `tempIndex`, `tempSum` | `i`, `tmp`, `nIdx` |

**Rationale:** Temporary values are lost after the call. The prefix shows at
the point of use that the value is not kept between cycles.

**Platform notes:** In TwinCAT/CODESYS, local `VAR` in a `FUNCTION` or
`METHOD` is re-initialized every call and is therefore treated as temporary.

### NAM-VAR-003 – Internal static variables use the prefix `stat`
- **Level:** Rule
- **Applies to:** `VAR` in function blocks and programs
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `statStep`, `statTriggerOld` | `step`, `_step`, `m_step` |

**Rationale:** Distinguishes stored internal state from parameters and
temporary values.

### NAM-VAR-004 – Statics accessed from outside the PLC use the prefix `ext`
- **Level:** Rule
- **Applies to:** `VAR` in function blocks that are read or written by HMI,
  SCADA, MES, OPC UA, ADS etc.
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `extHmiCommand`, `extHmiStatus` | `hmiCommand` (in `VAR` without marking) |

**Rationale:** Makes the external interface visible. Internal `stat`
variables may change freely between versions; `ext` variables must not.

### NAM-VAR-005 – FB instances use the prefix `inst`
- **Level:** Rule
- **Applies to:** every instance of a function block: local, global, in
  arrays, in structures, standard FBs (TON, R_TRIG, ...) and TIA single-
  instance DBs
- **Status:** Draft

The name after `inst` describes the *role* of the instance, not its type.

| Correct | Incorrect |
|---|---|
| `instMotorA`, `instFeedConveyor`, `instStartDelay` (TON) | `fbMotorA`, `MotorA`, `TON_1`, `instFbMotor` |
| `instMotors : ARRAY[0..MAX_MOTORS] OF fbMotorController` | `motorInstances` |

**Rationale:** The prefix shows that the element has internal state and must
be called each cycle.

**Platform notes:** TIA Portal single-instance DBs are also named with `inst`
(`instConveyorFeed`), see NAM-GLB-006.

### NAM-VAR-006 – Constants use `UPPER_SNAKE_CASE`
- **Level:** Rule
- **Applies to:** local and global constants
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `MAX_MOTORS`, `TIMEOUT_DOOR_OPEN` | `maxMotors`, `cMaxMotors`, `MAXMOTORS` |

Status and error code constants use the prefixes `STATUS_`, `WARN_`, `ERR_`:
`ERR_TIMEOUT`, `STATUS_DONE`.

### NAM-VAR-007 – No magic numbers
- **Level:** Rule
- **Applies to:** code
- **Status:** Draft

Literal values other than `0`, `1`, `0.0`, `TRUE`, `FALSE` are declared as
named constants.

| Correct | Incorrect |
|---|---|
| `IF tempTemperature > MAX_TEMPERATURE THEN` | `IF tempTemperature > 85.0 THEN` |

### NAM-VAR-008 – Pointers and references use `ptr` and `ref`
- **Level:** Rule
- **Applies to:** `POINTER TO`, `REFERENCE TO`, `REF_TO`
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `ptrBuffer`, `refAxis` | `pBuffer`, `buffer` |

**Rationale:** Unlike data type prefixes, these change how the variable must
be used (dereferencing, validity checks), so marking them prevents errors.

### NAM-VAR-009 – Edge detection and previous values use the suffix `Old`
- **Level:** Recommendation
- **Applies to:** variables storing the value from the previous cycle
- **Status:** Draft

`statStartOld` stores the value of `start` from the last cycle.

### NAM-VAR-010 – Elements inside structures have no prefix
- **Level:** Rule
- **Applies to:** members of structures/UDTs and GVL/global DB variables
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `motorConfig.maxSpeed` | `motorConfig.statMaxSpeed` |

Exception: FB instances inside a structure keep `inst`.
