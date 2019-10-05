% Project II _ Improved Model
% This script will provide numerical solutions and plots for the improved
% model.
% The function named "RHS_Function_New" will be used here.
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
[t,Y_Solution] = ode45(@RHS_Function_Improved,t_span,Y_0);

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

title('Number of Cells over Time (Improved Model)','fontsize',15)
xlabel('Time (t)','fontsize',20)
ylabel('Cells','fontsize',20)

legend('w(t)','u(t)', 'v(t)')
xlim([t_0 t_end])
grid on
grid minor

