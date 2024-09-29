clear all;
clc;
num = 1;
denom = [1 3 1];
Gp = tf(num,denom);
H = 1;
M = feedback(Gp,H);
step(M)  
grid on
hold on

Kp = 5;
Ki = 0;
Kd = 0;

Gc = pid(Kp,Ki,Kd);  % Generate control output for given PID gains
Mc = feedback(Gc* Gp, H); %closed loop tf
step(Mc)  % generate o/p by giving step as i/p
grid on

h = findobj(gcf, 'Type', 'line');  
set(h, 'LineWidth', 1.5)  

% 2418 