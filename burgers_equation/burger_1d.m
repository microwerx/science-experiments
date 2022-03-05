%% Inviscid Burgers' Equation
%% (C) 2022 Jonathan Metzgar
%%
%% \partial{u}/dt + u * du/dx = 0

clear;clc;close all;

Length = 10;
NSteps = 101;
dx = Length/NSteps;

%% Create our initial conditions.

x = linspace(0, Length, NSteps);
u = log(2 .+ sin(x));
plot(x, u);
axis([0, Length, -2, 2]);
umax = max(u);
uavg = sum(u) / NSteps;


waitforbuttonpress;


%% Allocate space for our arrays.

du_dt = zeros(length(u), 1);
du_dx = zeros(length(u), 1);
unext = zeros(length(u), 1);

clamp = @(x,x1,x2) min(x2,max(x1,x));

dydx = @(y1, y2, dx) (y2 - y1) / dx;

%% Set up the loop to run a simulation over time.
ntime = 20
dt = .1

t = 0;
i = 0;
while t < ntime+dt
  %% Update the differential equation.
  umax = max(u);
  
  for k = 1 : length(u)
    %% Determine before and after points.
    k0 = k-1;
    if k0 == 0
      k0 = length(u);
    endif
    k2 = k+1;
    if k2 > length(u)
      k2 = 1;
    endif    
    u_0 = u(k0);
    u_1 = u(k);
    u_2 = u(k2);
    
    du_dx(k) = (u(k) - u(k0)) / dx;
    %%du_dx(k) = max(du_dx(k), 1000);
##    du_dx(k) = clamp(du_dx(k), -umax, umax);
##    if isnan(du_dx(k)) || isinf(du_dx(k))
##      du_dx(k) = 0;
##    endif
    du_dt(k) = -u(k) * du_dx(k);
##    du_dt(k) = clamp(du_dt(k), -uavg, uavg);
##    if isnan(du_dt(k)) || isinf(du_dt(k))
##      du_dt(k) = 0;
##    endif    
##    unext(k) = clamp(u(k) + dt * du_dt(k), -umax, umax);
    unext(k) = u(k) + dt * du_dt(k);
  endfor
  u = unext;
  
  %% Update the figure.
  clf;
  hold on;
  axis([0, Length, -2, 2]);
  plot(x, du_dt, "color", "red");
  plot(x, du_dx, "color", "blue");
  plot(x, u, "color", "black");  
  s1 = sprintf("t = %d / %d", t, ntime);
  title(s1);
  refresh;
  
  i += 1;
  t += dt;
endwhile
