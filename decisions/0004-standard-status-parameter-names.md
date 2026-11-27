# 0004 – Standard names for FB status parameters

- **Date:** 2026-11-27
- **Status:** Accepted (draft guide)

## Context
NAM-GEN-003 forbids Hungarian names such as `bError` and `bBusy`, but the
guide did not say what to use instead. NAM-POU-008 listed some PLCopen names
as a recommendation only, without `errorId`, `active` or warnings.

## Decision
- New rule NAM-VAR-011 lists the standard status parameter names:
  `execute`, `enable`, `reset`, `done`, `valid`, `busy`, `active`,
  `commandAborted`, `error`, `errorId`, `warning`, `warningId`, `status`.
- Names follow PLCopen meanings but use this guide's casing: `errorId`,
  not `ErrorID` (NAM-GEN-007).
- `warning`/`warningId` are not PLCopen; they are added because many blocks
  need to report a non-blocking condition.
- `status` is a diagnostic state, not the error code; error codes go in
  `errorId`. The example `fbMotorController` was changed accordingly.

## Consequences
- Every FB written to the guide has a predictable interface.
- Vendor FBs keep their own names (`ErrorID`, `Status`); the rule applies
  only to blocks written in the project.
