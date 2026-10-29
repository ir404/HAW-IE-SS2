clear(); clc();


dT  = 0.0025;                           % small time step for the quasi continuous-time signal
t   = 0:dT:1;                           % time vector
x   = 4*sin(2*pi*t)+cos(pi/4+16*pi*t);  % signal vector

% figure()
% plot(t,x,'b','Linewidth',2);
% title('signal'); xlabel('time t'); ylabel('signal x(t)');

m = 24;                                 % every m-th value will be sampled (max allowed is 24)
T_s = m*dT;                             % sampling period 
t_n = downsample(t,m);                  % time vector for the samples
x_n = downsample(x,m);                  % downsampled signal
figure()
plot(t,x,'b',t_n,x_n,'b*','Linewidth',2);          
title('signal with samples'); xlabel('time t'); ylabel('signal x(t)');

% --- part d ----
figure(); hold on; box on; 
x_sum = 0*t;                                % initialize summand vector
for k = 1:length(x_n)                       % looping over all samples, note: x(k=1) represents sample x[0] from the lecture
                                            % (indices must be positive integers in MATLAB)
    s = x_n(k)*sinc((t-(k-1)*T_s)/T_s);     % summand for sample x_n(k)
    plot(t,s,'g','HandleVisibility','off'); % plot individual summands, suppressing legend entry
    x_sum = x_sum+s;                        % summing of summands
end
plot(t_n,x_n,'b*',t,x_sum,'r',t,x,'b','Linewidth',2);
title('samples, summands, reconstructed and original signal');
legend('samples','reconstruction','original signal')
xlabel('time t'); ylabel('signal');
hold off;
