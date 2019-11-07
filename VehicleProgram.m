brick.SetColorMod(B, 2)

State = 0;



while 1==1
    
   distanceLeft = 0;
   distanceForward = 0;
   distanceRight = 0;
    
    
    distance = brick.UltrasonicDist(1);
    color = brick.ColorCod(2);
    
    brick.MoveMotorAngleRel('A', 25, 90, 'Brake'); %Angle for moving forward 2 ft is -1200
    brick.MoveMotorAngleRel('B', 25, 90, 'Brake');
    
    %Place code for detecting color here
    
    brick.StopAllMotors('Brake');
    
    distanceForward = brick.UltrasonicDist(1);
    
    brick.MoveMotorAngleRel('A', 25, 90, 'Brake'); % This code will face left. 310 and -310 are the values to turn 90 degrees.
    brick.MoveMotorAngleRel('D', 25, 90, 'Brake');
    
    distanceLeft = brick.UltrasonicDist(1);
    
    brick.MoveMotorAngleRel('A', 25, 90, 'Brake'); %Figure out angles later to turn right.
    brick.MoveMotorAngleRel('D', 25, 90, 'Brake');
    
    distanceRight = brick.UltrasonicDist(1);
    
    if (distanceLeft > distanceForward && distanceLeft > distanceRight) %Turn to face left
        brick.MoveMotorAngleRel('A', 25, 90, 'Brake'); %Figure out angles to turn left
        brick.MoveMotorAngleRel('D', 25, 90, 'Brake');
    end
    if (distanceForward > distanceLeft && distanceForward > distanceRight) %Turn to face forward
         brick.MoveMotorAngleRel('A', 25, 90, 'Brake'); %Figure out angles to turn forward
         brick.MoveMotorAngleRel('D', 25, 90, 'Brake');
    end
    if (distanceRight > distanceLeft && distanceRight > distanceForward) %Turn to face right
        brick.MoveMotorAngleRel('A', 25, 90, 'Brake'); %Figure out angles to turn right
        brick.MoveMotorAngleRel('D', 25, 90, 'Brake');
    end
    if (distanceRight == distanceLeft && distanceRight == distanceForward && distanceForward == DistanceLeft) %Turn around at dead end
        brick.MoveMotorAngleRel('D', 25, 90, 'Brake'); %Figure out angle to turn around
        brick.MoveMotorAnlgeRel('D', 25, 90, 'Brake');
    end
        
    
    
    
    