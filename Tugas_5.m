s = tf('s');

T = 1;

num = [1];
den = [T T/16 1];

sys = tf(num, den);

Kp = 1;
Kd = [1, 3, 5, 7, 9];

figure
for i=1:length(Kd)
    sys_c{i} = tf([Kd(i), Kp], [1]);
    final{i} = feedback(sys*sys_c{i}, 1);

    stepinfo(final{i})
    
    hold all
    step(final{i}, 25)
end
legend('Kd=1','Kd=3', 'Kd=5', 'Kd=7', 'Kd=9');

figure
for i=1:length(Kd)
    hold all
    step(final{i}/s, 25)
end
legend('Kd=1','Kd=3', 'Kd=5', 'Kd=7', 'Kd=9');

figure
for i=1:length(Kd)
    hold all
    impulse(final{i}, 10)
end
legend('Kd=1','Kd=3', 'Kd=5', 'Kd=7', 'Kd=9');