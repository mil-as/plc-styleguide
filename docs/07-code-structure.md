# 07 – Code structure

> **Stub.** Rules to be written. Subcategories (e.g. `STR-DES`, `STR-SEQ`) and IDs
> are assigned when the rules are written. Candidate topics:

- Structure the program into equipment modules (one FB per machine part)
- Exchange data through block interfaces, not global variables, in reusable FBs
- Write outputs once per call, at the end of the block
- Do not read your own outputs; use a `stat`/`temp` variable
- Every `CASE` has an `ELSE` branch
- State machines use an enumeration (`enumXxxState`)
- Initialize temporary variables before use
- Arrays start at index 0 and end at a named constant
- No commented-out code in released projects
- Compare REAL/LREAL values with tolerances, not `=`
- Asynchronous FBs follow PLCopen `enable`/`execute` behaviour
- Status / error codes use defined ranges and named constants
