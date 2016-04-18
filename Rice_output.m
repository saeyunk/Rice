%==========================================================================
% OBJECTIVE
%   Print model results to command window. 
%==========================================================================

%---------------------------------------
%Display final reservoir sizes 
%---------------------------------------

if Ldisp;
    disp('-------------------------------------------------------------------')
    disp('FINAL RESERVOIR SIZES (ng/m2) ')
    disp('-------------------------------------------------------------------')
    disp(['Atmospheric Reservoir                         :   ',num2str((Matm(end)))])
    disp(['Topsoil Reservoir                             :   ',num2str((Mtsoil(end)))])
    disp(['Rice Reservoir                                :   ',num2str((Mtrice(end)))])
    disp(' ')
end