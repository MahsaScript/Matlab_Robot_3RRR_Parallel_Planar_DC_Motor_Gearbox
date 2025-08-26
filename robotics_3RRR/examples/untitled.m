q0 = [0 0 0]'; % initial configuration [x y theta]
qf = [0 0 pi]'; % final configuration
maxcurv = 1/5;   % 5m turning circle
rs = ReedsShepp(q0, qf, maxcurv, 0.05)

% set up a vehicle model for animation
[car.image,~,car.alpha] = imread('car2.png');
car.rotation = 180; % degrees
car.centre = [648; 173]; % pix
car.length = 4.2; % m

% setup the plot
clf; plotvol([-4 8 -6 6])
a = gca;
a.XLimMode = 'manual';
a.YLimMode = 'manual';
set(gcf, 'Color', 'w')
grid on
a = gca;
xyzlabel

% now animate
plot_vehicle(rs.path, 'model', car, 'trail', 'r:', 'movie', '3point.gif');