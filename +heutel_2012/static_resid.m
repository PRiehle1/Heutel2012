function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = heutel_2012.static_resid_tt(T, y, x, params);
end
residual = zeros(13, 1);
lhs = log(y(10));
rhs = log(y(10))*params(9)+x(1);
residual(1) = lhs - rhs;
lhs = y(9);
rhs = T(21)*(1-T(13)*y(4)*(1-y(6))-T(17));
residual(2) = lhs - rhs;
lhs = y(4)*T(8);
rhs = y(2)*T(18);
residual(3) = lhs - rhs;
lhs = T(15);
rhs = (y(9)+1-params(4))*T(15)*params(2);
residual(4) = lhs - rhs;
lhs = y(1);
rhs = y(2)-y(3)+y(3)*(1-params(4))-y(5);
residual(5) = lhs - rhs;
lhs = y(8);
rhs = y(8)*params(5)+(1+params(8))*y(7);
residual(6) = lhs - rhs;
lhs = y(2);
rhs = T(20)*y(10)*T(22);
residual(7) = lhs - rhs;
lhs = y(7);
rhs = T(8)*(1-y(6));
residual(8) = lhs - rhs;
lhs = y(5);
rhs = y(2)*T(17);
residual(9) = lhs - rhs;
lhs = T(1)*T(15);
rhs = T(1)*T(16)*y(11)+y(11)*((1+y(9)-params(4))*T(16)*(-T(1))+T(10)*T(15))+y(12)*(-T(14));
residual(10) = lhs - rhs;
lhs = y(12)*params(2)*params(5);
rhs = y(12)+(params(11)+y(8)*2*params(12))*T(20)*y(10)*y(13);
residual(11) = lhs - rhs;
lhs = (T(13)-T(3)*y(6)*(1+(-params(3))/(params(7)-1)-params(3)))*y(12);
rhs = y(13)+T(15)*T(23)+T(23)*y(11)*(-T(16))+y(11)*((1+y(9)-params(4))*T(16)*T(23)+T(7)*T(15));
residual(12) = lhs - rhs;
lhs = T(15);
rhs = (1-params(4))*T(15)*params(2)+y(11)*params(2)*(1-params(4))*(-T(16))+y(11)*(T(16)+(1+y(9)-params(4))*(1-params(4))*T(16)*params(2)+T(12)*T(15)*params(2))+y(11)*(1+y(9)-params(4))*(-T(16))-T(19)*params(1)*y(10)*T(22)*params(2)*y(13);
residual(13) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
