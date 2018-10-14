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

%load the workspace 
load('dataA.mat');

lambda1 = lambda(1);

% solve optimization problem
cvx_begin quiet
    variable x(4, 4);
    variable u(1, 2);
    
    %cost function
    f1 = power( norm( E*x(tau(1)) - w(1) ),2);
    for i=2:1:k
        f1 = f1 + ( norm( E*x(tau(i)) - w(i) )).^2;
    end
    
    f2 = ( norm( u(2) - u(1) )).^2;
    for j=3:1:T
        f2 = f2 + ( norm( u(j) - u(j-1) )).^2;
    end
    
    f = f1+(lambda1*f2);
    
    minimize( f ); %como por somatorio aqui dentro? -> calculo vetorial é uma forma, ver task2
    
    %subject to
    x(0) = initialx;
    x(T) = finalx;
    for t = 0:T-1
        norm( u(t), 2) <= Umax;
    end
    
    for t = 0:T-1
        x(t+1) = A*x(t) + B*u(t);
    end
cvx_end;