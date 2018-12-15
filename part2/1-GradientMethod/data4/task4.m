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
load('dataset4.mat');

%%%%%%%%%%%%%%%%
%Gradient method
%%%%%%%%%%%%%%%%

%Amount of input features
[n, k] = size(X);

%Stopping criterion constants
s0 = -ones(1, n);
r0 = 0;
epslon = 10^(-6);

%Initial point for gradient descent
t0 = [s0 r0]'

%Backtracking parameters
alpha0 = 1;
y = 10^(-4);
beta = 0.5;

%Transformation of X
X_hat = [X; -ones(length(X), 1)'];

%Function to minimize f(s, r)
%We transform that function into:
%f = (log(1 + exp(X_hat.*t)) - (Y.').*(X_hat.*t));
%We can call the function like this:
%x1 = f_hat([1; 1; 1], X_hat, Y, 150)

%Function derivative
%f' = (exp(X_hat'*t)/(1 + exp(X_hat'*t))) - Y
%We can call the function like this
%x2 = gradient_f_hat([1; 1; 1], X_hat, Y, 150)

%Algorithm - Gradient Descent
t = t0;
alpha = alpha0;
gradients = [];
while norm(gradient_f_hat(t, X_hat, Y, k)) >= epslon
    d = -gradient_f_hat(t, X_hat, Y, k);
    alpha = alpha0;
    while f_hat(t + alpha.*d, X_hat, Y, k) >= f_hat(t, X_hat, Y, k) + (y.*gradient_f_hat(t, X_hat, Y, k)'*(alpha.*d))
        alpha = beta .* alpha;
    end
    t = t + (alpha .* d);
    %f_hat(t, X_hat, Y, k)
    gradients = [gradients norm(gradient_f_hat(t, X_hat, Y, k))];
end

%plot figure with logarithmic y-axis
figure;
semilogy(gradients);
grid on;

<<<<<<< Updated upstream
iter = length(gradients)

s = t(1:n)
r = t(n+1)
=======
s =[]
for i = 1:n
    s = [s t(i)];
end
s
r = -t(3)
>>>>>>> Stashed changes

