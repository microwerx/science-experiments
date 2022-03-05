clear;clc;close all;

htmlcolor = @(r,g,b) [r/255, g/255, b/255];

NUMCOLORS=11;
colors = [
htmlcolor(0,12,19);
htmlcolor(0, 18, 25);
htmlcolor(0, 95, 115);
htmlcolor(10, 147, 150);
htmlcolor(148, 210, 189);
htmlcolor(233, 216, 166);
htmlcolor(238, 155, 0);
htmlcolor(202, 103, 2);
htmlcolor(187, 62, 3);
htmlcolor(174, 32, 18);
htmlcolor(155, 34, 38)];


nxsteps=30;
nysteps=15;
Ox = 0;
Oy = 0;
xsize = 2;
ysize = xsize/1.7777778;
xstep = xsize/nxsteps;
ystep = ysize/nysteps;
x1 = Ox-xsize-1
x2 = Ox+xsize+1
y1 = Oy-ysize-1
y2 = Oy+ysize+1

% Plot the quiver graph

[x, y] = meshgrid(x1:xstep:x2, y1:ystep:y2);

% Equation 5.5 (page 122) 
%dx = @(x,y) -x + y;
%dy = @(x,y) -x - y;

% Equation 5.4 (page 122)
%dx = @(x,y) -x + y - x .* (y - x);
%dy = @(x,y) -x - y + 2 .* x.^2 .* y;

% Equation 5.14 (page 128)
%dx = @(x,y) y;
%dy = @(x,y) x - y + x .* (x - 2 .* y);

% Equation 5.17 (page 130)
dx = @(x,y) -y + x .* (x.^2+y.^2) .* sin(pi\sqrt(x.^2+y.^2));
dy = @(x,y)  x + y .* (x.^2+y.^2) .* sin(pi\sqrt(x.^2+y.^2));

% Equation 6.1 (page 132) cardioid shaped
%dx = @(x,y) -x + y .^ 2;
%dy = @(x,y) -y - x .* y;

% Equation 7.1 (page 141) origin repulses toward steady state circle
%dx = @(x,y)  x + y - x .* (x.^2 + y.^2);
%dy = @(x,y) -x + y - y .* (x.^2 + y.^2);

% Equation () Lotka-Volterra Competition
%alpha1 = 0.1; %% growth rate of thing 1.
%alpha2 = 0.1; %% growth rate of thing 2.
%K1 = 1500;    %% carrying capacity of thing 1.
%K2 = 1000;    %% carrying capacity of thing 2.
%lambda1 = 1;
%lambda2 = 2;
%beta1 = alpha1 / K1;
%beta2 = alpha2 / K2;
%dx = @(x,y) beta1 .* x .* (K1 - x - lambda1 .* y);
%dy = @(x,y) beta2 .* y .* (K2 - y - lambda2 .* x);

h = figure();

u = dx(x, y);
v = dy(x, y);
quiver(x, y, u, v, "color", [ 0.5, 0.5, 0.5])
title ("quiver plot");
axis ([x1, x2, y1, y2]);

hold on

ntime = 50;
nsteps = ntime*100;
dt = ntime / nsteps;
xi = zeros(nsteps,1);
yi = zeros(nsteps,1);

for j = 1:125
  curx = (rand(1) * 2 - 1) * xsize * 1.25;
  cury = (rand(1) * 2 - 1) * ysize * 1.25;
  for i = 1:nsteps
    xi(i) = curx;
    yi(i) = cury;
    curx += dt * dx(curx, cury);
    cury += dt * dy(curx, cury);
  end
  ci = mod(j,NUMCOLORS)+1;
  curcolor = [colors(ci, 1), colors(ci, 2), colors(ci, 3)];
  plot(xi, yi, "color", curcolor)
  s1 = "plot (";
  s1 = strcat(s1, num2str(j));
  s1 = strcat(s1, "/1000)");
  title (s1)
  axis ([x1, x2, y1, y2]);
  refresh
end

title("dx = -y + x*(x^2+y^2)*sin(pi*sqrt(x^2+y^2)) | dy = x + y*(x^2+y^2)*sin(pi*sqrt(x^2+y^2))")
dpi = 300;
set(h, "papersize", [ xsize * dpi, ysize * dpi ]);
print -dpng "-FPragmataPro:14" "-S1920,1080" figure1.png
