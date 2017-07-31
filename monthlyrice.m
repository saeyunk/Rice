
% Present and future mercury concentrations in Chinese rice: Insights from modeling
% Developer & corresponding author: Sae Yun Kwon (saeyunk@mit.edu)

% Rice paddy bigeochemical cycle model for mercury 
% [5-month dynamic run] Model begins at steady-state & runs forward in time
% First-order differential equations solved using MATLAB ODE15s solver
% t = time in months
% y = inorganic mercury (IHg; i) & methylmercury (MeHg; m) masses in kg

function dydt = monthlyrice(t,y)

% Define the shape of y 
dydt = zeros(size(y));     

% Rate coefficients (1/month): Refer to Table 1 
km_diff    = 0.9167;        % k_diffusion for MeHg  
ki_diff    = 0.6667;        % k_diffusion for IHg 
km_infil   = 1.5833;        % k_infiltration for MeHg 
ki_infil   = 1.5833;        % k_infiltration for IHg
kphoto     = 0.8333;        % k_photodegradation
kevasion   = 0.0669;        % k_evasion
kseep      = 0.0125;        % k_seepage
kexport    = 0.2083;        % k_runoff 
km_rice    = 4.1667;        % k_root absorption for MeHg
ki_rice    = 0.4167;        % k_root absorption for IHg
kmethyl    = 0.0333;        % k_methylation
kdemethyl  = 0.8333;        % k_demethylation
ki_adsorp  = 0.2750;        % k_adsorption for IHg
km_adsorp  = 0.2333;        % k_adsorption for MeHg
ki_desorp  = 0.0012;        % k_desorption for IHg
km_desorp  = 0.0012;        % k_desorption for MeHg
ki_fast_slow = 0.0001;      % k_recycling to subsoil for IHg
km_fast_slow = 0.00001;     % k_recycling to subsoil for MeHg
ki_slow_fast = 0.0000333;   % k_recycling to topsoil for IHg
km_slow_fast = 0.0000333;   % k_recycling to topsoil for MeHg
kburial    = 0.000005;      % k_burial

% Desginate ys 
Mmpore  = y(1);  % MeHg mass in pore water 
Mipore  = y(2);  % IHg mass in pore water
Mmwater = y(3);  % MeHg mass in flooded water column
Miwater = y(4);  % IHg mass in flooded water column
Mmrice  = y(5);  % MeHg mass in rice plants
Mirice  = y(6);  % IHg mass in rice plants
Mmtop   = y(7);  % MeHg mass in topsoil
Mitop   = y(8);  % IHg mass in topsoil
Mmsub   = y(9);  % MeHg in subsoil
Misub   = y(10); % IHg mass in subsoil

% Fractions applied: Refer to Table 1
fm_dissolved = 0.6;  % Fraction of MeHg in dissolved phase 
fi_dissolved = 0.7;  % Fraction of IHg in dissolved phase 
f_desorp     = 0.1;  % Fraction of mercury recovered via desorption 
f_fast       = 0.2;  % Fraction of mercury available for recycling via organic carbon decomposition (from topsoil to subsoil)
f_slow       = 0.2;  % Fraction of mercury available for recycling via organic carbon decomposition (from subsoil to topsoil)

% Expressions for ys (differential equations)
dydt(1) = km_infil*(Mmwater*fm_dissolved) + kmethyl*Mipore + km_desorp*(Mmtop*f_desorp) - kdemethyl*Mmpore - km_diff*Mmpore - kseep*Mmpore - km_rice*Mmpore - km_adsorp*Mmpore;
dydt(2) = ki_infil*(Miwater*fi_dissolved) + kdemethyl*Mmpore + ki_desorp*(Mitop*f_desorp) - kmethyl*Mipore - ki_diff*Mipore - kseep*Mipore - ki_rice*Mipore - ki_adsorp*Mipore;
dydt(3) = 2 + km_diff*Mmpore - km_infil*(Mmwater*fm_dissolved) - kphoto*Mmwater - kexport*Mmwater;
dydt(4) = 992.25 + 1489.42 + ki_diff*Mipore + kphoto*Mmwater - ki_infil*(Miwater*fi_dissolved) - kevasion*Miwater - kexport*Miwater;
dydt(5) = km_rice*Mmpore;
dydt(6) = ki_rice*Mipore;
dydt(7) = km_adsorp*Mmpore + ki_slow_fast*(Mmsub*f_slow) - km_desorp*(Mmtop*f_desorp) - km_fast_slow*(Mmtop*f_fast);
dydt(8) = ki_adsorp*Mipore + km_slow_fast*(Misub*f_slow) - ki_desorp*(Mitop*f_desorp) - ki_fast_slow*(Mitop*f_fast);
dydt(9) = km_fast_slow*(Mmtop*f_fast) - ki_slow_fast*(Mmsub*f_slow) - kburial*Mmsub;
dydt(10)= ki_fast_slow*(Mitop*f_fast) - km_slow_fast*(Misub*f_slow) - kburial*Misub;
