% MATLAB SCRIPT TO GENERATE 1D HEAT EQUATION SOLUTION
% DOMAIN FROM X = 0 TO X = 1

clear 
clc

% PDE THAT IS SOLVED HERE
% du/dt = d^2u/dx^2 - 2*t*exp(-x*t)*(1+2*t)

% ANALYTICAL SOLUTION
u_exact = @(x,t) 2*exp(-x.*t);

% DOMAIN IN X
xrange = [0 1];

% TIME RANGE
trange = [0 1]; % The last time value can be amended as necessary

% GENERATE POINTS IN THE X-DIRECTION
xp = linspace(xrange(1),xrange(2),2048);

% GENERATE POINTS IN THE t-DIRECTION
tp = linspace(trange(1),trange(2),16384);

% EVALUATE FUNCTION AT EVERY DATA POINT
u = zeros(length(xp),length(tp));

for i = 1:length(tp)
    u(:,i) = u_exact(xp,tp(i));
end

% SPLIT DATASET INTO 2
uin = u(:,1:length(tp)/2);
uout = u(:,1+length(tp)/2:end);

save heat_eq_1d.mat u uin uout

contourf(u)