% movement physics
A = [1  0  0.1    0; 
     0  1    0  0.1; 
     0  0  0.9    0; 
     0  0    0  0.9];
 
B = [0      0; 
     0      0;
     0.1    0;
     0    0.1];
 
% initial anf final state
initialp = [ 0;   5];
finalp   = [15; -15];

initialx = [initialp;  [0; 0]];
finalx   = [  finalp;  [0; 0]];

% waypoints
K = 6
w   = [10  20  30  30  20   10;
       10  10  10   0   0  -10];
   
tau = [10  25  30  40  50   60];

% problem constraints
T = 80;
Umax = 100;
lambda = 10.^(-3);

E = [1  0  0  0;
     0  1  0  0];

% solve optimization problem
cvx_begin quiet
    variable x(4, T+1); % columns are R^4 state vectors
    variable u(2,   T); % columns are R^2 control signal vectors
    
    f_waypoints = sum( sq_l2_norm(E * x(:, tau) - w, K) );
    f_regularizer = sum( l2_norm(col_diff(u), T-1) ); % norm changes here
    minimize( f_waypoints + lambda * f_reguralizer );
    
    subject to
        x(:,   1) == initialx; 
        x(:, T+1) ==   finalx;
        l2_norm(u, T) <= Umax; % comparison with scalar is applied vector-wise
        for t = 1:T
            x(:, t+1) == A * x(:, t) + B * u(:, t);
        end
cvx_end;

% show solution
x
u

% plot solution
% TODO