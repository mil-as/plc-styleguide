# 0001 – Prefix style for POUs, instances and data types

- **Date:** 2026-11-25
- **Status:** Accepted (draft guide)

## Context
The Beckhoff convention uses Hungarian-style type prefixes (`bStart`,
`nCount`) and `FB_`/`ST_`/`E_` prefixes with underscores. The Siemens style
guide uses lowerCamelCase variables, `temp`/`stat`/`ext`/`inst` prefixes, and
no prefix on FBs/FCs.

## Decision
- No Hungarian notation (no data type in names).
- Use the Siemens-style scope prefixes `temp`, `stat`, `ext`, `inst`.
- **Deviation from Siemens:** POU and type declarations get lowercase prefixes
  without underscore: `fb`, `fc`, `prg`, `ob`, `itf`, `type`, `enum`,
  `union`, `alias`, `gvl`, `task`.
  Example: `fbMotorController` with instances `instMotorA`, `instMotorB`.
- **Deviation from Siemens:** `inst` (lowercase) is used for all instances,
  including TIA single-instance DBs (Siemens uses `Inst` there).
- ~~**Deviation from Siemens:** global DBs get `db` to match `gvl` in TwinCAT.~~
  Superseded by [0003](0003-no-prefix-for-tia-global-dbs.md): TIA global DBs have no prefix.
- `enum` is used instead of Siemens `nvt` because it is the IEC/TwinCAT term
  and works on all platforms.
- Physical I/O uses `di`/`do`/`ai`/`ao` (signal class, not data type).

## Consequences
- The kind of every element can be seen from its name in all four platforms.
- One consistent prefix style (lowercase prefix + PascalCase name).
- Existing TwinCAT libraries using `FB_`/`ST_`/`E_` names will not match; apply
  the guide to new code only unless a refactoring is planned.
