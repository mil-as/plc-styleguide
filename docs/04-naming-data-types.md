# 04 – Naming: data types

| Element | Prefix | Example |
|---|---|---|
| Structure / UDT / PLC data type | `type` | `typeMotorConfig` |
| Enumeration / named value type | `enum` | `enumMachineState` |
| Enumeration value | `UPPER_SNAKE_CASE` | `RUNNING` |
| Union | `union` | `unionWordBits` |
| Alias | `alias` | `aliasMotorSpeed` |

---

### NAM-TYP-001 – Structures use the prefix `type`
- **Level:** Rule
- **Applies to:** `STRUCT` DUTs, TIA PLC data types (UDT), Sysmac structures
- **Status:** Draft

Only the type gets the prefix. Variables of the type and members inside it
are named normally.

| Correct | Incorrect |
|---|---|
| `TYPE typeMotorConfig : STRUCT ...` / `motorConfig : typeMotorConfig;` | `ST_MotorConfig`, `udtMotorConfig`, `typeMotorConfig : typeMotorConfig` as variable name |

### NAM-TYP-002 – Enumerations use the prefix `enum`
- **Level:** Rule
- **Applies to:** `ENUM` DUTs, TIA named value data types, Sysmac enums
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `enumMachineState`, `enumDirection` | `E_MachineState`, `eState`, `nvtState` |

### NAM-TYP-003 – Enumeration values use `UPPER_SNAKE_CASE`
- **Level:** Rule
- **Applies to:** enumeration values
- **Status:** Draft

```iecst
{attribute 'qualified_only'}
{attribute 'strict'}
TYPE enumMachineState :
(
    IDLE := 0,
    STARTING := 10,
    RUNNING := 20,
    STOPPING := 30,
    ERROR := 900
);
END_TYPE
```

Usage: `statState := enumMachineState.RUNNING;`

**Platform notes:** In TwinCAT/CODESYS always use `qualified_only` so values
are written with the type name. In TIA: `enumMachineState#RUNNING`.

### NAM-TYP-004 – Unions use the prefix `union`
- **Level:** Rule
- **Applies to:** `UNION`
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `unionWordBits` | `U_WordBits`, `WordBits` |

**Rationale:** Same as for structures: the type is clearly a data type and
cannot be confused with a variable.

This rule used to cover aliases as well; aliases are now NAM-TYP-006.

### NAM-TYP-005 – Variables of a type are named after their role
- **Level:** Rule
- **Applies to:** variables of user-defined types
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `feederConfig : typeMotorConfig;` | `typeMotorConfig1 : typeMotorConfig;`, `stMotorConfig : typeMotorConfig;` |

### NAM-TYP-006 – Aliases use the prefix `alias`
- **Level:** Rule
- **Applies to:** alias types (`TYPE aliasX : <base type>; END_TYPE`)
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `TYPE aliasMotorSpeed : LREAL; END_TYPE` | `T_MotorSpeed`, `MotorSpeed` |

**Rationale:** Same as for structures: the type is clearly a data type and
cannot be confused with a variable.
