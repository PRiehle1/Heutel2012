% ==============================================================================
% ==============================================================================
%                                 THE MODEL
% ==============================================================================
% ==============================================================================



model; 
% =============================================================================
% Model Local Variables 
% =============================================================================

% marginal utility of consumption 
#u_c    = c^(-PHI_C);
#u_cp   = c(+1)^(-PHI_C);

% Marginal Marginal ullitly of consumption
#u_cc   = (-PHI_C)*c^(-PHI_C-1);
#u_ccp   = (-PHI_C)*c(+1)^(-PHI_C-1);


% g thus relates the fraction of emissions abated to the fraction of output spent on abatement
#g    = THETA_1 * mu^(THETA_2);
#g_mu = THETA_2*THETA_1 * mu^(THETA_2-1);

% Emissions related to Output
#h   = y^(1-GAMMA);
#h_y = (1-GAMMA)*y^(-GAMMA);

% Damage Function 
#d   = D_2*x(-1)^(2) + D_1*x(-1) + D_0;
#dp  = D_2*x^(2) + D_1*x + D_0;
#d_x = 2*D_2*x(-1) + D_1;


% Derivatives of the Firms Demand Equation
#z_tau = THETA_2/(THETA_2-1) * z/tau;
#z_y   = (THETA_2*(1-GAMMA)-1)/(THETA_2-1) * z/y;

#e_tau  = (-1/(THETA_2 -1)) * (mu*y^(1-GAMMA))/tau;
#e_y    = (1-GAMMA)*y^(-GAMMA) - (-GAMMA/(THETA_2-1)+1-GAMMA)*mu*y^(-GAMMA);

#r_tau  = (-ALPHA) * (1-GAMMA)*y^(1-GAMMA)*k(-1)^(-1)
            + ALPHA*(1-GAMMA)+(1+1/(THETA_2-1))*mu*y^(1-GAMMA)*k(-1)^(-1) 
            - (ALPHA*THETA_1*THETA_2)/(THETA_2-1)*y*k(-1)^(-1)*mu^(THETA_2)*tau^(-1);

#r_y    = ALPHA * k(-1)^(-1) - (ALPHA * (1-GAMMA)^(2)*tau*y^(-GAMMA)*k(-1)^(-1))
            + ALPHA*(1-GAMMA)*(1-GAMMA-(GAMMA/(THETA_2-1)))*tau*mu*y^(-GAMMA)*k(-1)^(-1) 
            - ALPHA*THETA_1*(1-THETA_2*GAMMA/(THETA_2 -1))*k(-1)^(-1)*mu^(THETA_2);

#r_k     = -ALPHA*y*k(-1)^(-2)+ALPHA*(1-GAMMA)*tau*y^(1-GAMMA)*k(-1)^(-2) 
            - ALPHA * (1-GAMMA)*tau*mu*y^(1-GAMMA)*k(-1)^(-2) 
            + ALPHA*THETA_1*y*k(-1)^(-2)*mu^(THETA_2);

#r_kp    = -ALPHA*y(+1)*k^(-2)+ALPHA*(1-GAMMA)*tau(+1)*y(+1)^(1-GAMMA)*k^(-2) 
            - ALPHA * (1-GAMMA)*tau(+1)*mu(+1)*y(+1)^(1-GAMMA)*k^(-2) 
            + ALPHA*THETA_1*y(+1)*k^(-2)*mu(+1)^(THETA_2);

% ==============================================================================
% Total Factor Productivity
% ==============================================================================

[name = 'Law of Motion for Total Factor Productivity']
log(a) = RHO * log(a(-1)) + eps;

% ==============================================================================
% F.O.Cs of the representative Firm 
% ==============================================================================
[name = 'F.O.C Firm w.r.t Capital']
r = y * (ALPHA*k(-1)^(ALPHA-1))/(k(-1)^(ALPHA)) * (1 - (tau *(1-mu)*h_y) - g);

[name = 'F.O.C Firm w.r.t Abatement']
tau * h = y * g_mu;

% ==============================================================================
% F.O.C  of the Household
% ==============================================================================

[name = 'F.O.C Household (Euler Capital Equation)']
u_c = BETA * u_cp * (r(+1) + (1-DELTA));

% ==============================================================================
% Goods Market Clearing
% ==============================================================================

[name = 'Goods Market Clearing']
c = y - k + (1-DELTA)*k(-1) - z;

% ==============================================================================
% Pollution Evolution Equation
% ==============================================================================

[name = 'Pollution Evolution Eq.']
x = ETA*x(-1) + (1+NU)*e;

% ==============================================================================
% Production Function
% ==============================================================================

[name = 'Production Function']
y = (1-d)* a * k(-1)^(ALPHA);

% ==============================================================================
% Emission in Period t
% ==============================================================================

[name = 'Period Emissions Eq.']
e = (1-mu) *h;

% ==============================================================================
% Abatemnet Cost
% ==============================================================================

[name = 'Abatement Cost Eq.']
z = y * g;

% ==============================================================================
% F.O.Cs of the Government
% ==============================================================================

[name = 'F.O.C of the Social Planer w.r.t. Tax Rate']
u_c*z_tau = lambda * u_cc*z_tau + lambda(-1)*(u_cc*(-z_tau)*(r+1-DELTA)+ u_c*r_tau) + zeta*(-e_tau);

[name = 'F.O.C of the Social Planer w.r.t. Pollution Stock']
ETA*BETA*zeta(+1) = zeta + omega * a * k(-1)^(ALPHA) * (2*D_2*x(-1) + D_1);

[name = 'F.O.C of the Social Planer w.r.t. output']
zeta*(e_y) = u_c*(1-z_y) + lambda*(-u_cc)*(1-z_y) + lambda(-1)*(u_cc*(1-z_y)*(r + 1 - DELTA) + u_c*r_y)  + omega;

[name = 'F.O.C of the Social Planer w.r.t. capital']
u_c = BETA*u_cp *(1-DELTA) + lambda(+1)*(-u_ccp*(1-DELTA)*BETA) 
        + lambda*(u_cc + BETA* u_ccp*(1-DELTA)*(r(+1)+1-DELTA) + BETA * u_cp*r_kp) 
        + lambda(-1)*(-u_cc*(r +1 -DELTA)) - omega(+1)*BETA *(1-dp)*a(+1)*ALPHA*k^(ALPHA-1);

end;