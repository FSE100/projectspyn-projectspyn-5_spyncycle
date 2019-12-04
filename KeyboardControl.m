global key
InitKeyboard();
color = 0;
distance = 0;



while 1 == 1
    pause(0.05);
    brick.StopMotor('A');
    brick.StopMotor('D');
    brick.StopMotor('C');
    pressed = brick.TouchPressed(3);
    
    
    switch key
        case 'uparrow'
            brick.MoveMotor('A', 80);
            brick.MoveMotor('D', 80);
        case 'downarrow'
            brick.MoveMotor('A', -80);
            brick.MoveMotor('D', -80);
        case 'leftarrow'
            brick.MoveMotor('A', 80);
            brick.MoveMotor('D', -80);
        case 'rightarrow'
            brick.MoveMotor('A', -80);
            brick.MoveMotor('D', 80);
        case '0'
            brick.MoveMotor('C', -10);
        case '1'
            brick.MoveMotor('C', 10);
        case 'b'
            brick.beep();
        case 'q'
            break;
        case 's'
            display("Color: " + color);
            display("Distance: " + distance);
            display("Touch: " + pressed);
    end
end
CloseKeyboard();
