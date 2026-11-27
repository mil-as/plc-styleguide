# 0005 – TwinCAT/CODESYS default program `MAIN`

- **Date:** 2026-11-27
- **Status:** Accepted (draft guide)

## Context
TwinCAT and CODESYS create a program called `MAIN` in every new PLC project.
It breaks NAM-POU-004 (`prgMain`). The program name is also the first part
of every ADS/OPC UA symbol path, so renaming it later breaks external clients.

## Decision
- `MAIN` is a tool default name (NAM-GEN-010) and is **not** an allowed
  exception.
- New projects: rename `MAIN` to `prgMain` at the start, before any HMI or
  other client uses its symbol paths.
- Existing or deployed projects: keep `MAIN` unless the rename is planned
  together with all clients. Mark it with a deviation comment citing
  NAM-POU-004 (GEN-PRI-003).

## Consequences
- New projects are fully consistent.
- Existing projects are not broken by an automatic rename; agents do not
  rename `MAIN` unless asked.
