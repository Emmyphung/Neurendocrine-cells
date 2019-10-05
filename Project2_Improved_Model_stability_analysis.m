% Project II _ Improved Model
% Stability analysis
%%%
% Find the eigen values to perform stability analysis for the system
% Define the matrix

N = 10

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

% Use Jacobian for non-lin model. Matrix in matlab in this case does not
% deal with non-lin model

v_vec = linspace(0, 10, N)
eigenvalues = zeros(3,N)

for i = 1:N
    v = v_vec(i)

% Matrix A
%    w                        u               v
    A = [((2*aw - 1).*dw)-mw      0               0;
        2*(1 - aw).*dw     ((2*au - 1).*du)-mu  0;
     0                   2*(1 -au).*du     -1*mv]
     
    eigenvalues(:,i)= eig(A)
end




