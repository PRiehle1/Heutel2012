function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = heutel_2012.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(13, 1);
lhs = log(y(14));
rhs = params(9)*log(y(3))+x(it_, 1);
residual(1) = lhs - rhs;
lhs = y(13);
rhs = T(24)*(1-T(9)*y(8)*(1-y(10))-T(5));
residual(2) = lhs - rhs;
lhs = T(7)*y(8);
rhs = T(6)*y(6);
residual(3) = lhs - rhs;
lhs = T(1);
rhs = (y(22)+1-params(4))*T(26);
residual(4) = lhs - rhs;
lhs = y(5);
rhs = y(6)-y(7)+y(1)*(1-params(4))-y(9);
residual(5) = lhs - rhs;
lhs = y(12);
rhs = y(2)*params(5)+(1+params(8))*y(11);
residual(6) = lhs - rhs;
lhs = y(6);
rhs = T(23)*T(28);
residual(7) = lhs - rhs;
lhs = y(11);
rhs = T(7)*(1-y(10));
residual(8) = lhs - rhs;
lhs = y(9);
rhs = T(5)*y(6);
residual(9) = lhs - rhs;
lhs = T(1)*T(10);
rhs = T(10)*T(2)*y(15)+y(4)*((1+y(13)-params(4))*T(2)*(-T(10))+T(1)*T(14))+y(16)*(-T(11));
residual(10) = lhs - rhs;
lhs = params(2)*params(5)*y(25);
rhs = y(16)+(params(11)+y(2)*2*params(12))*T(23)*y(14)*y(17);
residual(11) = lhs - rhs;
lhs = (T(9)-T(8)*y(10)*(1+(-params(3))/(params(7)-1)-params(3)))*y(16);
rhs = y(17)+T(1)*T(29)+T(29)*y(15)*(-T(2))+y(4)*((1+y(13)-params(4))*T(2)*T(29)+T(1)*T(17));
residual(12) = lhs - rhs;
lhs = T(1);
rhs = (1-params(4))*T(26)+y(24)*params(2)*(1-params(4))*(-T(3))+y(15)*(T(2)+(1+y(22)-params(4))*(1-params(4))*T(3)*params(2)+T(21)*T(26))+y(4)*(1+y(13)-params(4))*(-T(2))-T(25)*T(32);
residual(13) = lhs - rhs;

end
