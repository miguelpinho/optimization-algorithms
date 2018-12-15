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
load('lmdata1.mat');

lambda = 1;
tolerance = power(10, -6);

iter = 0;
plot_n_grad = [];

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
plotgraph(A, iA, iS, sensor, xinit, S, plot_n_grad, iter);
