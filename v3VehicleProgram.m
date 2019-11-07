reading = brick.TouchPressed('3');
%brick.SetColorMode(2, 2);
color = brick.ColorCode(2);
distanceLeft = 0;
distanceRight = 0;
counter2 = 0;

while counter2 < 5000
    counter = 0;
    
    while counter < 82
        brick.MoveMotor('A', -80);
        brick.MoveMotor('D', -80);
        reading = brick.TouchPressed('3');
        color = brick.ColorCode(2);
        distanceLeft = brick.UltrasonicDist(1);
        
        if reading == 1
            brick.StopMotor('A');
            brick.StopMotor('D');
            brick.MoveMotorAngleRel('A', 20, 235, 'Brake');
            brick.MoveMotorAngleRel('D', 20, 235, 'Brake');
            distanceLeft = brick.UltrasonicDist(1);
            counter = 82;
            
            if distanceLeft > 25
                brick.MoveMotorAngleRel('A', 25, -310, 'Brake'); %This will turn the vehicle to the left
                brick.MoveMotorAngleRel('D', 25, 310, 'Brake');
            end
            if distanceLeft < 25
                brick.MoveMotorAngleRel('A', 25, -620, 'Brake'); %This will turn the vehicle backwards to scan right
                brick.MoveMotorAngleRel('D', 25, 620, 'Brake');
                distanceRight = brick.UltrasonicDist(1);
                
                if distanceRight > 25
                    brick.MoveMotorAngleRel('A', 25, 90, 'Brake'); %Figure out angles to turn right
                    brick.MoveMotorAngleRel('D', 25, 90, 'Brake');
                end
            end
        end
        
        if distanceLeft > 10 %Figure out this value later
            counterTurn = 0;
            while counterTurn < 25
                brick.MoveMotor('A', -80);
                brick.MoveMotor('D', -80);
                counterTurn = counterTurn + 1;
            end
            pause(.15); %figure out later
            brick.StopMotor('A');
            brick.StopMotor('D');
            brick.MoveMotorAngleRel('A', 25, -310, 'Brake'); %This is the turn left code. 90 degree turns are handled with 310 and -310
            brick.MoveMotorAngleRel('D', 25, 310, 'Brake');
            pause(1.75);
            counterTurn = 0;
            while counterTurn < 81
                brick.MoveMotor('A', -80);
                brick.MoveMotor('D', -80);
                countetTurn = counterTurn + 1;
            end
        end
            
        
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
        counter = counter + 1;
    end
 counter2 = counter2 + 1;           
            
            
            
end

brick.StopMotor('A');
brick.StopMotor('D');