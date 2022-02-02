function [ys,params,check] = heutel_2012_steadystate(ys,exo,M_,options_)
% function [ys,params,check] = Basu_Bundick_2017_steadystate(ys,exo,M_,options_)
% computes the steady state for the NK_baseline.mod and uses a numerical
% solver to do so
% Inputs: 
%   - ys        [vector] vector of initial values for the steady state of
%                   the endogenous variables
%   - exo       [vector] vector of values for the exogenous variables
%   - M_        [structure] Dynare model structure
%   - options   [structure] Dynare options structure
%
% Output: 
%   - ys        [vector] vector of steady state values for the the endogenous variables
%   - params    [vector] vector of parameter values
%   - check     [scalar] set to 0 if steady state computation worked and to
%                    1 of not (allows to impose restrictions on parameters)

% read out parameters to access them with their name
NumberOfParameters = M_.param_nbr;
for ii = 1:NumberOfParameters
  paramname = M_.param_names{ii};
  eval([ paramname ' = M_.params(' int2str(ii) ');']);
end
% initialize indicator
check = 0;


%% Enter model equations here
% Initial Guess

k_guess = 27.791;% Taken from the Paper of Heutel 
e_guess = 2.2160;  % Taken from the Paper of Heutel

guess = [k_guess,e_guess];
options = optimoptions(@fsolve,'TolFun',10e-20,'TolX',10e-20,'MaxFunctionEvaluations',2000,'display','iter');
f = @(y) Find_K_and_E(y,exo);
ss_sol  = fsolve(f,guess,options);

% Assign the Steady State value
k = real(ss_sol(1));
e = real(ss_sol(2));
eps = exo(1);
%==========================================================================
%                       Define the Endogenous Variables Part I
%==========================================================================

% Law of Motion for Total Factor Productivity
a = exp(eps/(1-RHO));

% Pollution Evolution Eq.
x = (1 + NU)/(1-ETA) * e;

% Production Function'
y = (1-D_2*x^(2)-D_1*x-D_0)*a*k^(ALPHA);

% Period Emissions Eq.
mu = 1 - (e/y^(1-GAMMA));

% Abatement Cost Eq.
z = y * THETA_1*mu^(THETA_2);

% Goods Market Clearing
c = y -DELTA*k -z; 

% F.O.C Firm w.r.t Abatement
tau = y^(GAMMA)* THETA_2*THETA_1*mu^(THETA_2-1);

% F.O.C Firm w.r.t Capital
r = (ALPHA*y/k*(1-tau*(1-mu)*(1-GAMMA)*y^(-GAMMA)-THETA_1*mu^(THETA_2)));
%==========================================================================
%                         Model Local Variables
%==========================================================================

% marginal utility of consumption 
u_c    = c^(-PHI_C);

% Marginal Marginal ullitly of consumption
u_cc   = (-PHI_C)*c^(-PHI_C-1);

% Production Function 
f      = k^(ALPHA);

% Derivative of the Production Function 
f_k      = ALPHA*k^(ALPHA-1);

% g thus relates the fraction of emissions abated to the fraction of output spent on abatement
g    = THETA_1 * mu^(THETA_2);

% Derivatives of the Firms Demand Equation
z_tau = THETA_2/(THETA_2-1) * z/tau;

z_y   = (THETA_2*(1-GAMMA)-1)/(THETA_2-1) * z/y;

e_tau  = (-1/(THETA_2 -1)) * (mu*y^(1-GAMMA))/tau;
e_y    = (1-GAMMA)*y^(-GAMMA) - (-GAMMA/(THETA_2-1)+1-GAMMA)*mu*y^(-GAMMA);

r_tau  = (-ALPHA) * (1-GAMMA)*y^(1-GAMMA)*k^(-1) ... 
            + ALPHA*(1-GAMMA)+(1+1/(THETA_2-1))*mu*y^(1-GAMMA)*k^(-1) ...
            - (ALPHA*THETA_1*THETA_2)/(THETA_2-1)*y*k^(-1)*mu^(THETA_2)*tau^(-1);

r_y    = ALPHA * k^(-1) - (ALPHA * (1-GAMMA)^(2)*tau*y^(-GAMMA)*k^(-1)) ...
            + ALPHA*(1-GAMMA)*(1-GAMMA-(GAMMA/(THETA_2-1)))*tau*mu*y^(-GAMMA)*k^(-1) ...
            - ALPHA*THETA_1*(1-THETA_2*GAMMA/(THETA_2 -1))*k^(-1)*mu^(THETA_2);

r_k     = -ALPHA*y*k^(-2)+ALPHA*(1-GAMMA)*tau*y^(1-GAMMA)*k^(-2) ...
            - ALPHA * (1-GAMMA)*tau*mu*y^(1-GAMMA)*k^(-2) ...
            + ALPHA*THETA_1*y*k^(-2)*mu^(THETA_2);

%==========================================================================
%                       Define the Endogenous Variables Part II
%==========================================================================

% F.O.C of the Government w.r.t. Tax Rate
lambda  = (-z_tau/e_tau*(e_y+(1-ETA*BETA)/(a*k^ALPHA*(2*D_2*x+D_1)))-(1-z_y))...
    *(PHI_C/c*(1-z_y)*(1-1/BETA)+r_y-(PHI_C/c*z_tau*(1/BETA-1)+r_tau)/e_tau...
    *(e_y+(1-ETA*BETA)/(a*k^ALPHA*(2*D_2*x+D_1))))^(-1);
 
% F.O.C of the Government w.r.t. Pollution Evolution
zeta    = c^(-PHI_C)*(-z_tau + lambda*(PHI_C*c^(-1)*z_tau*(1/BETA-1)+r_tau))/e_tau; 
 
% F.O.C of the Government w.r.t. Output
omega = -zeta*(1-ETA*BETA)/(a*k^ALPHA)/(2*D_2*x+D_1);

%% end own model equations

params=NaN(NumberOfParameters,1);
for iter = 1:length(M_.params) %update parameters set in the file
  eval([ 'params(' num2str(iter) ') = ' M_.param_names{iter} ';' ])
end

NumberOfEndogenousVariables = M_.orig_endo_nbr; %auxiliary variables are set automatically
for ii = 1:NumberOfEndogenousVariables
  varname = M_.endo_names{ii};
  eval(['ys(' int2str(ii) ') = ' varname ';']);
end