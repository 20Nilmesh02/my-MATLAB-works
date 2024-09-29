M = 0.5;
m = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;

p = I*(M+m)+M*m*l^2; %denominator for the A and B matrices

A = [0      1              0           0;
     0 -(I+m*l^2)*b/p  (m^2*g*l^2)/p   0;
     0      0              0           1;
     0 -(m*l*b)/p       m*g*l*(M+m)/p  0];
B = [     0;
     (I+m*l^2)/p;
          0;
        m*l/p];
C = [1 0 0 0;
     0 0 1 0];
D = [0;
     0];

states = {'x' 'x_dot' 'phi' 'phi_dot'};
inputs = {'u'};
outputs = {'x'; 'phi'};

sys_ss = ss(A,B,C,D,'statename',states,'inputname',inputs,'outputname',outputs);

sys_tf = 


%%

M = 0.5;
m = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;
q = (M+m)*(I+m*l^2)-(m*l)^2;
s = tf('s');   % create a transfer function object in the variable s
P_pend = (m*l*s/q)/(s^3 + (b*(I + m*l^2))*s^2/q - ((M + m)*m*g*l)*s/q - b*m*g*l/q);

%% First set of gains
Kp = 1;
Ki = 1;
Kd = 1;
C = pid(Kp,Ki,Kd);   %defines a PID controller
T = feedback(P_pend,C);  %closed loop TF
t=0:0.01:10;    % time vector to visualize variables
impulse(T,t)  % generates output by giving impulse input to the s/l
title({' Pendulum Position ';' first set'});

h = findobj(gcf, 'Type', 'line');  
set(h, 'LineWidth', 1.5) 

%%

Kp = 100;   
Ki =1; 
Kd =20; 
t=0:0.01:10; % time vector to visualize variables

C = pid(Kp,Ki,Kd); %defines a PID controller
T = feedback(P_pend,C); %closed loop TF

impulse(T,t) % generates output by giving impulse input to the s/l
axis([0, 2.5, -0.2, 0.2]);
title({'Pendulum Position ';' second set'});

h = findobj(gcf, 'Type', 'line');  
set(h, 'LineWidth', 1.5) 
%%
Kp = 
Ki = 
Kd = 
C = pid(Kp,Ki,Kd);
T = feedback(P_pend,C);
t=0:0.01:10;
impulse(T,t)
axis([0, 2.5, -0.2, 0.2]);
title({'Pendulum Position';' Third set'});

h = findobj(gcf, 'Type', 'line');  
set(h, 'LineWidth', 1.5) 