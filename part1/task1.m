A = [1 0 0.1 0; 0 1 0 0.1; 0 0 0.9 0; 0 0 0 0.9];
B = [0 0; 0 0; 0.1 0; 0 0.1];
initialp = [0 5];
finalp = [15 -15];
initialx = [initialp; [0 0]];
finalx = [finalp; [0 0]];
w = [[10 10]; [20 10]; [30 10]; [30 0]; [20 0]; [10 -10]];
tau = [10 25 30 40 50 60];
Umax = 100;
T = 80;
lambda = 10.^(-3);

% solve optimization problem
cvx_begin quiet
    variable x(n);
    minimize( expression ); %como por somatorio aqui dentro?
    
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