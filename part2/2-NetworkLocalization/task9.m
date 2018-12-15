%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%               Optimization and Algorithms
%
%                   Part2 of the Project
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
load('lmdata2.mat');

lambda = 1;
tolerance = power(10, -6);

iter = 0;
plot_n_grad = [];

%initial position
% xinit = [  6.553; 
%          -0.281;
%           -0.882;
%           -1.514;
%           -5.780;
%            1.564;
%           -6.163;
%           -0.809;
%           -0.825;
%            2.535;
%           -8.313;
%            2.754;
%           -1.557;
%           -3.879;
%           -0.026;
%           0.7001];

xinit = [  7; 
          -0.2;
          -1;
          -1.5;
          -5;
           1.6;
          -6;
          -1;
          -0.8;
           2.5;
          -8;
           2;
          -1;
          -4;
          -0;
          0.7];

%indentity matrix 16x16
I = eye(2);
I_a = eye(16);

B = zeros(2, 16, 8);
E = zeros(2, 16, 24);

for i=1:1:8 
    B(:, 2*i-1:2*i, i) = I;
end
for j=1:1:size(iS)
    E(:,:,j) = B(:,:,iS(j,1))-B(:,:,iS(j,2));
end

xk = xinit;
n_grad = norm( gradient_f(A, iA, iS, B, y, z, xk, E) ); 


while n_grad > tolerance
    
    gradi_fp = gradient_fp(iA, A, iS, B, E, xk);
    func_fp = fp(A, iA, iS, B, y, z, xk, E);
    
    b_aux = gradi_fp'*xk  - func_fp;
    v_lambda = sqrt(lambda).*xk;
    b = [b_aux; v_lambda];
    
    A_aux = sqrt(lambda) .* I_a;
    A_ = [gradi_fp'; A_aux];
    
    belief = A_\b;   
       
    f_belief = f(A, iA, iS, B, y, z, belief, E);
    f_xk = f(A, iA, iS, B, y, z, xk, E);
    
    if f_belief < f_xk 
        xk = belief;
        lambda = 0.7* lambda;
    else
        lambda = 2* lambda;
    end
      
    iter = iter+1;
    plot_n_grad(iter) = n_grad;
    %data for the next iteration 
    n_grad = norm( gradient_f(A, iA, iS, B, y, z, xk, E) );  
    
    
end

sensor = zeros(2,8);
for i=1:1:8
    sensor(:,i) = xk(2*i-1:2*i);
end
plotgraph_task9(A, iA, iS, sensor, xinit, plot_n_grad, iter);
