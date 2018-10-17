function [] = plot_graphs(x, u)

    figure(1);
    plot(x(1,:),x(2,:),'o','MarkerSize', 3, 'MarkerEdgeColor',[0 0 1]);
    hold on;
    plot(x(1,tau), x(2,tau), 'o','MarkerSize',10, 'MarkerEdgeColor', [1 0 1]);
    hold on;
    plot(w(1,:),w(2,:), 's','MarkerSize',15, 'MarkerEdgeColor', [1 0 0] );
    grid on

    time_v = (0:79);
    figure(2);
    plot(time_v, u(1,:), 'MarkerEdgeColor',[0 0 1]);
    hold on;
    plot(time_v, u(2,:), 'MarkerEdgeColor',[0 1 1]);
    axis([0 80 -40 40]);
    grid on


end