
clear all; close all; 

% Steady-state reservoir masses (kg): shown in y0 below        
MeHg_pore  = 20.15;          % MeHg mass in pore water
IHg_pore   = 3299;        % IHg mass in pore water
MeHg_water = 10.28;          % MeHg mass in flooded water column
IHg_water  = 3392;        % IHg mass in flooded water column
MeHg_rice  = 10;             % MeHg in rice plants
IHg_rice   = 1024;           % IHg in rice plants
MeHg_top   = 37190;          % MeHg in topsoil
IHg_top    = 7134813;     % IHg in topsoil
MeHg_sub   = 47820;          % MeHg in subsoil
IHg_sub    = 10192524;    % IHg in subsoil

% Set time span (5 months)
tspan = [0 5];

% Set initials: Steady-state reservoir masses (kg)
y0 = [20.15 3299 10.28 3392 10 1024 37190 7134813 47820 10192524];

% ODE solver
fname = 'monthlyrice';                        
[t y] =  ode15s(fname, tspan, y0);  

% Plot figures
figure(1)
plot(t, y(:,1))
xlabel('Months'); ylabel('MeHg in pore water (kg)')

figure(2)
plot(t, y(:,2))
xlabel('Months'); ylabel('IHg in pore water (kg)')

figure(3)
plot(t, y(:,3))
xlabel('Months'); ylabel('MeHg in flooded water column (kg)')

figure(4)
plot(t, y(:,4))
xlabel('Months'); ylabel('IHg in flooded water column (kg)')

figure(5)
plot(t, y(:,5))
xlabel('Months'); ylabel('MeHg in rice plants (kg)')
 
figure(6)
plot(t, y(:,6))
xlabel('Months'); ylabel('IHg in rice plants (kg)')

figure(7)
plot(t, y(:,7))
xlabel('Months'); ylabel('MeHg in topsoil (kg)')
 
figure(8)
plot(t, y(:,8))
xlabel('Months'); ylabel('IHg in topsoil (kg)')

figure(9)
plot(t, y(:,9))
xlabel('Months'); ylabel('MeHg in subsoil (kg)')
 
figure(10)
plot(t, y(:,10))
xlabel('Months'); ylabel('IHg in subsoil (kg)')

figure(11)
A = (((y(:,5)./ (6.342E+12)) * (1E+12)) / (13.7)) * (0.95);
plot(t, A)
xlabel('Months'); ylabel('MeHg in rice grain (ng/g)')

figure (12)
B = (((y(:,6)./ (6.342E+12)) * (1E+12)) / (13.7)) * (0.1);
plot(t, B)
xlabel('Months'); ylabel('IHg in rice grain (ng/g)')

figure (13)
C = A + B;
plot(t, C)
xlabel('Months'); ylabel('THg in rice grain (ng/g)')
