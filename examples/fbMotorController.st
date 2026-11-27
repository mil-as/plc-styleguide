// Example: function block following the style guide (TwinCAT 3 / CODESYS ST)
// Rules shown: NAM-VAR-001..006, NAM-POU-002, NAM-POU-007, NAM-POU-008, NAM-TYP-002

FUNCTION_BLOCK fbMotorController
VAR_INPUT
    enable          : BOOL;     // Enable the motor controller
    speedSetpoint   : LREAL;    // Requested speed [rpm]
    reset           : BOOL;     // Reset error (rising edge)
END_VAR
VAR_OUTPUT
    valid           : BOOL;     // Outputs are valid
    busy            : BOOL;     // Controller is active
    error           : BOOL;     // Error is active
    status          : WORD;     // Status / error code
    speedActual     : LREAL;    // Actual speed [rpm]
END_VAR
VAR_IN_OUT
    drive           : typeDriveInterface;   // Process data of the drive
END_VAR
VAR
    statState       : enumMotorState;       // Internal state machine
    statResetOld    : BOOL;                 // Reset value from last cycle
    instStartDelay  : TON;                  // Delay before start feedback is checked
    extHmiCommand   : typeMotorHmiCommand;  // Written by the HMI
END_VAR
VAR_TEMP
    tempIsResetRise : BOOL;
END_VAR
VAR CONSTANT
    START_DELAY     : TIME  := T#2S;
    MAX_SPEED       : LREAL := 3000.0;
    ERR_NO_FEEDBACK : WORD  := 16#8401;
END_VAR

// ----------------------------------------------------------------------------

tempIsResetRise := reset AND NOT statResetOld;
statResetOld := reset;

instStartDelay(IN := (statState = enumMotorState.STARTING), PT := START_DELAY);

CASE statState OF
    enumMotorState.IDLE:
        IF enable THEN
            statState := enumMotorState.STARTING;
        END_IF

    enumMotorState.STARTING:
        IF drive.isRunning THEN
            statState := enumMotorState.RUNNING;
        ELSIF instStartDelay.Q THEN
            status := ERR_NO_FEEDBACK;
            statState := enumMotorState.ERROR;
        END_IF

    enumMotorState.RUNNING:
        IF NOT enable THEN
            statState := enumMotorState.IDLE;
        END_IF

    enumMotorState.ERROR:
        IF tempIsResetRise THEN
            status := 16#0000;
            statState := enumMotorState.IDLE;
        END_IF

ELSE
    statState := enumMotorState.ERROR;
END_CASE

// Write outputs once, at the end of the block
drive.speedSetpoint := LIMIT(0.0, speedSetpoint, MAX_SPEED);
busy        := (statState = enumMotorState.STARTING) OR (statState = enumMotorState.RUNNING);
valid       := (statState = enumMotorState.RUNNING);
error       := (statState = enumMotorState.ERROR);
speedActual := drive.speedActual;
END_FUNCTION_BLOCK
