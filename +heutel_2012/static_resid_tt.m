function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 23);

T(1) = y(5)*params(7)/(params(7)-1)/y(4);
T(2) = y(3)^(-1);
T(3) = y(2)^(-params(3));
T(4) = params(1)*(1-params(3))^2;
T(5) = y(4)*T(4);
T(6) = y(6)^params(7);
T(7) = params(1)*T(2)-T(2)*T(3)*T(5)+T(2)*T(3)*y(6)*y(4)*(1-params(3))*params(1)*(1-params(3)-params(3)/(params(7)-1))-T(6)*T(2)*params(1)*params(6)*(1-params(7)*params(3)/(params(7)-1));
T(8) = y(2)^(1-params(3));
T(9) = y(4)^(-1);
T(10) = (1-params(3))*params(1)+T(2)*T(8)*(1-params(3))*(-params(1))+T(2)*T(8)*y(6)*(1+1/(params(7)-1))-T(6)*T(2)*y(2)*params(7)*params(1)*params(6)/(params(7)-1)*T(9);
T(11) = y(3)^(-2);
T(12) = y(2)*(-params(1))*T(11)+T(11)*T(8)*y(4)*(1-params(3))*params(1)-T(11)*T(8)*y(6)*y(4)*(1-params(3))*params(1)+T(6)*T(11)*y(2)*params(1)*params(6);
T(13) = (1-params(3))*T(3);
T(14) = (-1)/(params(7)-1)*y(6)*T(8)/y(4);
T(15) = y(1)^(-params(10));
T(16) = (-params(10))*y(1)^((-params(10))-1);
T(17) = T(6)*params(6);
T(18) = params(7)*params(6)*y(6)^(params(7)-1);
T(19) = y(3)^(params(1)-1);
T(20) = y(3)^params(1);
T(21) = y(2)*params(1)*T(19)/T(20);
T(22) = 1-(params(12)*y(8)^2+y(8)*params(11)+params(13));
T(23) = 1-y(5)*(params(7)*(1-params(3))-1)/(params(7)-1)/y(2);

end
