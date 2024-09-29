a=tf([1],[1 2])
b=tf([1],[1 1 1])
c=tf([1],[1 1 0 1])
subplot(3,1,1)
step(a)
hold on 
impulse(a)
subplot(3,1,2)
step(b)
hold on 
impulse(b)
subplot(3,1,3)
step(c)
hold on 
impulse(c)