function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 49);

T = heutel_2012.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(33) = getPowerDeriv(y(5),(-params(10)),1);
T(34) = (-params(10))*getPowerDeriv(y(5),(-params(10))-1,1);
T(35) = params(2)*getPowerDeriv(y(18),(-params(10)),1);
T(36) = (-params(10))*getPowerDeriv(y(18),(-params(10))-1,1);
T(37) = getPowerDeriv(y(6),(-params(3)),1);
T(38) = (1-params(3))*T(37);
T(39) = getPowerDeriv(y(6),1-params(3),1);
T(40) = (-((-(y(9)*(params(7)*(1-params(3))-1)/(params(7)-1)))/(y(6)*y(6))));
T(41) = getPowerDeriv(y(19),1-params(3),1);
T(42) = getPowerDeriv(y(1),params(1),1);
T(43) = getPowerDeriv(y(1),(-1),1);
T(44) = getPowerDeriv(y(7),(-2),1);
T(45) = (-(params(7)/(params(7)-1)*y(9)))/(y(8)*y(8));
T(46) = params(7)/(params(7)-1)/y(8);
T(47) = (-((params(7)*(1-params(3))-1)/(params(7)-1)/y(6)));
T(48) = getPowerDeriv(y(10),params(7),1);
T(49) = params(6)*T(48);

end
