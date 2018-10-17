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

lambda1 = lambda(3);

% solve optimization problem
cvx_begin quiet
    variable x(4, T+1); % columns are R^4 state vectors
    variable u(2,   T); % columns are R^2 control signal vectors
    
    %cost function
    f_waypoints = sum(square_pos( norm(E * x(:, tau) - w, 2) ) );
    f_regularizer = sum( norm(col_diff(u)) ) ; % norm changes here
    f = f_waypoints + lambda1 * f_regularizer;
    
    
    minimize( f ); 
    
    %subject to
    x(:,1) == initialx;
    x(:,T+1) == finalx;
    
    for t = 1:T
        norm( u(:,t)) <= Umax;
    end
    
    for t = 1:T
        x(:,t+1) == A*x(:,t) + B*u(:,t);
    end
cvx_end;

plot(x(1,:),x(2,:),'.');