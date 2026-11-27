# 0002 – Rule IDs with subcategories instead of number ranges

- **Date:** 2026-11-25
- **Status:** Accepted

## Context
The first draft used IDs like `NAM-210`, where fixed number ranges
(`NAM-200`–`299` = POUs) decided which file a rule belonged to. The ranges
were hard to remember and left large unused gaps.

## Decision
Rule IDs have the form `CATEGORY-SUBCATEGORY-NNN`, e.g. `NAM-POU-002`.
- The three-letter subcategory decides the topic and the file.
- Every subcategory numbers its rules from `001` without ranges.
- Project-specific rules use the category `PRJ` instead of a reserved range.

All rules were renumbered once, before the first release, as follows.
After the first release IDs are never renumbered again.

| Old | New | Old | New | Old | New |
|---|---|---|---|---|---|
| GEN-001 | GEN-PRI-001 | NAM-120 | NAM-VAR-005 | NAM-311 | NAM-TYP-003 |
| GEN-002 | GEN-PRI-002 | NAM-130 | NAM-VAR-006 | NAM-320 | NAM-TYP-004 |
| GEN-003 | GEN-PRI-003 | NAM-131 | NAM-VAR-007 | NAM-330 | NAM-TYP-005 |
| GEN-004 | GEN-PRI-004 | NAM-140 | NAM-VAR-008 | NAM-400 | NAM-GLB-001 |
| NAM-001…010 | NAM-GEN-001…010 | NAM-141 | NAM-VAR-009 | NAM-410 | NAM-GLB-002 |
| NAM-100 | NAM-VAR-001 | NAM-150 | NAM-VAR-010 | NAM-411 | NAM-GLB-003 |
| NAM-110 | NAM-VAR-002 | NAM-200 | NAM-POU-001 | NAM-412 | NAM-GLB-004 |
| NAM-111 | NAM-VAR-003 | NAM-210 | NAM-POU-002 | NAM-420 | NAM-GLB-005 |
| NAM-112 | NAM-VAR-004 | NAM-220 | NAM-POU-003 | NAM-430 | NAM-GLB-006 |
| | | NAM-230 | NAM-POU-004 | NAM-440 | NAM-GLB-007 |
| | | NAM-231 | NAM-POU-005 | NAM-500 | NAM-HWI-001 |
| | | NAM-240 | NAM-POU-006 | NAM-510 | NAM-HWI-002 |
| | | NAM-250 | NAM-POU-007 | NAM-511 | NAM-HWI-003 |
| | | NAM-260 | NAM-POU-008 | NAM-512 | NAM-HWI-004 |
| | | NAM-300 | NAM-TYP-001 | NAM-520 | NAM-HWI-005 |
| | | NAM-310 | NAM-TYP-002 | | |

## Consequences
- IDs are self-describing: `NAM-VAR-002` is clearly a variable-naming rule.
- New subcategories can be added without planning number ranges.
