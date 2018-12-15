function [] = plot_graphs_disks(x, u, time_pos, real_pos, radius)

    figure(1);
    plot(x(1,:),x(2,:),'o','MarkerSize', 3, 'MarkerEdgeColor',[0 0 1]);
    hold on;
    plot(x(1,time_pos), x(2,time_pos), 'o','MarkerSize',10, 'MarkerEdgeColor', [1 0 1]);
    hold on;
    plot(real_pos(1,:),real_pos(2,:), 's','MarkerSize',15, 'MarkerEdgeColor', [1 0 0] );
    hold on;
    for i=1:size(real_pos, 2)
        rectangle('Position', [real_pos(:, i)' - radius, 2 * radius * [1 1]], 'Curvature', [1 1])
        hold on;
    end
    axis([0 35 -15 15]);
    grid on

    time_v = (0:79);
    figure(2);
    plot(time_v, u(1,:), 'MarkerEdgeColor',[0 0 1]);
    hold on;
    plot(time_v, u(2,:), 'MarkerEdgeColor',[0 1 1]);
    axis([0 80 -40 40]);
    grid on


end