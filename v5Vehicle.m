pressed = 0;
distanceLeft = 0;
distanceRight = 0;
counter2 = 0;
color = 0;

while 1 > 0
    distanceLeft = brick.UltrasonicDist(1);
    counter = 0;
    pressed = brick.TouchPressed(3);
    
    if distanceLeft <= 26
        while counter < 190 %This moves forward one space.
            brick.MoveMotor('AD', -60);
            
            counter = counter +1;
        end
        brick.StopAllMotors;
    end
    
    if distanceLeft > 26
        brick.StopAllMotors;
        pause(0.75);
        brick.MoveMotorAngleRel('A', 80, -310, 'Brake'); %This is the turn left code. 90 degree turns are handled with 310 and -310
        brick.MoveMotorAngleRel('D', 80, 310, 'Brake');
        counter = 0;
       while counter < 380 %This moves forward one space.
            brick.MoveMotor('AD', -30);
           
            counter = counter +1;
       end
        brick.StopAllMotors;
    end
        
 end