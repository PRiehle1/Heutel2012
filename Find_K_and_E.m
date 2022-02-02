function X = Find_K_and_E(guess,exo_var)

% =========================================================================
% Parameter Calibration 
% =========================================================================

ALPHA   = 0.36;
BETA    = 0.98267;
GAMMA   = 1- 0.696;
DELTA   = 0.025;
ETA     = 0.9979;
THETA_1 = 0.05607;
THETA_2 = 2.8;
NU      = 3;
RHO     = 0.95;
PHI_C   = 2;

D_2     = 1.4647*10^(-8)/(5.3024^(2));
D_1     = -6.6722*10^(-6)/5.3024;
D_0     = 1.395*10^(-3);

% IMPROVE HERE!!!
% GET THE VALUE OF THE EXOGENOUS VARIABLES
eps = exo_var;

%==========================================================================
%                               Initial Guess
%==========================================================================

k = guess(1);
e = guess(2);


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
            + ALPHA*(1-GAMMA)+(1+1/(THETA_2-1))*mu*y^(1-GAMMA)*(k^(-1)) ...
            - (ALPHA*THETA_1*THETA_2)/(THETA_2-1)*y*(k^(-1))*mu^(THETA_2)*(tau^(-1));

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
%==========================================================================
%                         Equations to solve for
%==========================================================================

% F.O.C Firm w.r.t Capital
X(1) = 1/BETA + DELTA -1 -r;

% F.O.C of the Government w.r.t. Capital
X(2) = - u_c + BETA*u_c *(1-DELTA) + lambda*(-u_cc*(1-DELTA)*BETA) ...
        + lambda*(u_cc + BETA* u_cc*(1-DELTA)*(r+1-DELTA) + BETA * u_c*r_k) ...
        + lambda*(-u_cc*(r +1 -DELTA)) - omega*BETA *(1-(D_2*x^(2)+D_1*x+D_0))*a*ALPHA*k^(ALPHA-1);



