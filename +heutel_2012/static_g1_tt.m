function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

assert(length(T) >= 38);

T = heutel_2012.static_resid_tt(T, y, x, params);

T(24) = getPowerDeriv(y(1),(-params(10)),1);
T(25) = (-params(10))*getPowerDeriv(y(1),(-params(10))-1,1);
T(26) = getPowerDeriv(y(2),(-params(3)),1);
T(27) = (1-params(3))*T(26);
T(28) = getPowerDeriv(y(2),1-params(3),1);
T(29) = (-((-(y(5)*(params(7)*(1-params(3))-1)/(params(7)-1)))/(y(2)*y(2))));
T(30) = getPowerDeriv(y(3),params(1)-1,1);
T(31) = getPowerDeriv(y(3),params(1),1);
T(32) = getPowerDeriv(y(3),(-1),1);
T(33) = getPowerDeriv(y(3),(-2),1);
T(34) = (-(y(5)*params(7)/(params(7)-1)))/(y(4)*y(4));
T(35) = params(7)/(params(7)-1)/y(4);
T(36) = (-((params(7)*(1-params(3))-1)/(params(7)-1)/y(2)));
T(37) = getPowerDeriv(y(6),params(7),1);
T(38) = params(6)*T(37);

end
