# 0003 – No prefix for TIA global data blocks

- **Date:** 2026-11-27
- **Status:** Accepted
- **Supersedes:** the `db` prefix in [0001](0001-prefix-style.md)

## Context
Decision 0001 gave TIA Portal global DBs the prefix `db` to match `gvl` in
TwinCAT. The Siemens style guide uses no prefix for global DBs, while
Beckhoff uses `GVL`/`GVL_` for global variable lists.

## Decision
- **TwinCAT / CODESYS:** keep the `gvl` prefix (NAM-GLB-001). In ST, the prefix
  together with `qualified_only` is the only thing that shows global access,
  and without it `Machine.isReady` could be mistaken for a library namespace.
- **TIA Portal:** global DBs have no prefix (NAM-GLB-002). TIA syntax already
  marks global access (`"Machine".isReady` vs. `#statStep`), instance DBs use
  `inst`, so a DB without prefix is always a global DB.

## Consequences
- Follows each platform's established convention: Beckhoff for GVLs,
  Siemens for global DBs.
- Names of global data containers differ between platforms
  (`gvlMachine` vs. `Machine`). Variables inside them are named the same way.
