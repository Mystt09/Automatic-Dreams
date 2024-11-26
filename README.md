# Automatic-Dreams

Our code will be able to transport the disabled person to its destination with no harm done. We will be implementing controls that will lift the person up and set them down safely. The sensors will be able to detect colors on the ground and any obstacles that are in the way. 

# Materials

* MatLab 
* EV3 bot 
* laptop 

# Process

* The EV3 will be connected to the laptop via bluetooth 
* All appropriate software is installed, Matlab, EV3 Toolbox 

# Controls


W: Move forward
S: Move backward
A: Turn left
D: Turn right

Up Arrow: Lift the forklift up
Down Arrow: Lower the forklift
Q: Stop the program and disconnect the EV3
No key pressed (case 0): Stop the wheels

# Wheels
There are two motors that are directly connected to both wheels. The code allows the robot to be manually controlled using a switch case detecting which key is pressed. The robot is able to turn by rotating one wheel fowards and the other backwards and switches depending on which way it is turning.



# Forklift
There is a motor that has two gears to change the direction of rotation to rotate the fork up and down. The code allows the motor to slowly rotate to a specific angle when a set key is pressed and goes the same for reversing the rotation.

**** Forklift main code ****
---------------------------------------------------------------------------------------
% Initialize Keyboard
InitKeyboard();

% Set starting fork lift angle physically before running
brick.ResetMotorAngle(FORK_LIFT);
lifted = false;

% Function to handle motor movement
function moveMotors(brick, leftPower, rightPower)
    brick.MoveMotor(LEFT_WHEEL, leftPower);
    brick.MoveMotor(RIGHT_WHEEL, rightPower);
end

% Function to handle fork lift movement
function moveForkLift(brick, angle, speed)
    brick.MoveMotorAngleAbs(FORK_LIFT, speed, angle, 'Coast');
    brick.WaitForMotor(FORK_LIFT);
end


# Color Sensor

There are sensors on the robot that will detect what color is on the ground, and display the corresponding color in the output. The code will also read what color was detected. 

**** color sensor main code ****
---------------------------------------------------------------------------------------

% *** COLOR - START *** %

% Sensors
% 4 - Touch Sensor
% 3 - Color Sensor
% 2 - Gyroscope
% 1 - Touch Sensor

% Creating the Color Sensor
brick.SetColorMode(3, 2);

% Outputs for the Color Mode - used to determine the result

% 2 = Blue
% 3 = Green
% 4 = Yellow
% 5 = Red

* Each number will be used in a switch case that will determine what color it is detecting 

# Ultrasonic sensor

Ultrasonic sensors can detect how far an object ahead is from the car and stop it.

set c Ultrasonic sensor 

brick = ConnectBrick('OOO');

SensorPort = 4;  % Ultrasonic sensor is connected to port 4
distanceThreshold = 25;  % Set the distance threshold, e.g., 25 cm

% Initial speed for motors B and C
initialSpeedB = 25;
initialSpeedC = 20;

brick.MoveMotor('B', initialSpeedB);
brick.MoveMotor('C', initialSpeedC);

# Touch Sensor 

*** the touch sensor helps with navigating through the walls 

function handleTouchSensor(brick, TOUCH_SENSOR_PORT, GYRO_SENSOR_PORT, LEFT_WHEEL, RIGHT_WHEEL, STEER_POWER, FORWARD_POWER, MOTOR_POWER_DIFFERENCE)
    touch = brick.TouchPressed(TOUCH_SENSOR_PORT);
    prevAngle = brick.GyroAngle(GYRO_SENSOR_PORT);
    currAngle = 0;

    if touch
        stopMotors(brick, LEFT_WHEEL, RIGHT_WHEEL);
        moveBackward(brick, LEFT_WHEEL, RIGHT_WHEEL, FORWARD_POWER, MOTOR_POWER_DIFFERENCE);
        pause(0.5);
       %brick.MoveMotor()
        %moveBackward(brick, LEFT_WHEEL, RIGHT_WHEEL, FORWARD_POWER, MOTOR_POWER_DIFFERENCE); % move backwards if the touch sensor is pushed, then turn left in the while loop 
       % pause(1);
        while currAngle < 75
            turnLeft(brick, LEFT_WHEEL, RIGHT_WHEEL, STEER_POWER, MOTOR_POWER_DIFFERENCE);
            %pause(0.2);
            currAngle = prevAngle - brick.GyroAngle(GYRO_SENSOR_PORT);
        end
        %brick.GyroCalibrate(GYRO_SENSOR_PORT);
    end
end

# Gyro sensor

The sensor should be able to detect when the bot reaches an 90 degree angle. (coded as 80 degrees for the delay) 
Once the sensor reads what the angle is, the bot will stop when that angle is reached 

The gyro sensor still needs some testing and work. At this moment, it will not display the current angle in the output, nor will it stop when it reaches 90 degrees. 

SensorPort = 1; % has to be a number between 1 and 4

brick.GyroCalibrate(SensorPort); % Calibrates the Gyro Sensor.

angle = brick.GyroAngle(1);  % Get the current Gyro angle
display(angle); % Print angle.

angleRate = brick.GyroRate(SensorPort); % Get the current Gyro angle 

if angle == 80

    brick.StopMotor([LEFT_WHEEL, RIGHT_WHEEL], 'Brake');
display(angleRate); % Print angle

% when the bot is going straight, then it should keep going straight
% if there a change in the angle, then recalibrate to go keep going
% straight

% Change in the angle, pos or neg from 0 when going straight 

%if the angle reads 80 degrees, then stop[0m

# Main loop


while true
    pause(0.1);

    % Kill switch
    if key == 'q'
        brick.StopAllMotors();
        DisconnectBrick(brick);
        break;
    end

    moveForward(brick, LEFT_WHEEL, RIGHT_WHEEL, FORWARD_POWER, MOTOR_POWER_DIFFERENCE);
    
    %handleTouchSensor(brick, TOUCH_SENSOR_PORT, GYRO_SENSOR_PORT, LEFT_WHEEL, RIGHT_WHEEL, STEER_POWER, MOTOR_POWER_DIFFERENCE);
    
    %handleColorSensor(brick, COLOR_SENSOR_PORT, BLUE, GREEN, YELLOW, RED, key, LEFT_WHEEL, RIGHT_WHEEL, FORWARD_POWER, MOTOR_POWER_DIFFERENCE, STEER_POWER, FORK_LIFT, LIFT_SPEED, LIFT_MAX_ANGLE, lifted);
    
    handleUltrasonicSensor(brick, ULTRASONIC_SENSOR_PORT, GYRO_SENSOR_PORT, DISTANCE_THRESHOLD, LEFT_WHEEL, RIGHT_WHEEL, FORWARD_POWER, STEER_POWER, MOTOR_POWER_DIFFERENCE);
    
end
CloseKeyboard();
end




