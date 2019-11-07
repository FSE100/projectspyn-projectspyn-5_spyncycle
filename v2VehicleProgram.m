brick.SetColorMode(2, 2)

color = brick.ColorCode(2);

while 1==1
   state = 0;
   distanceLeft = 0;
   distanceForward = 0;
   distanceRight = 0;
   distance = brick.UltrasonicDist(1);
   color = brick.ColorCode(2);
   fCounter = 0;
   passenger = 0;
   
   while state == 0 && fCounter < 5 %This will be the moving forward state
       brick.MoveMotorAngleRel('A', 80, -300, 'Brake');
       brick.MoveMotorAngleRel('D', 80, -300, 'Brake');
       color = brick.ColorCode(2);
       
       if color == 5
           state = 2;
       end
       fCounter = fCounter + 1;
   end
   
   if state == 1 %This will be the code to stop at a red light
       brick.StopMotor(A, 'Brake');
       brick.StopMotor(D, 'Brake');
       pause(4);
       brick.MoveMotorAngleRel('A', 80, 600, 'Brake'); %Edit so it will move to the center of the next 2ft^2 square.
       brick.MoveMotorAngleRel('A', 80, 600, 'Brake');
       state = 0;
   end
   
   color = brick.ColorCode(2);
   
   if color == 4 %Yellow area is our pick up
       if passenger == 0
           %have it pick it up
           %set passenger to 1
       end
       if passenger == 1
           %jhave it move on
       end
   end
   if color == 3 %This is green, which is drop off.
       if passenger == 1
           %have it drop off person
           %set passenger to finishing code
       end
       if passenger == 0
           %have the car move on
       end
   end
   
   distanceForward = brick.UltrasonicDist(1);
   
   brick.MoveMotorAngleRel('A', 25, -310, 'Brake'); %This is the turn left code. 90 degree turns are handled with 310 and -310
   brick.MoveMotorAngleRel('D', 25, 310, 'Brake');
   
   distanceLeft = brick.UltrasonicDist(1);
   
   brick.MoveMotorAngleRel('A', 25, -620, 'Brake'); %This will turn it to the right
   brick.MoveMotorAngleRel('D', 25, 620, 'Brake');
   
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
end
   