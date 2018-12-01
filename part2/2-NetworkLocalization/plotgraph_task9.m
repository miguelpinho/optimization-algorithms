function [] = plotgraph_task9(A, iA, iS, s, xinit, n_grad, iter)

sinit = zeros(2,8);
for i=1:1:8
    sinit(:,i) = xinit(2*i-1:2*i);
end

figure(1);
hold on
xlim([-15 15])
ylim([-15 15])


for i=1:1:size(iA,1)
    plot([A(1,iA(i,1)) s(1,iA(i,2))], [A(2,iA(i,1)) s(2,iA(i,2))], '--', 'Color', 'm');
end 
for i=1:1:size(iS,1)
    plot([s(1,iS(i,1)) s(1,iS(i,2))], [s(2,iS(i,1)) s(2,iS(i,2))], '--', 'Color', 'm');
end

plot(A(1,:),A(2,:), 's', 'MarkerSize', 10, 'MarkerEdgeColor', 'r');
plot(sinit(1,:), sinit(2,:), '*', 'MarkerSize',7, 'MarkerEdgeColor', 'b');
plot(s(1,:),s(2,:), 'o', 'MarkerSize',7, 'MarkerEdgeColor', 'b');
grid on

v_i = 1:1:iter;
figure(2);
semilogy(v_i, n_grad);
xlabel('$$k$$','Interpreter','latex');
title('$$\mid\mid \nabla f(x_k) \mid\mid$$ (LM method)','Interpreter','latex');
grid on
end