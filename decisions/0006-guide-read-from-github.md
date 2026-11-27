# 0006 – PLC projects read the guide from GitHub

- **Date:** 2026-11-27
- **Status:** Accepted (draft guide)

## Context
The README offered two ways to use the guide in a PLC project: a link to
GitHub or a git submodule at `styleguide/`. Instructions written for one
setup were used with the other, and an agent looked for
`styleguide/rules/naming.yaml`, which did not exist.

## Decision
- There is one supported way: PLC projects read the guide from GitHub,
  branch `main`, using the raw file URLs.
- No submodule and no copy of the guide in PLC projects.
- The README contains the `AGENTS.md` template for PLC projects; AGENTS.md
  section B gives the same instructions.
- A delivered project that needs fixed rules replaces `main` with a release
  tag or commit hash in its URL.

## Consequences
- One copy of the guide; rule changes reach all projects immediately.
- Agents need web access to GitHub when they work on PLC code.
- While the guide is a draft, a rule change can affect ongoing projects.
