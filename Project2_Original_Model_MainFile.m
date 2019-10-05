% Project II _ Original Model
% This script will provide numerical solutions and plots for the original
% model.
% The function named "RHS_Function" will be used here.
clc
clear all;
close all;

% Time Discretization:
t_0    = 0;
t_end  = 200; 
N_time = 1e4;
t_span = linspace(t_0,t_end,N_time);

% Define initial conditions:
Y_0 = [1; 1; 0];

% Implement ode solver:
[t,Y_Solution] = ode45(@RHS_Function,t_span,Y_0);

% Define Solutions:
w = Y_Solution(:,1);
u = Y_Solution(:,2);
v = Y_Solution(:,3);

% Plot Solution:
figure(1)
plot(t,w,'k-','linewidth',5)
hold on
plot(t,u,'b-','linewidth',5)
hold on
plot(t,v,'r-','linewidth',5)

title('Number of Cells over Time','fontsize',20)
xlabel('Time (t)','fontsize',20)
ylabel('Cells','fontsize',20)

legend('w(t)','u(t)', 'v(t)')
xlim([t_0 t_end])
grid on
grid minor

% Find the eigen values to perform stability analysis for the system
%%%
% Define the matrix
aw = .1;
au = .2;
dw = .3;
du = .4;
mu = .01;
mw = .02;
mv = .03;

%    w                        u               v
A = [((2*aw - 1).*dw)-mw      0               0;
    (2*(1 - aw)).*dw     ((2*au - 1).*du)-mu  0;
     0                   2*(1 -au).*du     -1*mv]
     
eig(A)




