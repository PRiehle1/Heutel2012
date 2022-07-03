function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = heutel_2012.static_g1_tt(T, y, x, params);
end
g1 = zeros(13, 13);
g1(1,10)=1/y(10)-params(9)*1/y(10);
g1(2,2)=(-((1-T(13)*y(4)*(1-y(6))-T(17))*params(1)*T(19)/T(20)+T(21)*(-(y(4)*(1-y(6))*T(27)))));
g1(2,3)=(-((1-T(13)*y(4)*(1-y(6))-T(17))*(T(20)*y(2)*params(1)*T(30)-y(2)*params(1)*T(19)*T(31))/(T(20)*T(20))));
g1(2,4)=(-(T(21)*(-(T(13)*(1-y(6))))));
g1(2,6)=(-(T(21)*((-(T(13)*(-y(4))))-T(38))));
g1(2,9)=1;
g1(3,2)=y(4)*T(28)-T(18);
g1(3,4)=T(8);
g1(3,6)=(-(y(2)*params(7)*params(6)*getPowerDeriv(y(6),params(7)-1,1)));
g1(4,1)=T(24)-(y(9)+1-params(4))*params(2)*T(24);
g1(4,9)=(-(T(15)*params(2)));
g1(5,1)=1;
g1(5,2)=(-1);
g1(5,3)=(-(1-params(4)-1));
g1(5,5)=1;
g1(6,7)=(-(1+params(8)));
g1(6,8)=1-params(5);
g1(7,2)=1;
g1(7,3)=(-(y(10)*T(22)*T(31)));
g1(7,8)=(-(T(20)*y(10)*(-(params(11)+params(12)*2*y(8)))));
g1(7,10)=(-(T(20)*T(22)));
g1(8,2)=(-((1-y(6))*T(28)));
g1(8,6)=T(8);
g1(8,7)=1;
g1(9,2)=(-T(17));
g1(9,5)=1;
g1(9,6)=(-(y(2)*T(38)));
g1(10,1)=T(1)*T(24)-(T(1)*y(11)*T(25)+y(11)*((1+y(9)-params(4))*(-T(1))*T(25)+T(10)*T(24)));
g1(10,2)=(-(y(11)*T(15)*(T(2)*(1-params(3))*(-params(1))*T(28)+T(2)*y(6)*(1+1/(params(7)-1))*T(28)-T(9)*T(6)*T(2)*params(7)*params(1)*params(6)/(params(7)-1))+y(12)*(-((-1)/(params(7)-1)*y(6)*T(28)/y(4)))));
g1(10,3)=(-(y(11)*T(15)*(T(8)*(1-params(3))*(-params(1))*T(32)+T(8)*y(6)*(1+1/(params(7)-1))*T(32)-T(9)*T(6)*y(2)*params(7)*params(1)*params(6)/(params(7)-1)*T(32))));
g1(10,4)=T(15)*T(34)-(T(16)*y(11)*T(34)+y(11)*((1+y(9)-params(4))*T(16)*(-T(34))+T(15)*(-(T(6)*T(2)*y(2)*params(7)*params(1)*params(6)/(params(7)-1)*getPowerDeriv(y(4),(-1),1))))+y(12)*(-((-((-1)/(params(7)-1)*y(6)*T(8)))/(y(4)*y(4)))));
g1(10,5)=T(15)*T(35)-(T(16)*y(11)*T(35)+y(11)*(1+y(9)-params(4))*T(16)*(-T(35)));
g1(10,6)=(-(y(11)*T(15)*(T(2)*T(8)*(1+1/(params(7)-1))-T(9)*T(2)*y(2)*params(7)*params(1)*params(6)/(params(7)-1)*T(37))+y(12)*(-(T(8)*(-1)/(params(7)-1)/y(4)))));
g1(10,9)=(-(y(11)*T(16)*(-T(1))));
g1(10,11)=(-((1+y(9)-params(4))*T(16)*(-T(1))+T(10)*T(15)+T(1)*T(16)));
g1(10,12)=T(14);
g1(11,3)=(-((params(11)+y(8)*2*params(12))*y(10)*y(13)*T(31)));
g1(11,8)=(-(2*params(12)*T(20)*y(10)*y(13)));
g1(11,10)=(-((params(11)+y(8)*2*params(12))*T(20)*y(13)));
g1(11,12)=params(2)*params(5)-1;
g1(11,13)=(-((params(11)+y(8)*2*params(12))*y(10)*T(20)));
g1(12,1)=(-(T(23)*T(24)+T(23)*y(11)*(-T(25))+y(11)*((1+y(9)-params(4))*T(23)*T(25)+T(7)*T(24))));
g1(12,2)=y(12)*(T(27)-y(6)*(1+(-params(3))/(params(7)-1)-params(3))*T(26))-(T(15)*T(29)+y(11)*(-T(16))*T(29)+y(11)*((1+y(9)-params(4))*T(16)*T(29)+T(15)*(T(2)*y(6)*y(4)*(1-params(3))*params(1)*(1-params(3)-params(3)/(params(7)-1))*T(26)-T(2)*T(5)*T(26))));
g1(12,3)=(-(y(11)*T(15)*(params(1)*T(32)-T(3)*T(5)*T(32)+T(3)*y(6)*y(4)*(1-params(3))*params(1)*(1-params(3)-params(3)/(params(7)-1))*T(32)-T(6)*params(1)*params(6)*(1-params(7)*params(3)/(params(7)-1))*T(32))));
g1(12,4)=(-(y(11)*T(15)*(T(2)*T(3)*y(6)*(1-params(3))*params(1)*(1-params(3)-params(3)/(params(7)-1))-T(2)*T(3)*T(4))));
g1(12,5)=(-(T(15)*T(36)+y(11)*(-T(16))*T(36)+y(11)*(1+y(9)-params(4))*T(16)*T(36)));
g1(12,6)=y(12)*(-(T(3)*(1+(-params(3))/(params(7)-1)-params(3))))-y(11)*T(15)*(T(2)*T(3)*y(4)*(1-params(3))*params(1)*(1-params(3)-params(3)/(params(7)-1))-T(2)*params(1)*params(6)*(1-params(7)*params(3)/(params(7)-1))*T(37));
g1(12,9)=(-(y(11)*T(16)*T(23)));
g1(12,11)=(-((1+y(9)-params(4))*T(16)*T(23)+T(7)*T(15)+T(23)*(-T(16))));
g1(12,12)=T(13)-T(3)*y(6)*(1+(-params(3))/(params(7)-1)-params(3));
g1(12,13)=(-1);
g1(13,1)=T(24)-((1-params(4))*params(2)*T(24)+y(11)*params(2)*(1-params(4))*(-T(25))+y(11)*(T(25)+(1+y(9)-params(4))*(1-params(4))*params(2)*T(25)+T(12)*params(2)*T(24))+y(11)*(1+y(9)-params(4))*(-T(25)));
g1(13,2)=(-(y(11)*T(15)*params(2)*((-params(1))*T(11)+T(11)*y(4)*(1-params(3))*params(1)*T(28)-T(11)*y(6)*y(4)*(1-params(3))*params(1)*T(28)+T(6)*params(1)*params(6)*T(11))));
g1(13,3)=(-(y(11)*T(15)*params(2)*(y(2)*(-params(1))*T(33)+T(8)*y(4)*(1-params(3))*params(1)*T(33)-T(8)*y(6)*y(4)*(1-params(3))*params(1)*T(33)+T(6)*y(2)*params(1)*params(6)*T(33))-params(1)*y(10)*T(22)*params(2)*y(13)*T(30)));
g1(13,4)=(-(y(11)*T(15)*params(2)*(T(11)*(1-params(3))*params(1)*T(8)-T(11)*T(8)*y(6)*(1-params(3))*params(1))));
g1(13,6)=(-(y(11)*T(15)*params(2)*(T(11)*y(2)*params(1)*params(6)*T(37)-T(11)*T(8)*y(4)*(1-params(3))*params(1))));
g1(13,8)=T(19)*params(1)*y(10)*params(2)*y(13)*(-(params(11)+params(12)*2*y(8)));
g1(13,9)=(-(y(11)*(-T(16))+y(11)*(1-params(4))*T(16)*params(2)));
g1(13,10)=T(19)*params(1)*T(22)*params(2)*y(13);
g1(13,11)=(-((1+y(9)-params(4))*(-T(16))+params(2)*(1-params(4))*(-T(16))+T(16)+(1+y(9)-params(4))*(1-params(4))*T(16)*params(2)+T(12)*T(15)*params(2)));
g1(13,13)=T(19)*params(1)*y(10)*params(2)*T(22);
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
