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
        while counter < 90 %This moves forward one space.
            brick.MoveMotor('A', -60);
            brick.MoveMotor('D', -60);
            counter = counter +1;
            pressed = brick.TouchPressed(3);
            
            if pressed == 1
                counter = 92;
            end
            
            %if color == 5
              %  brick.StopAllMotors;
               % pause(4);
               % counter = 70;
          %  end
        end
        brick.StopMotor('AD');
    end
    
    
    if distanceLeft > 26
        brick.StopAllMotors('Coast');
        brick.MoveMotorAngleRel('A', 80, -310, 'Brake'); %This is the turn left code. 90 degree turns are handled with 310 and -310
        brick.MoveMotorAngleRel('D', 80, 310, 'Brake');
        pause(5);
        while counter < 90 %This moves forward one space.
            brick.MoveMotor('A', -60);
            brick.MoveMotor('D', -60);
            counter = counter +1;
        end
        brick.StopMotor('AD');
    end
    
    distanceLeft = brick.UltrasonicDist(1);
    pressed = brick.TouchPressed(3);
    
    if pressed == 1
        brick.StopAllMotors;
        brick.MoveMotorAngleRel('A', 80, 340, 'Brake');
        brick.MoveMotorAngleRel('D', 80, 340, 'Brake');
        pause(3);
        brick.MoveMotorAngleRel('A', 100, -650, 'Brake'); %This will turn it 180
        brick.MoveMotorAngleRel('D', 100, 650, 'Brake');
    end
    disp("Dist: " + distanceLeft);
    disp(pressed);
    disp("Color: " + color);
end
brick.StopMotor('AD');
