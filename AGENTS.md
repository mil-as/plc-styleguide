# AGENTS.md – Instructions for AI agents

This repository **is** a PLC programming style guide. It is the single source of
truth for naming and coding rules used in IEC 61131-3 projects
(TwinCAT 3 first; also TIA Portal, Omron Sysmac, CODESYS).

There are two ways you may be working with it. Identify which applies.

---

## A. You are editing the style guide (this repository)

### Hard requirements
1. **English only** – rules, examples, identifiers and comments.
2. **Vendor neutral.** Write rules that apply to all four platforms. When a
   platform needs special handling, add a short *Platform notes* section to
   the rule instead of a separate rule.
3. **No IDE topics.** Do not add rules about fonts, colors, editor options,
   debugger settings or other tool-UI settings.
4. **No Hungarian notation.** Never introduce prefixes that encode the data
   type (`b`, `n`, `f`, `s`, `w`, `x`, `i`, `r`, ...). Prefixes describe the
   element kind or scope only (see `rules/naming.yaml`).
5. **Do not copy text** from the Siemens or Beckhoff style guides or other
   third-party documents. Use them only as inspiration; write rules in your
   own words. The Siemens guide may not be redistributed, so never add it to
   this repo.
6. **Keep `docs/` and `rules/naming.yaml` in sync.** Any change to a naming
   rule in Markdown must be reflected in the YAML, and vice versa.
7. **Rule IDs are permanent.** Never renumber or reuse an ID. A removed rule
   stays in place marked `Status: Withdrawn`.
8. **Record decisions.** A rule that changes behaviour gets a short note in
   `decisions/` (next free number, `NNNN-short-title.md`).

### Rule IDs, titles and layout
The full conventions are in
[docs/00-principles.md → How rules are written](docs/00-principles.md#how-rules-are-written).
Read that section before adding or changing a rule. Summary:

- ID pattern `^[A-Z]{3}-[A-Z]{3}-[0-9]{3}$` = category, subcategory, number
  (e.g. `NAM-POU-002`). The subcategory decides the file (see the table in
  docs/00-principles.md).
- New rule: next free number in its subcategory; every subcategory starts at
  `001`. Never renumber or reuse an ID. New subcategory: add it to the table
  first. Category `PRJ` is reserved for project-specific rules and never used
  in this repo.
- Title: short present-tense statement, sentence case, no period, about 60
  characters at most, identifiers in backticks.
- Layout: heading `### <ID> – <Title>`, then `Level`, `Applies to`, `Status`,
  description, Correct/Incorrect table, `Rationale`, optional
  `Platform notes`.
- Naming rules get a matching entry with the same `id` in `rules/naming.yaml`.

---

## B. You are writing or reviewing PLC code in another repository

1. The guide is not stored in your repository. Read it from GitHub,
   branch `main`:
   `https://raw.githubusercontent.com/mil-as/plc-styleguide/main/<path>`.
   Start with `README.md` (quick reference), then `rules/naming.yaml` (exact
   patterns) and the `docs/` file for the element you are naming. Do not
   look for a local copy (such as `styleguide/`) and do not copy the guide
   into the project.
2. Apply the rules to every new or changed identifier. Do not rename existing
   identifiers outside the scope of your task unless asked.
3. When reporting a violation, cite the rule ID, e.g.
   `NAM-VAR-002: local temporary variable "i" should be "tempIndex"`.
4. If the target project has its own rules that conflict, the project's rules
   win. Mention the conflict.
5. If a situation is not covered, follow the closest existing rule and say
   that the guide does not cover it.

### Cheat sheet
- Casing: identifiers are `lowerCamelCase`; prefixes are lowercase and the
  name after the prefix starts with a capital: `fbMotorController`.
- Constants and enum values: `UPPER_SNAKE_CASE`.
- Methods and properties: `PascalCase`, no prefix (`Reset()`, `IsReady`).
- FB types `fb`, functions `fc`, programs `prg`, interfaces `itf`,
  structures `type`, enumerations `enum`, unions `union`, aliases `alias`.
- TwinCAT's default `MAIN` becomes `prgMain` in new projects. In existing
  projects, keep `MAIN` unless asked to rename it (NAM-POU-004).
- Every FB instance `inst` (including timers/triggers: `instStartDelay`).
- Inputs, outputs and in-outs: no prefix.
- Standard FB status parameters (NAM-VAR-011): `execute`, `enable`, `reset`,
  `done`, `valid`, `busy`, `active`, `commandAborted`, `error`, `errorId`,
  `warning`, `warningId`, `status`. Never `bError`, `nErrorId`, `ErrorID`.
- `VAR_TEMP` → `temp`, internal `VAR` in FBs → `stat`, statics read/written by
  HMI/SCADA → `ext`.
- Booleans that describe a state start with `is`, `has`, `can`
  (`isRunning`, `hasError`).
- Arrays use plural nouns (`motors`, `instMotors`).
- Pointers `ptr`, references `ref`.
