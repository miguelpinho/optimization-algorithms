0%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
load('data1.mat');

%%%%%%%%%%%%%%%%
%Gradient method
%%%%%%%%%%%%%%%%

%Amount of input features
k = 150;

%Stopping criterion constants
s0 = [-1 -1];
r0 = 5;
epslon = 10^(-6);

%Initial point for gradient descent
t0 = [s0 -r0]'

%Backtracking parameters
alpha0 = [1; 1; 1];
y = 10^(-4);
beta = [0.5; 0.5; 0.5];

%Transformation of X
X_hat = [X; ones(length(X), 1).'];

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
t = t0
while norm(gradient_f_hat(t, X_hat, Y, k)) > epslon 
    d = gradient_f_hat(t, X_hat, Y, k);
    alpha = alpha0;
    while f_hat(t + alpha*d, X_hat, Y, k) > f_hat(t, X_hat, Y, k) + (y*gradient_f_hat(alpha.*beta, X_hat, Y, k))
        alpha = beta .* alpha;
    end
    t = t + (alpha .* d)
    f_hat(t, X_hat, Y, k)
end

t


%Plot data points
for i = 1:150
    if Y(i) == 0
        scatter(X(1, i), X(2, i), [], 'red');
        hold on
    else
        scatter(X(1, i), X(2, i), [], 'blue');
        hold on
    end
end

%Plot resulting line
xResult = -2:0.001:6;
yResult = (t(3)/t(2)) - (t(1)/t(2))*xResult;
plot(xResult, yResult,['--', 'g'], 'LineWidth', 2)

