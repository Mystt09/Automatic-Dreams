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

# Color Sensor

There are sensors on the robot that will detect what color is on the ground, and display the corresponding color in the output. The code will also read what color was detected. 

# Ultrasonic sensor

Ultrasonic sensors can detect how far an object ahead is from the car and stop it.

# Gyro sensor

The sensor should be able to detect when the bot reaches an 90 degree angle. (coded as 80 degrees for the delay) 
Once the sensor reads what the angle is, the bot will stop when that angle is reached 

The gyro sensor still needs some testing and work. At this moment, it will not display the current angle in the output, nor will it stop when it reaches 90 degrees. 


