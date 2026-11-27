# 01 – Naming: general rules

An identifier is built from up to three parts:

```
[prefix][Name][Suffix]
  fb     MotorController
  inst   ConveyorFeed
  stat   Trigger          Old
```

---

### NAM-GEN-001 – Names are meaningful and consistent
- **Level:** Rule
- **Applies to:** all identifiers
- **Status:** Draft

A name describes what the element *means* in the process, not how it is
implemented. The same thing has the same name everywhere (same spelling and
capitalization). Words appear in natural English order.

| Correct | Incorrect |
|---|---|
| `conveyorSpeed` | `speedConv`, `cs`, `value1` |

### NAM-GEN-002 – Identifiers use the casing defined for their kind
- **Level:** Rule
- **Applies to:** all identifiers
- **Status:** Draft

| Style | Used for | Example |
|---|---|---|
| `lowerCamelCase` | variables, parameters, prefixed identifiers | `motorSpeed`, `fbMotorController` |
| `PascalCase` | methods, properties, actions, folders, libraries, namespaces, projects | `MoveAbsolute`, `MotionLib` |
| `UPPER_SNAKE_CASE` | constants, enumeration values | `MAX_MOTORS`, `RUNNING` |

With a prefix, the prefix is lowercase and the following name starts with a
capital letter: `fb` + `MotorController` → `fbMotorController`.

**Rationale:** Prefix and name stay visually separated without underscores.

### NAM-GEN-003 – No Hungarian notation
- **Level:** Rule
- **Applies to:** all identifiers
- **Status:** Draft

Do not encode the data type in the name. Prefixes in this guide describe the
*kind* of element (FB type, instance, temporary, constant, ...) or its
*scope*, never its data type.

| Correct | Incorrect |
|---|---|
| `isStarted`, `partCount`, `speedSetpoint`, `recipeName` | `bStarted`, `nPartCount`, `fSpeedSetpoint`, `sRecipeName` |

For the standard status parameters of function blocks (`error`, `errorId`,
`busy`, `done`, ...) use the names listed in NAM-VAR-011.

**Rationale:** Data types change; names should not have to. The IDE shows the
type when needed.

### NAM-GEN-004 – Identifiers use only `A–Z`, `a–z`, `0–9` and `_`
- **Level:** Rule
- **Applies to:** all identifiers
- **Status:** Draft

Only `a–z`, `A–Z`, `0–9` and `_`. No spaces, no national characters
(æ, ø, å, ä, ö, ü, ...). Identifiers do not start with a digit or an
underscore.

### NAM-GEN-005 – Underscores are used only where specified
- **Level:** Rule
- **Applies to:** all identifiers
- **Status:** Draft

Underscores are used only in `UPPER_SNAKE_CASE`, as the library separator
(NAM-GLB-005) and in hardware designations (NAM-HWI-001). Do not use them to
separate words in other identifiers.

| Correct | Incorrect |
|---|---|
| `motorSpeedActual` | `motor_speed_actual`, `Motor_Speed` |

### NAM-GEN-006 – Identifiers are at most 32 characters long
- **Level:** Recommendation
- **Applies to:** all identifiers
- **Status:** Draft

Keep identifiers short but descriptive: **at most 32 characters** including
prefix. Long access paths add up (`instFeedConveyor.statGapTimeLeft`).

### NAM-GEN-007 – Only standard abbreviations are used
- **Level:** Recommendation
- **Applies to:** all identifiers
- **Status:** Draft

Use only well-known abbreviations, at most one per identifier where
possible. Abbreviations are written like words (`Cmd`, not `CMD`, inside
camelCase: `hmiCmd`, `ioLinkPort`). Preferred abbreviations:

| Abbr. | Meaning | Abbr. | Meaning |
|---|---|---|---|
| `Act` | actual / current value | `Max` | maximum |
| `Set` | setpoint (as suffix) | `Min` | minimum |
| `Avg` | average | `Lim` | limit |
| `Cnt` | count / counter | `Len` | length |
| `Pos` | position | `Vel` | velocity |
| `Acc` | acceleration | `Dir` | direction |
| `Cmd` | command | `Sts` | status |
| `Err` | error | `Warn` | warning |
| `Prev` | previous value | `Next` | next value |
| `Old` | value from last cycle (edge detection) | `Sim` | simulated |
| `Addr` | address | `Diff` | difference |
| `Cfg` | configuration | `Hmi` | HMI |
| `Rise` | rising edge | `Fall` | falling edge |

### NAM-GEN-008 – Arrays use plural nouns
- **Level:** Rule
- **Applies to:** arrays
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `motors`, `instValves`, `alarms` | `motor`, `motorArray`, `arrMotor` |

Uncountable nouns stay singular (`data`, `information`).

### NAM-GEN-009 – Boolean names read as statements
- **Level:** Rule
- **Applies to:** BOOL variables and parameters
- **Status:** Draft

Booleans that describe a state start with `is`, `has`, `can` or `should`.
Booleans that are commands are named with a verb or the standard PLCopen
names (`enable`, `execute`, `reset`, `start`).

| Correct | Incorrect |
|---|---|
| `isRunning`, `hasError`, `canStart` | `running?`, `errorFlag`, `bRun` |

**Platform notes:** The standard status parameter names in NAM-VAR-011
(`done`, `busy`, `error`, `valid`, ...) are kept as they are and do not get
`is`/`has`.

### NAM-GEN-010 – Default names from the engineering tool are replaced
- **Level:** Rule
- **Applies to:** all objects
- **Status:** Draft

Placeholder names created by the engineering tool (`PLC_1`, `Block_1`,
`Untitled1`, `Box 1`, `Term 2`, `PlcTask`, `MAIN`) are replaced with
meaningful names. For `MAIN` in existing projects, see NAM-POU-004.
