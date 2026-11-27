# 00 – Principles

## Purpose
This guide makes PLC code consistent, readable and maintainable across
projects, programmers and platforms. It is written so that both people and AI
agents can apply it without interpretation.

## How rules are written

This section explains how every rule in this guide is identified, titled and
laid out. It applies to humans and AI agents alike: follow it when you read,
cite, add or change a rule.

### Rule levels
- **Rule** – must be followed. A deviation must be justified in a comment at
  the place where it occurs, citing the rule ID (see *Citing rules* below).
- **Recommendation** – should be followed. Deviations are acceptable when they
  clearly improve readability or performance; no comment is required.

### Rule IDs
Every rule has a unique, permanent ID made of three parts:

```
NAM-POU-001
│   │   └── number: three digits, zero-padded, starting at 001 in each subcategory
│   └────── subcategory: three capital letters
└────────── category: three capital letters
```

Pattern: `^[A-Z]{3}-[A-Z]{3}-[0-9]{3}$`

The **category** says what kind of rule it is. The **subcategory** says which
topic, and therefore which file, the rule belongs to. Numbers have no fixed
ranges: each subcategory simply counts `001`, `002`, `003`, …

| Category | Subcategory | Topic | File |
|---|---|---|---|
| `GEN` | `PRI` | General principles | [00-principles.md](00-principles.md) |
| `NAM` | `GEN` | Naming – general (casing, characters, abbreviations) | [01-naming-general.md](01-naming-general.md) |
| `NAM` | `VAR` | Naming – variables, parameters, instances, constants | [02-naming-variables.md](02-naming-variables.md) |
| `NAM` | `POU` | Naming – function blocks, functions, programs, methods, interfaces | [03-naming-pous.md](03-naming-pous.md) |
| `NAM` | `TYP` | Naming – data types | [04-naming-data-types.md](04-naming-data-types.md) |
| `NAM` | `GLB` | Naming – global data, libraries, tasks | [05-naming-global-data.md](05-naming-global-data.md) |
| `NAM` | `HWI` | Naming – hardware and I/O | [06-naming-hardware-io.md](06-naming-hardware-io.md) |
| `STR` | *to be defined* | Code structure | [07-code-structure.md](07-code-structure.md) |
| `DOC` | *to be defined* | Comments and documentation | [08-comments.md](08-comments.md) |
| `PRJ` | *free* | Project-specific rules (never used in this repository) | the project's own documentation |

Examples: `NAM-VAR-003` is the third rule about naming variables;
`NAM-POU-002` is the second rule about naming POUs.

**Project-specific rules.** A project or company that adds its own rules on top
of this guide uses the category `PRJ` with its own subcategories, for example
`PRJ-HMI-001`. This guarantees they never collide with rules in this guide.

### Adding a subcategory
When a topic does not fit an existing subcategory:
1. Choose a three-letter code that is easy to recognise (`SFC`, `ALM`, `MOT`).
2. Add it to the table above, with its topic and file.
3. Start numbering at `001`.

A subcategory is never renamed or reused once it has rules.

### Numbering a new rule
1. Choose the subcategory where the rule belongs.
2. Give the rule the next free number in that subcategory (after
   `NAM-VAR-010` comes `NAM-VAR-011`), even if a lower number was withdrawn.
3. Add the rule at the end of its file section, so rules appear in ascending
   order. Related rules are kept together by the headings in the file, not by
   their numbers.
4. **IDs are permanent.** An ID is never renumbered, moved or reused, even if
   the rule is withdrawn. Gaps left by withdrawn rules are normal.

### Rule titles
A title is a short statement of what correct code looks like:

- Written as a plain statement in present tense, sentence case, with no
  period at the end: *"Function block types use the prefix `fb`"*.
- Describes what to do. A prohibition may use the short form *"No …"* when
  that is clearer: *"No Hungarian notation"*.
- Names the element it applies to first, then the requirement.
- At most about 60 characters.
- Identifiers, prefixes and keywords are written in backticks: `` `fb` ``,
  `` `VAR_TEMP` ``.
- The title alone must be enough to understand the rule in a review comment
  or a checklist.

| Good title | Poor title | Why |
|---|---|---|
| Function block types use the prefix `fb` | FB naming | Does not say what the rule requires |
| Temporary variables use the prefix `temp` | You should use temp for temps. | Not a statement; vague; ends with a period |
| No magic numbers | Avoid using numbers that are not 0 or 1 directly in code | Too long |

### Rule status
| Status | Meaning |
|---|---|
| `Draft` | Proposed; may still change. Apply it, but expect changes. |
| `Active` | Agreed and stable. |
| `Withdrawn` | No longer applies. The rule stays in the file so the ID is not reused; add one line saying why and, if relevant, which rule replaces it. |

### Rule layout
Every rule uses exactly this layout, so that people can scan it and tools can
parse it:

````markdown
### ABC-XYZ-000 – Function block types use the prefix `fb`
- **Level:** Rule
- **Applies to:** `FUNCTION_BLOCK`
- **Status:** Draft

One or two sentences stating the rule precisely.

| Correct | Incorrect |
|---|---|
| `fbMotorController` | `FB_Motor`, `MotorFB` |

**Rationale:** Why the rule exists.

**Platform notes:** Only when TwinCAT, TIA Portal, Sysmac or CODESYS differ.
````

| Part | Required | Content |
|---|---|---|
| Heading | yes | `###`, the ID, an en dash (`–`), the title (the example uses the dummy ID `ABC-XYZ-000`) |
| Level | yes | `Rule` or `Recommendation` |
| Applies to | yes | The element kinds the rule covers |
| Status | yes | `Draft`, `Active` or `Withdrawn` |
| Description | yes | One or two sentences |
| Correct / Incorrect table | for naming rules | At least one example of each |
| Rationale | yes for `Rule` | Why the rule exists |
| Platform notes | optional | Platform differences |

Naming rules also have an entry with the same ID in
[rules/naming.yaml](../rules/naming.yaml). The Markdown and the YAML must
always agree.

### Citing rules
Refer to a rule by its ID, optionally followed by its title:

- In code review or AI output: `NAM-VAR-002: "i" should be "tempIndex"`
- In code, for a justified deviation from a `Rule`:
  ```iecst
  // Deviation NAM-VAR-006: name required by the customer's HMI interface
  ```
- In commit messages and decision records: `Add NAM-VAR-011 (...)`,
  `Withdraw NAM-HWI-004`.

---

### GEN-PRI-001 – Everything is written in English
- **Level:** Rule
- **Applies to:** identifiers, comments, messages, documentation
- **Status:** Draft

All identifiers, comments and documentation are written in English
(US spelling).

| Correct | Incorrect |
|---|---|
| `isDoorClosed` | `erDoerLukket` |

**Rationale:** Projects are shared across countries, suppliers and AI tools.

### GEN-PRI-002 – Project rules take precedence
- **Level:** Rule
- **Applies to:** all
- **Status:** Draft

Customer, industry or safety standards required by a project override this
guide. Document the deviation in the project's README or AGENTS.md.

### GEN-PRI-003 – Existing projects keep one consistent style
- **Level:** Recommendation
- **Applies to:** all
- **Status:** Draft

In an existing project with a different convention, keep that project's
convention inside the code you touch rather than mixing two styles in one
POU. Apply this guide fully to new projects and libraries.

### GEN-PRI-004 – Code uses IEC 61131-3 standard types and functions
- **Level:** Recommendation
- **Applies to:** design
- **Status:** Draft

Prefer IEC 61131-3 standard data types and functions over vendor-specific
ones, so that code and naming can be transferred between platforms.
