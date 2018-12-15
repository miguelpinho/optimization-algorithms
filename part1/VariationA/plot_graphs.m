function [] = plot_graphs(x, u, time_pos, real_pos)

    figure(1);
    plot(x(1,:),x(2,:),'o','MarkerSize', 3, 'MarkerEdgeColor',[0 0 1]);
    hold on;
    plot(x(1,time_pos), x(2,time_pos), 'o','MarkerSize',10, 'MarkerEdgeColor', [1 0 1]);
    hold on;
    plot(real_pos(1,:),real_pos(2,:), 's','MarkerSize',15, 'MarkerEdgeColor', [1 0 0]);
    axis([0 35 -15 15]);
    grid on;

    time_v = (0:79);
    figure(2);
    plot(time_v, u(1,:), 'MarkerEdgeColor',[0 0 1]);
    hold on;
    plot(time_v, u(2,:), 'MarkerEdgeColor',[0 1 1]);
    axis([0 80 -40 40]);
    legend({'u_1(t)','u_2(t)'},'Location','northeast')
    grid on

end