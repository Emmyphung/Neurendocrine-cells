% Project II _ Original Model
% Bifurcation and stability analysis (for au, du) (progenitor cells)
%%%
% Find the eigen values to perform stability analysis for the system
%%%
% Define the matrix
lowbound = 0;
upbound = 1;
N = 50;

% Changes in the parameters for progenitor cells
eigenvalues = zeros(1,N);

aw = .1
au_vec = linspace(lowbound, upbound, N);
dw = .3;
du_vec = linspace(lowbound, N, N);
mu = .01;
mw = .02;
mv = .03;

% use for loop to create matrix A for each value of aw and dw 

for i =1:N
    au = au_vec(i);
    for j = 1:N
        du = du_vec(j);
     %    w                           u               v
     A = [(((2*aw - 1).*dw)-mw)      0               0;
        2*(1 - aw).*dw     (2*au - 1).*du-mu      0;
         0                   2*(1 -au).*du         -1*mv];
    eval = eig(A);
    eigenvalues(i,j)= eval(1); % try trace and det instead!
    end
end

% Plot
[Au, Du] = meshgrid(au_vec, du_vec)

figure(1);
surf(Au, Du,eigenvalues)
title('Illustration of Eigen values','fontsize',20)
xlabel('Au','fontsize',20)
ylabel('Du','fontsize',20)
zlabel('Eigen Values','fontsize',20)

% Plot the contour for values of aw, dw where eig(A) = 0
figure(2);
[Au, Du] = meshgrid(au_vec, du_vec)
contour(Au, Du,eigenvalues,[0 0])
xlabel('Au','fontsize',20)
ylabel('Du','fontsize',20)




