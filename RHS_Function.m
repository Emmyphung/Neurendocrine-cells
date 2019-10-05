% Project II_Original Model_ Function 
% this function will be used in my original model

function dYdt = RHS_Function(t,Y)

% Define variables:
w = Y(1);
u = Y(2);
v = Y(3);


% Define paramters:
aw = .1;
au = .2;
dw = .3;
du = .4;
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