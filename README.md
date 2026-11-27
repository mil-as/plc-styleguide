# PLC Programming Style Guide

A vendor-neutral style guide for IEC 61131-3 PLC programming, written for
**humans and AI coding agents** (Claude Code, Codex, etc.).

- **Primary platform:** Beckhoff TwinCAT 3 (4026)
- **Also applies to:** Siemens TIA Portal, Omron Sysmac Studio, CODESYS
- **Main focus:** naming conventions
- **Language:** all code, identifiers and comments are written in English

> Status: **DRAFT** – rules may still change. See [decisions/](decisions/) for the reasoning behind each choice.

## Quick reference – the most used prefixes

| Element | Prefix | Example |
|---|---|---|
| Function block (type) | `fb` | `fbMotorController` |
| Function | `fc` | `fcScaleAnalog` |
| Program | `prg` | `prgMain` |
| Interface | `itf` | `itfMotor` |
| Structure / UDT | `type` | `typeMotorConfig` |
| Enumeration | `enum` | `enumMachineState` |
| FB instance (any) | `inst` | `instMotorA`, `instMotors` (array) |
| Temporary variable | `temp` | `tempIndex` |
| Internal static variable | `stat` | `statStep` |
| Static exposed to HMI/SCADA | `ext` | `extHmiCommand` |
| Global variable list | `gvl` | `gvlMachine` |
| Global data block (TIA) | *(none)*, PascalCase | `Machine` |
| Constant | `UPPER_SNAKE_CASE` | `MAX_MOTORS` |
| Input / output / in-out parameter | *(none)* | `enable`, `done`, `axis` |

No Hungarian notation: the **data type is never encoded in the name**
(`bStart`, `nCount`, `fSpeed`, `sName` are not allowed).
Prefixes describe the **kind of element or its scope**, not its data type.

## Contents

| File | Topic |
|---|---|
| [docs/00-principles.md](docs/00-principles.md) | Purpose, rule levels, rule IDs |
| [docs/01-naming-general.md](docs/01-naming-general.md) | Casing, character set, abbreviations, length |
| [docs/02-naming-variables.md](docs/02-naming-variables.md) | Parameters, local variables, instances, constants |
| [docs/03-naming-pous.md](docs/03-naming-pous.md) | FBs, functions, programs, methods, properties, interfaces |
| [docs/04-naming-data-types.md](docs/04-naming-data-types.md) | Structures, enumerations, unions, aliases |
| [docs/05-naming-global-data.md](docs/05-naming-global-data.md) | GVLs, global DBs, tag tables, libraries, tasks |
| [docs/06-naming-hardware-io.md](docs/06-naming-hardware-io.md) | Hardware modules and I/O signals |
| [docs/07-code-structure.md](docs/07-code-structure.md) | Code structure *(stub)* |
| [docs/08-comments.md](docs/08-comments.md) | Comments and block headers *(stub)* |
| [docs/platform-mapping.md](docs/platform-mapping.md) | TwinCAT ↔ TIA ↔ Sysmac ↔ CODESYS terms |
| [rules/naming.yaml](rules/naming.yaml) | Machine-readable naming rules (patterns) |
| [examples/](examples/) | Example code that follows the guide |
| [AGENTS.md](AGENTS.md) | Instructions for AI agents |

## Using this guide in a PLC project

PLC projects read the guide **directly from GitHub, branch `main`**. Do not
copy the guide into the PLC project or add it as a submodule. There is one
copy, and every project uses the current rules (see
[decisions/0006](decisions/0006-guide-read-from-github.md)).

Add this `AGENTS.md` to the PLC project repository (and a `CLAUDE.md` that
contains only `@AGENTS.md`):

```markdown
# Agent instructions

All PLC code in this repository follows the PLC Programming Style Guide.
The guide is NOT stored in this repository; there is no local copy.
Read it from GitHub, branch `main`:

- Repository: https://github.com/mil-as/plc-styleguide
- Raw files:  https://raw.githubusercontent.com/mil-as/plc-styleguide/main/<path>

Before writing or reviewing PLC code, read:
1. README.md – quick reference
2. AGENTS.md – section B
3. rules/naming.yaml – exact name patterns
4. The docs/ file for the element you are naming (listed in README.md)

When you flag a violation, cite the rule ID (e.g. NAM-POU-002).
The project deviations below take precedence over the guide (GEN-PRI-002).

## Project deviations
- None
```

To freeze the rules for a delivered project, replace `main` in the raw URL
with a release tag or commit hash.

## Scope

Included: naming, code structure, comments, design rules that apply to all
IEC 61131-3 platforms.
Not included: IDE settings (fonts, editor options, debugging settings),
or anything specific to a single engineering tool's user interface.

## Acknowledgements

Inspired by the Siemens *Programming Style Guide for SIMATIC S7-1200/S7-1500*
(entry 81318674) and the Beckhoff TwinCAT 3 naming conventions. All rules here
are written independently; no text is copied from those documents.
