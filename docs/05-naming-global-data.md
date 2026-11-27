# 05 – Naming: global data, libraries, tasks and project objects

| Element | Prefix / style | Example |
|---|---|---|
| Global variable list (TwinCAT, CODESYS) | `gvl` | `gvlMachine`, `gvlIo` |
| Global data block (TIA) | *(none)*, PascalCase | `Machine` |
| Instance DB, single instance (TIA) | `inst` | `instConveyorFeed` |
| PLC tag table (TIA) | PascalCase | `IoConveyor` |
| Global variable table (Sysmac) | — (one per project) | |
| Variable in GVL/DB/tag table | none, lowerCamelCase | `isMachineReady` |
| Global constant | `UPPER_SNAKE_CASE` | `MAX_STATIONS` |
| Parameter list (TwinCAT) | `param` | `paramMachine` |
| Library | PascalCase, short | `MotionBase` |
| Namespace | PascalCase (= library name) | `MotionBase` |
| Task | `task` | `taskMain`, `taskFast` |
| Folder | PascalCase | `Conveyors`, `Utilities` |

---

### NAM-GLB-001 – Global variable lists use the prefix `gvl`
- **Level:** Rule
- **Applies to:** GVLs in TwinCAT / CODESYS
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `gvlMachine`, `gvlHmi`, `gvlIo` | `GVL`, `GVL_Machine`, `Globals` |

**Rationale:** With `{attribute 'qualified_only'}` every access reads as
`gvlMachine.isReady`, which makes global access visible in the code.

**Platform notes:** Always add `{attribute 'qualified_only'}` to GVLs.

### NAM-GLB-002 – TIA global data blocks have no prefix
- **Level:** Rule
- **Applies to:** TIA Portal global DBs
- **Status:** Draft

Global DBs are named in PascalCase after their content, without prefix.
Variables inside them follow NAM-GLB-003.

| Correct | Incorrect |
|---|---|
| `Machine`, `HmiInterface`, `ReleaseSignals` | `dbMachine`, `DB1`, `Data_block_1` |

**Rationale:** TIA syntax already marks global access (`"Machine".isReady`
vs. `#statStep`), so a prefix adds no information. Instance DBs use `inst`
(NAM-GLB-006), so a DB without prefix is always a global DB. Matches the
Siemens style guide (see decisions/0003).

### NAM-GLB-003 – Global variables have no prefix
- **Level:** Rule
- **Applies to:** variables inside GVLs, global DBs, tag tables
- **Status:** Draft

The container already shows that the variable is global (`gvlMachine.`).
Instances inside them keep `inst`; constants are `UPPER_SNAKE_CASE`.

### NAM-GLB-004 – Global data is grouped by purpose
- **Level:** Recommendation
- **Applies to:** GVLs, global DBs
- **Status:** Draft

Use several small lists named after their purpose (`gvlIo`, `gvlHmi`,
`gvlMachine`, `gvlConstants`) instead of one large list.

### NAM-GLB-005 – Library elements are identified by the library name
- **Level:** Rule
- **Applies to:** libraries and their elements
- **Status:** Draft

Library names are short PascalCase names (max 12 characters).

- **TwinCAT / CODESYS:** The library namespace is the library name. Elements
  keep their normal names and are accessed as `MotionBase.fbAxis`.
- **TIA Portal / Sysmac (no namespaces):** Library elements are prefixed with
  the library name and an underscore: `MotionBase_fbAxis`,
  `MotionBase_typeAxisConfig`.

### NAM-GLB-006 – TIA single instance DBs use the prefix `inst`
- **Level:** Rule
- **Applies to:** TIA instance DBs
- **Status:** Draft

`instConveyorFeed`. Prefer multi-instances inside a parent FB over single
instance DBs.

### NAM-GLB-007 – Tasks use the prefix `task`
- **Level:** Rule
- **Applies to:** cyclic tasks (TwinCAT, CODESYS, Sysmac)
- **Status:** Draft

| Correct | Incorrect |
|---|---|
| `taskMain`, `taskFast`, `taskMotion` | `PlcTask`, `Task1` |
