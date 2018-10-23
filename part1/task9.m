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
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;

%load the workspace
load('dataA.mat');

Umax2 = 15;

% solve optimization problem
cvx_begin quiet
    variable x(4, T+1);% columns are R^4 state vectors
    variable u(2,   T); % columns are R^2 control signal

    %cost function
    f_waypoints = 0;
    for i=1:1:k
        f_waypoints = f_waypoints + square_pos( norm(E * x(:, tau(i) + 1) - w(:, i), 2) );
    end

    f = f_waypoints;

    minimize( f );

    %subject to
    x(:,1) == initialx;
    x(:,T+1) == finalx;

    for t = 1:T
        norm( u(:,t)) <= Umax2;
    end

    for t = 1:T
        x(:, t+1) == A * x(:, t) + B * u(:, t);
    end

cvx_end;


captured=0;
for i=1:1:k
    dw = norm(E * x(:, tau(i)+1) - w(:, i), 2);
    
    %disp(dw);
    if dw <= 10^-6
        captured = captured + 1;
    end
end

disp(captured);


plot_graphs(x, u, tau+1, w);
