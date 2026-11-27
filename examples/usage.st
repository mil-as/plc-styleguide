// Example: calling FB instances from a program (TwinCAT 3 / CODESYS ST)

PROGRAM prgConveyorLine
VAR
    instMotorA      : fbMotorController;
    instMotorB      : fbMotorController;
    instPumps       : ARRAY[0..MAX_PUMPS] OF fbPumpController;  // plural (NAM-GEN-008)
END_VAR
VAR_TEMP
    tempIndex       : DINT;
END_VAR
VAR CONSTANT
    MAX_PUMPS       : DINT := 3;
END_VAR

instMotorA(
    enable        := gvlMachine.isAutoMode AND gvlIo.diConveyorPartPresent,
    speedSetpoint := gvlHmi.conveyorSpeed,
    drive         := gvlIo.ioDriveA);

instMotorB(
    enable        := instMotorA.valid,
    speedSetpoint := gvlHmi.conveyorSpeed,
    drive         := gvlIo.ioDriveB);

gvlIo.doConveyorLampRun := instMotorA.busy;

FOR tempIndex := 0 TO MAX_PUMPS DO
    instPumps[tempIndex](enable := gvlMachine.isAutoMode);
END_FOR
END_PROGRAM
