%==========================================================================
% OBJECTIVE
%   This module simulates THg accumulation to rice in forward time.
%==========================================================================

% Assemble matrix A, such that dM/dt = A*M + E
Rice_matrix_A

% integration time (months)
tspan = 0:dt:3; 
dt = 0.2;

% dummy matrix of zeros (not necessary, but dramatically saves time)
M = zeros(3, numel(tspan));     % 3 = n of reservoirs, numel(tspan) = n of time-steps 

% Initial conditions (ng/m2)
M(:,1) = [Ratm ; Rtsoil; Rtrice]; % normal initial conditions simulated by time-step of 1 

% Solve M(t) forward in time
for j = 2:numel(tspan);         % j equals time-step starting from 2 to all (to the end)  
    
    M(:,j) = ( A*M(:,j-1) )*dt + M(:,j-1);
    
end

% parse output
Matm    = M(1,:);    % atmosphere
Mtsoil  = M(2,:);    % topsoil
Mtrice  = M(3,:);    % rice

% Save reservoirs sizes (ng/m2)
Ratm_PI    = Matm(end);       % atmosphere
Rtsoil_PI  = Mtsoil(end);     % topsoil
Rtrice_PI  = Mtrice(end);     % rice

%--------------------------------------------------------------------------
% PLOTS
%--------------------------------------------------------------------------

if Lplot;
    
    %---------------------------------------
    % Plot reservoir (ng/m2) vs. time (months)
    %---------------------------------------
    figure(1)
    %plot (tspan, Mtsoil, 'r-', 'linewidth', 2)
    %title ('Changes in reservoirs (ng/m2))')
    %hold on
    plot (tspan, Mtrice, 'g-', 'linewidth', 2)
    legend ('Rice')
    
end
