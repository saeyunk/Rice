
clear all; close all; 

% Initial reservoir masses (kg): shown in y0 below          
MeHg_pore  = 12;         % MeHg mass in pore water
IHg_pore   = 194;        % IHg mass in pore water
MeHg_water = 4;          % MeHg mass in flooded water column
IHg_water  = 1986;       % IHg mass in flooded water column
MeHg_rice  = 10;         % MeHg in rice plants
IHg_rice   = 1024;       % IHg in rice plants
MeHg_top   = 21784;      % MeHg in topsoil
IHg_top    = 3868216;    % IHg in topsoil
MeHg_sub   = 29600;      % MeHg in subsoil
IHg_sub    = 7370400;    % IHg in subsoil

% Set time span (years)
tspan = [1 100000];

% Set initials: Initial mercury reservoir masses (kg)
y0 = [12 194 4 1986 10 1024 21784 3868216 29600 7370400];

% ODE solver
fname = 'riceboxmodel';                        
[t y] =  ode15s(fname, tspan, y0);  

% Plot figures
figure(1)
plot(t, y(:,1))
xlabel('Years'); ylabel('MeHg in pore water (kg)')

figure(2)
plot(t, y(:,2))
xlabel('Years'); ylabel('IHg in pore water (kg)')

figure(3)
plot(t, y(:,3))
xlabel('Years'); ylabel('MeHg in flooded water column (kg)')

figure(4)
plot(t, y(:,4))
xlabel('Years'); ylabel('IHg in flooded water column (kg)')

figure(5)
plot(t, y(:,5))
xlabel('Years'); ylabel('MeHg in rice plants (kg)')
 
figure(6)
plot(t, y(:,6))
xlabel('Years'); ylabel('IHg in rice plants (kg)')

figure(7)
plot(t, y(:,7))
xlabel('Years'); ylabel('MeHg in topsoil (kg)')
 
figure(8)
plot(t, y(:,8))
xlabel('Years'); ylabel('IHg in topsoil (kg)')

figure(9)
plot(t, y(:,9))
xlabel('Years'); ylabel('MeHg in subsoil (kg)')
 
figure(10)
plot(t, y(:,10))
xlabel('Years'); ylabel('IHg in subsoil (kg)')
