global key

% EV3 Connection - this connects to the bot and plays a beep sound
brick = ConnectBrick("OOO");
brick.playTone(100, 800, 500);
voltage = brick.GetBattVoltage();

% Motor ports - this initializes a letter to the corresponding part of the
% vehicle to be used to code the movements 

FORK_LIFT = 'A';
LEFT_WHEEL = 'B';
RIGHT_WHEEL = 'C';

% Motor settings - initializes the speed of the wheels and motion
LIFT_MAX_ANGLE = 10;
LIFT_MIN_ANGLE = 0;
LIFT_SPEED = 1;

FORWARD_POWER = 25;
STEER_POWER = 15;
MOTOR_POWER_DIFFERENCE = 10;

% Keyboard controls 
InitKeyboard();

currentAngle = LIFT_MIN_ANGLE;
brick.MoveMotorAngleAbs(FORK_LIFT, LIFT_SPEED, LIFT_MIN_ANGLE, 'Brake');

% Creating the Color Sensor
brick.SetColorMode(3, 2);

%Getting the color
color_rgb = brick.ColorCode(3);

%Get the Color
color = brick.ColorCode(3);

%display color
disp(color);

while true
    pause(0.1);
    switch key
        % Drive forward
        case 'w'
            brick.MoveMotor(LEFT_WHEEL, FORWARD_POWER + MOTOR_POWER_DIFFERENCE);
            brick.MoveMotor(RIGHT_WHEEL, FORWARD_POWER);
        % Drive backward
        case 's'
            brick.MoveMotor(LEFT_WHEEL, -FORWARD_POWER - MOTOR_POWER_DIFFERENCE);
            brick.MoveMotor(RIGHT_WHEEL, -FORWARD_POWER);
        % Turn left
        case 'a'
            brick.MoveMotor(LEFT_WHEEL, -STEER_POWER - MOTOR_POWER_DIFFERENCE);
            brick.MoveMotor(RIGHT_WHEEL, STEER_POWER);
        % Turn right
        case 'd'
            brick.MoveMotor(LEFT_WHEEL, STEER_POWER + MOTOR_POWER_DIFFERENCE);
            brick.MoveMotor(RIGHT_WHEEL, -STEER_POWER);
        % Stop wheels when no key pressed
        case 0
            brick.StopMotor([LEFT_WHEEL, RIGHT_WHEEL], 'Brake');
        % Lift fork up 
        case 'uparrow'
            brick.MoveMotorAngleAbs(FORK_LIFT, LIFT_SPEED, LIFT_MAX_ANGLE - LIFT_MIN_ANGLE, 'Brake');
            brick.WaitForMotor(FORK_LIFT);
        % Lift fork down
        case 'downarrow'
            brick.MoveMotorAngleAbs(FORK_LIFT, LIFT_SPEED, LIFT_MIN_ANGLE, 'Brake');
            brick.WaitForMotor(FORK_LIFT);
        % Kill switch
        case 'q'
            DisconnectBrick(brick);
            break;
    end
end

CloseKeyboard();