

counter = 0;

while counter < 100
    distance = brick.UltrasonicDist(1);
    display(distance);
    
    if distance < 5
        brick.MoveMotor('A', 100);
    elseif distance < 10;
        brick.MoveMotor('A', 50);
    
        
    elseif distance > 10
        
        brick.StopMotor('A');
    end
       
    
    counter = counter + 1;
end
