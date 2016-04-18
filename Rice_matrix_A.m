%==========================================================================
% OBJECTIVE
%   Assemble matrix A, such that dM/dt = A*M + E
%==========================================================================

% clear variable, for safety's sake
clear A;

% First-order rate coefficients, k (1/month)
Rice_rate_coeff

%--------------------------------------------------------------------------
% Assemble matrix A, such that dM/dt = A*M + E
%--------------------------------------------------------------------------

%-- Atmopshere
Aatm = [-(k_Dep_THg)                                     % Matm 
          k_tsoil_atm                                    % Mtsoil
          0 ];                                           % Mtrice

%-- Top soil
Atsoil = [ k_Dep_THg
          -(k_tsoil_atm + k_tsoil_rice)
          0 ];

%-- Rice
Atrice = [ 0
           k_tsoil_rice
           0 ];
 
%-- matrix A     
A = [Aatm.' ; Atsoil.' ; Atrice.'];
  