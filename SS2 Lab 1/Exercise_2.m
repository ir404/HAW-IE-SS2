clear(); clc();

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
sys1 = ss(A1,b1,c1,d1);         % RC low-pass filter
A2 = [0 -wr^2; 1 -tau*wr^2];
b2 = [1; 0];
c2 = [0 wr^2];
d2 = 0;
sys2 = ss(A2,b2,c2,d2);         % RLC resonant circuit

% d)
% impulse and step responses of both systems
figure();
subplot(221); % upper left plot in a 2x2 plot matrix
impulse(sys1,'r'); % determine and plot impulse response
title('d) RC low-pass impulse response (time-continuous)')
subplot(222); % upper right plot in a 2x2 plot matrix
impulse(sys2,'r'); % determine and plot impulse response
title('d) RLC res. circ. impulse response (time-continuous)')
subplot(223); % lower left plot in a 2x2 plot matrix
step(sys1,'r'); % determine and plot step response
title('d) RC low-pass step response (time-continuous)')
subplot(224); % lower right plot in a 2x2 plot matrix
step(sys2,'r'); % determine and plot step response
title('d) RLC res. circ. step response (time-continuous)')


% f)
% declaration of the discrete-time systems
T_s    = 0.001;                      
a_1    = -tau/(tau+T_s);
b_0    = T_s/(tau+T_s);
A1     = -a_1;
b1     = -a_1*b_0;
c1     = 1;
d1     = b_0;
sys1_d = ss(A1,b1,c1,d1,T_s);

a_1    = -(2+tau*T_s*wr^2)/(1+tau*T_s*wr^2+(T_s*wr)^2);
a_2    = 1/(1+tau*T_s*wr^2+(T_s*wr)^2);
b_0    = (T_s*wr)^2/(1+tau*T_s*wr^2+(T_s*wr)^2);
b_1    = 0;
A2     = [0 -a_2; 1 -a_1];
b2     = [-a_2*b_0; b_1-a_1*b_0];
c2     = [0 1];
d2     = b_0;
sys2_d = ss(A2,b2,c2,d2,T_s);

% g)
% plotting impulse and step responses for both continuous-time and discrete-time for comparison
figure()
subplot(221)
impulse(sys1,'r',sys1_d,'g');
legend('continuous-time','discrete-time (lecture method)')
title("g) RC low-pass impulse response with T_s = " + (T_s*1000) + "ms")
subplot(222)
impulse(sys2,'r',sys2_d,'g');
title("g) RLC res. circ. impulse response with T_s = " + (T_s*1000) + "ms")
subplot(223)
step(sys1,'r',sys1_d,'g');
title("g) RC low-pass step response with T_s = " + (T_s*1000) + "ms")
subplot(224)
step(sys2,'r',sys2_d,'g');
title("g) RLC res. circ. step response with T_s = " + (T_s*1000) + "ms")

% h)
% let MATLAB discretize the systems
sys1_d2 = c2d(sys1,T_s);
sys2_d2 = c2d(sys2,T_s);
% plotting impulse and step responses
figure()
subplot(221)
impulse(sys1,'r',sys1_d,'g',sys1_d2,'b');
legend('continuous-time','discrete-time (lecture method)','discrete-time (MATLAB algo)')
title("h) RC low-pass impulse response with T_s = " + (T_s*1000) + "ms")
subplot(222)
impulse(sys2,'r',sys2_d,'g',sys2_d2,'b');
title("h) RLC res. circ. impulse response with T_s = " + (T_s*1000) + "ms")
subplot(223)
step(sys1,'r',sys1_d,'g',sys1_d2,'b');
title("h) RC low-pass step response with T_s = " + (T_s*1000) + "ms")
subplot(224)
step(sys2,'r',sys2_d,'g',sys2_d2,'b');
title("h) RLC res. circ. step response with T_s = " + (T_s*1000) + "ms")


% i)
% definition of the system parameters
R  = 1;           % resistance
C  = 0.01;        % capacitance
L  = 0.100;       % inductance
tau = R*C;        % constant 1
wr = 1/sqrt(L*C); % constant 2

% declaration of the continuous-time system
A2    = [0 -wr^2; 1 -tau*wr^2];
b2    = [1; 0];
c2    = [0 wr^2];
d2    = 0;
sys2  = ss(A2,b2,c2,d2);

% declaration of the discrete-time system
a_1    = -(2+tau*T_s*wr^2)/(1+tau*T_s*wr^2+(T_s*wr)^2);
a_2    = 1/(1+tau*T_s*wr^2+(T_s*wr)^2);
b_0    = (T_s*wr)^2/(1+tau*T_s*wr^2+(T_s*wr)^2);
b_1    = 0;
A2     = [0 -a_2; 1 -a_1];
b2     = [-a_2*b_0; b_1-a_1*b_0];
c2     = [0 1];
d2     = b_0;
sys2_d = ss(A2,b2,c2,d2,T_s);

% let MATLAB discretize the system
sys2_d2 = c2d(sys2,T_s);

% plotting impulse and step responses
figure()
subplot(211)
impulse(sys2,'r',sys2_d,'g',sys2_d2,'b');
legend('continuous-time','discrete-time (lecture method)','discrete-time (MATLAB algo)')
subplot(212)
step(sys2,'r',sys2_d,'g',sys2_d2,'b');
legend('continuous-time','discrete-time (lecture method)','discrete-time (MATLAB algo)')
