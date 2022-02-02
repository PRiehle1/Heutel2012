% ==============================================================================
% ==============================================================================
%                                 Declaration
% ==============================================================================
% ==============================================================================


% ==============================================================================
% Delcare the endogenous variables of the model
% ==============================================================================

var

  c       ${C}$         (long_name='Consumption')
  y       ${Y}$         (long_name='Output')
  k       ${K}$         (long_name='Capital')
  tau     ${\tau}$      (long_name='Emission Tax')
  z       ${Z}$         (long_name='Abatemnet Cost')
  mu      ${\mu}$       (long_name='Abatement')
  e       ${E}$         (long_name='Emissions')
  x       ${X}$         (long_name='Stock of Emissions')
  r       ${R}$         (long_name='Capital Rental Rate')
  a       ${A}$         (long_name='Technology/Productivity')
  lambda  ${\lambda}$   (long_name='Lagrange Multiplier')
  zeta    ${\zeta}$     (long_name='Lagrange Multiplier')
  omega   ${\omega}$    (long_name='Lagrange Multiplier')
;
% ==============================================================================
% Declare the local variables of the model
% ==============================================================================

model_local_variable

  z_y   ${Z_Y}$
  z_tau ${Z_\tau}$

  r_y   ${R_Y}$
  r_tau ${R_\tau}$
  r_k   ${R_K(\tau_{t},y_{t}, k_{t-1})}$
  r_kp  ${R_K(\tau_{t+1},y_{t+1}, k_t)}$

  e_y   ${E_y}$
  e_tau ${E_\tau}$

  u_c   ${U'(C_t)}$
  u_cc  ${U''(C_t)}$

  u_cp  ${U'(C_{t+1})}$
  u_ccp ${U''(C_{t+1})}$

  d     ${d(X_t)}$
  dp    ${d(X_{t+1})}$
  d_x   ${d'(X_T)}$

  h     ${h(Y)}$
  h_y   ${h'(Y)}$

  g     $g(\mu)$
  g_mu  $g'(\mu)$

;
% ==============================================================================
% Declare the exogenous variables of the model
% ==============================================================================

varexo
  
  eps   $\epsilon$      (long_name='Productivity Shock')

;
% ==============================================================================
% Declare the model parameters
% ==============================================================================

parameters
  ALPHA   ${\alpha}$    (long_name = 'Output Elasticity of Capital')
  BETA    ${\beta}$     (long_name = 'Discount Factor') 
  GAMMA   ${\gamma}$    (long_name = '1 - Elasticity of Emissions with respect to Output')
  DELTA   ${\delta}$    (long_name = 'Capital Depreciation Rate')
  ETA     ${\eta}$      (long_name = 'Pollution Depreciation Rate')
  THETA_1 ${\theta_1}$  (long_name = 'Abatemnet Cost Equation Parameter 1')
  THETA_2 ${\theta_2}$  (long_name = 'Abatemnet Cost Equation Parameter 2')
  NU      ${\nu}$       (long_name = 'Relation domestic to foreign emissions')
  RHO     ${\rho}$      (long_name = 'Persistence of TFP Shock')
  PHI_C   ${\phi_c}$    (long_name = 'CARA for Consumption')

  D_1     ${d_1}$       (long_name = 'Damage Parameter Emissions 1')
  D_2     ${d_2}$       (long_name = 'Damage Parameter Emissions 2')
  D_0     ${d_0}$       (long_name = 'Damage Parameter Emissions 3')
;