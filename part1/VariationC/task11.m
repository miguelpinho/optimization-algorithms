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
close all;

%load the workspace
load('dataC.mat');

weights = ones(k, 1);
epson = 10^-6;
iter = 10;

for m=1:1:iter
    % solve iterative optimization problem
    cvx_begin quiet
        variable x(4, T+1);% columns are R^4 state vectors
        variable u(2,   T); % columns are R^2 control signal

        %cost function
        f = 0;
        for i=1:1:k
            f = f + weights(i) * norm(E * x(:, tau(i) + 1) - w(:, i), 2);
        end

        minimize( f );

        %subject to
        x(:,1) == initialx;
        x(:,T+1) == finalx;

        for t = 1:T
            norm( u(:,t)) <= Umax;
        end

        for t = 1:T
            x(:, t+1) == A * x(:, t) + B * u(:, t);
        end
    cvx_end;

    % plot postions and control signals
    plot_graphs(x, u, tau+1, w);

    % save plots
    saveas(figure(1), strcat('Figures/task11/iter_', num2str(m - 1), '_position.pdf'));
    saveas(figure(2), strcat('Figures/task11/iter_', num2str(m - 1), '_control.pdf'));

    % calc new weights
    for i=1:1:k
       weights(i) = 1 / (norm(E * x(:, tau(i)+1) - w(:, i), 2) + epson);
    end

    %disp(weights);
    
    captured=0;
    for i=1:1:k
        dw = norm(E * x(:, tau(i)+1) - w(:, i), 2);

        if dw <= 10^-6
            captured = captured + 1;
        end
    end


    str1 = ['Number of waypoints capture on iteration ', num2str(m - 1), ' = ', num2str(captured)];
    disp(str1);

    close all;
end



