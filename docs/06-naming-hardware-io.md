# 06 – Naming: hardware modules and I/O

> **Draft – needs review.** Hardware naming depends heavily on how the
> electrical drawings are structured. Adjust NAM-HWI-001 to your designation
> standard (e.g. IEC 81346).

| Element | Style | Example |
|---|---|---|
| Hardware module / terminal / device | `<Designation>_<Type>` | `A12_EL1008`, `KF3_EK1100` |
| Fieldbus device (drive, robot, IO-Link master) | `<Designation>_<Function>` | `U21_ConveyorDrive`, `A30_KukaRobot` |
| Digital input | `di` + name | `diPartPresent` |
| Digital output | `do` + name | `doConveyorRun` |
| Analog input | `ai` + name | `aiTankLevel` |
| Analog output | `ao` + name | `aoValvePosition` |
| Fieldbus process data structure | `io` + name | `ioRobotIn`, `ioRobotOut` |

---

### NAM-HWI-001 – Hardware modules use the electrical designation
- **Level:** Rule
- **Applies to:** couplers, I/O modules, terminals, drives, fieldbus devices
- **Status:** Draft

The hardware name starts with the device designation from the electrical
drawings, followed by an underscore and the module type or function.

| Correct | Incorrect |
|---|---|
| `A12_EL1008`, `U21_ConveyorDrive` | `Term 3 (EL1008)`, `Box 1`, `PN_IO_1` |

**Rationale:** Service personnel can match the project tree directly to the
cabinet and the drawings.

### NAM-HWI-002 – Physical I/O variables use `di`, `do`, `ai`, `ao`
- **Level:** Rule
- **Applies to:** variables mapped directly to physical I/O
  (`AT %I*`, `AT %Q*`, TIA I/O tags, Sysmac device variables)
- **Status:** Draft

The prefix shows the **signal class and direction**, not the data type.
The name describes the signal from the process point of view.

| Correct | Incorrect |
|---|---|
| `diConveyorPartPresent`, `doConveyorRun`, `aiTankLevel` | `bInput3`, `I_1_0`, `xSensor`, `conveyorPartPresent` |

**Rationale:** Raw I/O is the boundary between software and the plant.
Marking it prevents logic from being written directly against hardware
signals, and makes forcing/simulation points easy to find.

### NAM-HWI-003 – Physical I/O is declared in one place
- **Level:** Recommendation
- **Applies to:** I/O mapping
- **Status:** Draft

Declare physical I/O in a dedicated list (`gvlIo` in TwinCAT/CODESYS, tag
table `Io<Area>` in TIA) or in the I/O-handling FB of the equipment it
belongs to. Add the electrical designation in the comment:

```iecst
diConveyorPartPresent AT %I* : BOOL; // B101 – part sensor conveyor infeed
```

### NAM-HWI-004 – Active-low signals are named after the active state
- **Level:** Recommendation
- **Applies to:** inverted / NC signals
- **Status:** Draft

Name the signal after what it means when TRUE. For normally closed contacts
use a name that is TRUE in the healthy state: `diEmergencyStopOk`,
`diDoorClosed`.

### NAM-HWI-005 – Fieldbus process data use the prefix `io`
- **Level:** Recommendation
- **Applies to:** structured process images of robots, drives, gateways
- **Status:** Draft

`ioRobotIn : typeKukaRobotIn;` / `ioRobotOut : typeKukaRobotOut;`
