disp('YEET');

counter = 0;

while brick.TouchPressed(1) ==1
    counter = counter + 1;
    pause(1);
end

counter2 = 0;

while counter2 < 4
    brick.playTone(400, 700, 100);
    pause(counter); 
    brick.playTone(100, 300, 900);
    pause(counter);
    brick.playTone(100, 200, 500);
    pause(counter);
    counter2 = counter2 + 1;
end
