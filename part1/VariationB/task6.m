%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%               Optimization and Algorithms
%
%                   Part1 of the Project
%
%
%
%   Authors: 
%         - Duarte Dias,  81356,  duarte.ferreira.dias@tecnico.ulisboa.pt
%         - Miguel Pinho, 80826,  miguel.m.pinho@tecnico.ulisboa.pt
%         - Pedro Mendes, 81046,  pedrogoncalomendes@tecnico.ulisboa.pt
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

%load the workspace 
load('dataB.mat');

%chosse the value of lambda
lambda1 = 0.1;

% solve optimization problem
cvx_begin quiet
    variable x(4, T+1);% columns are R^4 state vectors
    variable u(2,   T); % columns are R^2 control signal
    
    %cost function
    f_waypoints = 0;
    for i=1:1:k
        f_waypoints = f_waypoints + square_pos(task5( E * x(:, tau(i)),  c(:, i), 2));
    end
    
    f_regularizer = 0;
    for i=2:1:T
        f_regularizer = f_regularizer + norm(u(:, i)-u(:, i-1), 2);
    end
    
    f = f_waypoints + lambda1 * f_regularizer;
        
    minimize( f ); 
    
    %subject to
    x(:,1) == initialx;
    x(:,T+1) == finalx;
    
    for t = 1:T
        norm( u(:,t)) <= Umax;
    end
    
    for t = 1:T
        x(:, t+1) == A * x(:, t) + B * u(:, t);
    end
    
cvx_end;

%plot the results
plot_graphs(x, u, tau+1, c);


%changes in control signal
counter = 0;
for t=2:1:T
   if norm(u(:,t)-u(:,t-1), 2) > power(10,-6)
       counter = counter + 1;
   end
end

%calculation of mean deviation
m=0;
for i=1:1:k
    m = m + norm(E * x(:, tau(i)+1) - c(:, i), 2);
end
mean_desviation = m/k;

disp(counter);
disp(mean_desviation);
