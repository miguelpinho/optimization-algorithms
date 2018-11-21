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
load('data1.mat');

%%%%%%%%%%%%%%%%
%Gradient method
%%%%%%%%%%%%%%%%

%Stopping criterion constants
s0 = [-1 -1];
r0 = 5;
epslon = 10^(-6);

%Backtracking parameters
alpha = 1;
y = 10^(-4);
beta = 0.5;

%Function to minimize f(s1, s2, r)
syms f(s1, s2, r);
for k = 1:150
   f = f + (log(1 + exp([s1 s2]*X(:,k) - r)) - Y(k)*([s1 s2]*X(:,k) - r)); 
end
%We can now call the function like this:
%result = f(-1, -1, 0);

%Function derivative g(s1, s2, r)
g1 = diff(f, s1)
g2 = diff(f, s2)
g3 = diff(f, r)
%Likewise, we can now call the function like this:
%result = g(-1, -1, 0)

%Define initial values for s and r
s1 = -1;
s2 = -1;
r = 0;



%Algorithm
%We need to backtrack for each variable s1, s2, r
while g1(s1, s2, r) > epslon 
    %For variable s1
    d1 = -g1(s1, s2, r);
    while f(s1 + alpha1*d1, s2, r) < f(s1, s2, r) + y * g1(alpha1*beta1, s2, r)
        alpha1 = beta1 - alpha1
    end
    s1 = s1 + alpha1 * d1
end

while g2(s1, s2, r) > epslon
    %For variable s2
    d2 = -g1(s1, s2, r);
    while f(s1, s2 + alpha2*d2, r) < f(s1, s2, r) + y * g2(s1, alpha2*beta2, r)
        alpha2 = beta2 - alpha2
    end
    s2 = s2 + alpha2 * d2
end
    
while g3(s1, s2, r) > epslon
    %for variable r
    d3 = -g3(s1, s2, r);
    while f(s1, s2, r+ alpha3*d3) < f(s1, s2, r) + y * g3(s1, s2, alpha3*beta3)
        alpha3 = beta3 - alpha3
    end
    r = r + alpha3 * d3
end




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


