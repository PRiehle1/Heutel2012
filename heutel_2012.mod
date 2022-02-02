% ==============================================================================
% ==============================================================================
%                                 HEUTEL 2012 
% ==============================================================================
% ==============================================================================

% ==============================================================================
% ==============================================================================
%                                Include Modules
% ==============================================================================
% ==============================================================================


% Include the Model Symbol Declaration
@#include "heutel_2012_symdlcs.inc"
% Include the Model Equations
@#include "heutel_2012_modeleqs.inc"


% ==============================================================================
% ==============================================================================
%                                 Calibration
% ==============================================================================
% ==============================================================================

% Include the Parameter Calibration of the Model
@#include "heutel_2012_parcal.inc"

% ==============================================================================
% Shock Calibration 
% ==============================================================================
% In this part I define different deterministic shock scenarios
%
% I. Permanent shock: TFP increases permanently by 3%
%
% II. Pre-announced permanent shock: TFP increases permanently by 3%
% ==============================================================================
% I. Permanent shock: TFP increases permanently by 3%
% ==============================================================================
% initval;
% eps = 0;
% end;
% steady;
% 
% endval;
% eps = (1-RHO)*log(1.03);
% end;
% steady;
% 
% % % make sure everything is set up correctly!
% % perfect_foresight_setup(periods = 8);
% % oo_.exo_simul
% % oo_.endo_simul
% 
% perfect_foresight_setup(periods = 100);
% perfect_foresight_solver;
% 
% rplot x;
% rplot y c e;
% rplot k;
% rplot tau;
% rplot a;

% ==============================================================================
% II. Pre-announced permanent shock: TFP increases permanently by 3%
% ==============================================================================

initval;
eps = 0;
end;
steady;

endval;
eps = (1-RHO)*log(1.002);
end;
steady;

shocks;
var eps;
periods 1:5;
values 0;
end;

% % make sure everything is set up correctly!
% perfect_foresight_setup(periods = 8);
% oo_.exo_simul
% oo_.endo_simul

perfect_foresight_setup(periods = 360);
perfect_foresight_solver;

rplot x;
rplot y c e;
rplot k;
rplot tau;
rplot a;


% ==============================================================================
% ==============================================================================
%                                 Latex Part
% ==============================================================================
% ==============================================================================


write_latex_definitions;
write_latex_parameter_table;
write_latex_original_model;
write_latex_dynamic_model;
write_latex_static_model;
% Only if you have a Steady State Model Block
%write_latex_steady_state_model;
collect_latex_files;