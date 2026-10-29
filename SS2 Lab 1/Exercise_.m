% definition of the system parameters
R = 10; % resistance
C = 0.01; % capacitance
L = 0.100; % inductance
tau = R*C; % constant 1
wr = 1/sqrt(L*C); % constant 2

% declaration of the continuous-time systems
A1 = -1/tau;
b1 = 1;
c1 = 1/tau;
d1 = 0;
sys1 = ss(A1,b1,c1,d1); % RC low-pass filter
A2 = [0 -wr^2; 1 -tau*wr^2];
b2 = [1; 0];
c2 = [0 wr^2];
d2 = 0;
sys2 = ss(A2,b2,c2,d2); % RLC resonant circuit


% impulse and step responses of both systems
figure();
subplot(221); % upper left plot in a 2x2 plot matrix
impulse(sys1,'r'); % determine and plot impulse response
title('RC low-pass impulse response')
subplot(222); % upper right plot in a 2x2 plot matrix
impulse(sys2,'r'); % determine and plot impulse response
title('RLC res. circ. impulse response')
subplot(223); % lower left plot in a 2x2 plot matrix
step(sys1,'r'); % determine and plot step response
title('RC low-pass step response')
subplot(224); % lower right plot in a 2x2 plot matrix
step(sys2,'r'); % determine and plot step response
title('RLC res. circ. step response')