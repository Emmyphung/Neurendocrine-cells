% Project II _ Original Model
% Bifurcation and stability analysis (for aw, dw) (stem cells)
%%%
% Find the eigen values to perform stability analysis for the system
%%%
% Define the matrix
lowbound = 0;
upbound = 1;
N = 50;

% Changes in the parameters for stem cells
eigenvalues = zeros(1,N);
aw_vec = linspace(lowbound, upbound, N);
au = .2
dw_vec = linspace(lowbound, N, N);
du = .4;
mu = .01;
mw = .02;
mv = .03;

% use for loop to create matrix A for each value of aw and dw 

for i =1:N
    aw = aw_vec(i);
    for j = 1:N
        dw = dw_vec(j);
     %    w                           u               v
     A = [(((2*aw - 1).*dw)-mw)      0               0;
        2*(1 - aw).*dw     (2*au - 1).*du-mu      0;
         0                   2*(1 -au).*du         -1*mv];
    eval = eig(A);
    eigenvalues(i,j)= eval(3); % try trace and det instead!
    end
end

% Plot
[Aw, Dw] = meshgrid(aw_vec, dw_vec)

figure(1);
surf(Aw, Dw,eigenvalues)
title('Illustration of Eigen values','fontsize',20)
xlabel('Aw','fontsize',20)
ylabel('Dw','fontsize',20)
zlabel('Eigen Values','fontsize',20)

% Plot the contour for values of aw, dw where eig(A) = 0
figure(2);
[Aw, Dw] = meshgrid(aw_vec, dw_vec)
contour(Aw, Dw,eigenvalues,[0 0])
xlabel('Aw','fontsize',20)
ylabel('Dw','fontsize',20)




