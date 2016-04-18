%==========================================================================
% OBJECTIVE
%   This script lists all the Hg masses, fluxes, and rate constants of 
% 5 reservoirs in flooded rice paddies (water, topsoil, subsoil, rice THg, 
% rice MMHg). The script also calculates rate constants as first order 
% linear processes.

%--------------------------------------------------------------------------
% Initial reservoirs estimates (ng/m2)
%--------------------------------------------------------------------------

% Atmopshere
Ratm         = 34400;                  % Back calculation from k = 0.05 month^-1 

% Water
Rwater       = 30714;                  % Water

% Soil
Rtsoil       = 19500000;               % Topsoil 

% Rice
Rtrice       = 0;                      % THg in rice grain 

%--------------------------------------------------------------------------
% Fluxes between reservoirs (ng/m2/month)
%--------------------------------------------------------------------------

% Atmosphere
Dep_THg      = 1720;      % THg deposition to rice paddies (GEOS-Chem)

% Top soil
netEv_THg    = 438;       % Net THg evasion to the atmosphere (Agnan et al 2015)
f_tsoil_rice = 1574;      % THg flux from soil to rice

%--------------------------------------------------------------------------
% Atmospheric rates (1/month)
%--------------------------------------------------------------------------

k_Dep_THg    = 0.05;      % Derived from Amos et al (2013): terr surfaces

%--------------------------------------------------------------------------
% Topsoil rates (1/month)
%--------------------------------------------------------------------------

k_tsoil_atm  = netEv_THg / Rtsoil;    % THg evasion to the atmosphere
k_tsoil_rice = f_tsoil_rice / Rtsoil; % THg from topsoil to rice grain

