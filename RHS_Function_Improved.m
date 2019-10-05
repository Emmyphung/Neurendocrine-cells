% Project II _ Improved Model
% This function will be used in my improved model.

function dYdt = RHS_Function_Improved(t,Y)

% Define variables:
w = Y(1);
u = Y(2);
v = Y(3);


% Define parameters:
k1 = 2;
k2 = 2.5;
a = 0.2;
b = 0.7;


aw = .1;
au = .2;
dw = k1./(a*v + 1);
du = k2./(b*v + 1);
mu = .01;
mw = .02;
mv = .03;

% Define equations:
dwdt = ((2*aw - 1).*dw).* w - mw.*w;
dudt = ((2*au - 1).*du).*u + (2*(1 - aw).*dw).*w - mu.*u;
dvdt = (2*(1 -au).*du).*u - mv.*v;

% Assemble equations into a single column vector:
dYdt = [dwdt; dudt; dvdt];

end