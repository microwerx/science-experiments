%% Calculate a simple ODE trajectory and plot a phase plane

nx = 100
ntimesteps = 100
nsecs = 5
dt = nsecs / ntimesteps

xi = zeros(ntimesteps+1);
yi = zeros(ntimesteps+1);
dxi = zeros(ntimesteps+1);
dyi = zeros(ntimesteps+1);

%% Initial conditions

xi(1) = .1;
yi(1) = .1;

for i = 2 : ntimesteps
  x = x(i-1)
  y = y(i-1)
  dxi(i) = -x + y - x * (y - x);
  dyi(i) = -x - y + 2 * x^2 * y;
  x(i) = x + dt * dxi(i);
  y(i) = y + dt * dyi(i);
end;

plot(x, y)

[x, y] = meshgrid (-20:2:20);
h = quiver (x, y, (-x+y-x*(y-x)), (-x-y+2*x^2*y));
set (h, "maxheadsize", 0.33);
