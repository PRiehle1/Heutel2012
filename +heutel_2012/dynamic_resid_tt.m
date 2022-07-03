function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 32);

T(1) = y(5)^(-params(10));
T(2) = (-params(10))*y(5)^((-params(10))-1);
T(3) = (-params(10))*y(18)^((-params(10))-1);
T(4) = y(10)^params(7);
T(5) = params(6)*T(4);
T(6) = params(6)*params(7)*y(10)^(params(7)-1);
T(7) = y(6)^(1-params(3));
T(8) = y(6)^(-params(3));
T(9) = (1-params(3))*T(8);
T(10) = params(7)/(params(7)-1)*y(9)/y(8);
T(11) = (-1)/(params(7)-1)*y(10)*T(7)/y(8);
T(12) = y(1)^(-1);
T(13) = y(8)^(-1);
T(14) = T(7)*(1-params(3))*(-params(1))*T(12)+(1-params(3))*params(1)+T(12)*T(7)*y(10)*(1+1/(params(7)-1))-T(4)*T(12)*y(6)*params(7)*params(6)*params(1)/(params(7)-1)*T(13);
T(15) = params(1)*(1-params(3))^2;
T(16) = y(8)*T(15);
T(17) = params(1)*T(12)-T(12)*T(8)*T(16)+T(12)*T(8)*y(10)*y(8)*(1-params(3))*params(1)*(1-params(3)-params(3)/(params(7)-1))-T(4)*T(12)*params(6)*params(1)*(1-params(7)*params(3)/(params(7)-1));
T(18) = y(7)^(-2);
T(19) = y(19)^(1-params(3));
T(20) = y(21)^params(7);
T(21) = (-params(1))*y(19)*T(18)+T(18)*(1-params(3))*params(1)*y(20)*T(19)-T(18)*T(19)*(1-params(3))*params(1)*y(20)*y(21)+T(18)*params(6)*params(1)*y(19)*T(20);
T(22) = params(1)*y(1)^(params(1)-1);
T(23) = y(1)^params(1);
T(24) = y(6)*T(22)/T(23);
T(25) = y(7)^(params(1)-1);
T(26) = y(18)^(-params(10))*params(2);
T(27) = 1-(params(12)*y(2)^2+y(2)*params(11)+params(13));
T(28) = y(14)*T(27);
T(29) = 1-y(9)*(params(7)*(1-params(3))-1)/(params(7)-1)/y(6);
T(30) = 1-(params(13)+params(12)*y(12)^2+params(11)*y(12));
T(31) = params(2)*y(26)*T(30);
T(32) = params(1)*y(23)*T(31);

end
