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
    variable x(4, T+1);
    variable u(2, T);
    
    %cost function
    %f1 = square_pos(norm( E*x(:,tau(1)) - w(:,1)));
    %for i=2:1:k
    %    f1 = f1 + ( square_pos(norm( E*x(:,tau(i)) - w(:,i))) );
    %end
    
    %f2 = square_pos( norm( u(2) - u(1) ) );
    %for j=3:1:T
    %    f2 = f2 +  ( square_pos ( norm( u(j) - u(j-1) )) );
    %end
    
    %f = f1+(lambda1*f2);
    
    
    f_waypoints = sum(square_pos( norm(E * x(:, tau) - w, 2) ) );
    f_regularizer = sum( square_pos ( norm(col_diff(u)) ) ); % norm changes here
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