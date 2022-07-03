%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'heutel_2012';
M_.dynare_version = '4.6.4';
oo_.dynare_version = '4.6.4';
options_.dynare_version = '4.6.4';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('heutel_2012.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'eps'};
M_.exo_names_tex(1) = {'\epsilon'};
M_.exo_names_long(1) = {'Productivity Shock'};
M_.endo_names = cell(13,1);
M_.endo_names_tex = cell(13,1);
M_.endo_names_long = cell(13,1);
M_.endo_names(1) = {'c'};
M_.endo_names_tex(1) = {'{C}'};
M_.endo_names_long(1) = {'Consumption'};
M_.endo_names(2) = {'y'};
M_.endo_names_tex(2) = {'{Y}'};
M_.endo_names_long(2) = {'Output'};
M_.endo_names(3) = {'k'};
M_.endo_names_tex(3) = {'{K}'};
M_.endo_names_long(3) = {'Capital'};
M_.endo_names(4) = {'tau'};
M_.endo_names_tex(4) = {'{\tau}'};
M_.endo_names_long(4) = {'Emission Tax'};
M_.endo_names(5) = {'z'};
M_.endo_names_tex(5) = {'{Z}'};
M_.endo_names_long(5) = {'Abatemnet Cost'};
M_.endo_names(6) = {'mu'};
M_.endo_names_tex(6) = {'{\mu}'};
M_.endo_names_long(6) = {'Abatement'};
M_.endo_names(7) = {'e'};
M_.endo_names_tex(7) = {'{E}'};
M_.endo_names_long(7) = {'Emissions'};
M_.endo_names(8) = {'x'};
M_.endo_names_tex(8) = {'{X}'};
M_.endo_names_long(8) = {'Stock of Emissions'};
M_.endo_names(9) = {'r'};
M_.endo_names_tex(9) = {'{R}'};
M_.endo_names_long(9) = {'Capital Rental Rate'};
M_.endo_names(10) = {'a'};
M_.endo_names_tex(10) = {'{A}'};
M_.endo_names_long(10) = {'Technology/Productivity'};
M_.endo_names(11) = {'lambda'};
M_.endo_names_tex(11) = {'{\lambda}'};
M_.endo_names_long(11) = {'Lagrange Multiplier'};
M_.endo_names(12) = {'zeta'};
M_.endo_names_tex(12) = {'{\zeta}'};
M_.endo_names_long(12) = {'Lagrange Multiplier'};
M_.endo_names(13) = {'omega'};
M_.endo_names_tex(13) = {'{\omega}'};
M_.endo_names_long(13) = {'Lagrange Multiplier'};
M_.endo_partitions = struct();
M_.param_names = cell(13,1);
M_.param_names_tex = cell(13,1);
M_.param_names_long = cell(13,1);
M_.param_names(1) = {'ALPHA'};
M_.param_names_tex(1) = {'{\alpha}'};
M_.param_names_long(1) = {'Output Elasticity of Capital'};
M_.param_names(2) = {'BETA'};
M_.param_names_tex(2) = {'{\beta}'};
M_.param_names_long(2) = {'Discount Factor'};
M_.param_names(3) = {'GAMMA'};
M_.param_names_tex(3) = {'{\gamma}'};
M_.param_names_long(3) = {'1 - Elasticity of Emissions with respect to Output'};
M_.param_names(4) = {'DELTA'};
M_.param_names_tex(4) = {'{\delta}'};
M_.param_names_long(4) = {'Capital Depreciation Rate'};
M_.param_names(5) = {'ETA'};
M_.param_names_tex(5) = {'{\eta}'};
M_.param_names_long(5) = {'Pollution Depreciation Rate'};
M_.param_names(6) = {'THETA_1'};
M_.param_names_tex(6) = {'{\theta_1}'};
M_.param_names_long(6) = {'Abatemnet Cost Equation Parameter 1'};
M_.param_names(7) = {'THETA_2'};
M_.param_names_tex(7) = {'{\theta_2}'};
M_.param_names_long(7) = {'Abatemnet Cost Equation Parameter 2'};
M_.param_names(8) = {'NU'};
M_.param_names_tex(8) = {'{\nu}'};
M_.param_names_long(8) = {'Relation domestic to foreign emissions'};
M_.param_names(9) = {'RHO'};
M_.param_names_tex(9) = {'{\rho}'};
M_.param_names_long(9) = {'Persistence of TFP Shock'};
M_.param_names(10) = {'PHI_C'};
M_.param_names_tex(10) = {'{\phi_c}'};
M_.param_names_long(10) = {'CARA for Consumption'};
M_.param_names(11) = {'D_1'};
M_.param_names_tex(11) = {'{d_1}'};
M_.param_names_long(11) = {'Damage Parameter Emissions 1'};
M_.param_names(12) = {'D_2'};
M_.param_names_tex(12) = {'{d_2}'};
M_.param_names_long(12) = {'Damage Parameter Emissions 2'};
M_.param_names(13) = {'D_0'};
M_.param_names_tex(13) = {'{d_0}'};
M_.param_names_long(13) = {'Damage Parameter Emissions 3'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 13;
M_.param_nbr = 13;
M_.orig_endo_nbr = 13;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 13;
M_.eq_nbr = 13;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 5 18;
 0 6 19;
 1 7 0;
 0 8 20;
 0 9 0;
 0 10 21;
 0 11 0;
 2 12 0;
 0 13 22;
 3 14 23;
 4 15 24;
 0 16 25;
 0 17 26;]';
M_.nstatic = 2;
M_.nfwrd   = 7;
M_.npred   = 2;
M_.nboth   = 2;
M_.nsfwrd   = 9;
M_.nspred   = 4;
M_.ndynamic   = 11;
M_.dynamic_tmp_nbr = [32; 17; 0; 0; ];
M_.model_local_variables_dynamic_tt_idxs = {
};
M_.equations_tags = {
  1 , 'name' , 'Law of Motion for Total Factor Productivity' ;
  2 , 'name' , 'F.O.C Firm w.r.t Capital' ;
  3 , 'name' , 'F.O.C Firm w.r.t Abatement' ;
  4 , 'name' , 'F.O.C Household (Euler Capital Equation)' ;
  5 , 'name' , 'Goods Market Clearing' ;
  6 , 'name' , 'Pollution Evolution Eq.' ;
  7 , 'name' , 'Production Function' ;
  8 , 'name' , 'Period Emissions Eq.' ;
  9 , 'name' , 'Abatement Cost Eq.' ;
  10 , 'name' , 'F.O.C of the Social Planer w.r.t. Tax Rate' ;
  11 , 'name' , 'F.O.C of the Social Planer w.r.t. Pollution Stock' ;
  12 , 'name' , 'F.O.C of the Social Planer w.r.t. output' ;
  13 , 'name' , 'F.O.C of the Social Planer w.r.t. capital' ;
};
M_.mapping.c.eqidx = [4 5 10 12 13 ];
M_.mapping.y.eqidx = [2 3 5 7 8 9 10 12 13 ];
M_.mapping.k.eqidx = [2 5 7 10 11 12 13 ];
M_.mapping.tau.eqidx = [2 3 10 12 13 ];
M_.mapping.z.eqidx = [5 9 10 12 ];
M_.mapping.mu.eqidx = [2 3 8 9 10 12 13 ];
M_.mapping.e.eqidx = [6 8 ];
M_.mapping.x.eqidx = [6 7 11 13 ];
M_.mapping.r.eqidx = [2 4 10 12 13 ];
M_.mapping.a.eqidx = [1 7 11 13 ];
M_.mapping.lambda.eqidx = [10 12 13 ];
M_.mapping.zeta.eqidx = [10 11 12 ];
M_.mapping.omega.eqidx = [11 12 13 ];
M_.mapping.eps.eqidx = [1 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [3 8 10 11 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(13, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(13, 1);
M_.endo_trends = struct('deflator', cell(13, 1), 'log_deflator', cell(13, 1), 'growth_factor', cell(13, 1), 'log_growth_factor', cell(13, 1));
M_.NNZDerivatives = [73; -1; -1; ];
M_.static_tmp_nbr = [23; 15; 0; 0; ];
M_.model_local_variables_static_tt_idxs = {
};
M_.params(1) = 0.36;
ALPHA = M_.params(1);
M_.params(2) = 0.98267;
BETA = M_.params(2);
M_.params(3) = 0.304;
GAMMA = M_.params(3);
M_.params(4) = 0.025;
DELTA = M_.params(4);
M_.params(5) = 0.9979;
ETA = M_.params(5);
M_.params(6) = 0.05607;
THETA_1 = M_.params(6);
M_.params(7) = 2.8;
THETA_2 = M_.params(7);
M_.params(8) = 3;
NU = M_.params(8);
M_.params(9) = 0.95;
RHO = M_.params(9);
M_.params(10) = 2;
PHI_C = M_.params(10);
M_.params(12) = 5.209591953487139e-10;
D_2 = M_.params(12);
M_.params(11) = (-1.258335847917925e-06);
D_1 = M_.params(11);
M_.params(13) = 0.001395;
D_0 = M_.params(13);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.exo_steady_state(1) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
steady;
%
% ENDVAL instructions
%
ys0_= oo_.steady_state;
ex0_ = oo_.exo_steady_state;
oo_.exo_steady_state(1) = (1-M_.params(9))*0.02955880224154443;
steady;
options_.periods = 100;
perfect_foresight_setup;
perfect_foresight_solver;
var_list_ = {'x'};
rplot(var_list_);
var_list_ = {'y';'c';'e'};
rplot(var_list_);
var_list_ = {'k'};
rplot(var_list_);
var_list_ = {'tau'};
rplot(var_list_);
var_list_ = {'a'};
rplot(var_list_);
write_latex_definitions;
write_latex_parameter_table;
collect_latex_files;
save('heutel_2012_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('heutel_2012_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('heutel_2012_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('heutel_2012_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('heutel_2012_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('heutel_2012_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('heutel_2012_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
