function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = heutel_2012.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(13, 27);
g1(1,3)=(-(params(9)*1/y(3)));
g1(1,14)=1/y(14);
g1(1,27)=(-1);
g1(2,6)=(-((1-T(9)*y(8)*(1-y(10))-T(5))*T(22)/T(23)+T(24)*(-(y(8)*(1-y(10))*T(38)))));
g1(2,1)=(-((1-T(9)*y(8)*(1-y(10))-T(5))*(T(23)*y(6)*params(1)*getPowerDeriv(y(1),params(1)-1,1)-y(6)*T(22)*T(42))/(T(23)*T(23))));
g1(2,8)=(-(T(24)*(-(T(9)*(1-y(10))))));
g1(2,10)=(-(T(24)*((-(T(9)*(-y(8))))-T(49))));
g1(2,13)=1;
g1(3,6)=y(8)*T(39)-T(6);
g1(3,8)=T(7);
g1(3,10)=(-(y(6)*params(6)*params(7)*getPowerDeriv(y(10),params(7)-1,1)));
g1(4,5)=T(33);
g1(4,18)=(-((y(22)+1-params(4))*T(35)));
g1(4,22)=(-T(26));
g1(5,5)=1;
g1(5,6)=(-1);
g1(5,1)=(-(1-params(4)));
g1(5,7)=1;
g1(5,9)=1;
g1(6,11)=(-(1+params(8)));
g1(6,2)=(-params(5));
g1(6,12)=1;
g1(7,6)=1;
g1(7,1)=(-(T(28)*T(42)));
g1(7,2)=(-(T(23)*y(14)*(-(params(11)+params(12)*2*y(2)))));
g1(7,14)=(-(T(23)*T(27)));
g1(8,6)=(-((1-y(10))*T(39)));
g1(8,10)=T(7);
g1(8,11)=1;
g1(9,6)=(-T(5));
g1(9,9)=1;
g1(9,10)=(-(y(6)*T(49)));
g1(10,5)=T(10)*T(33)-(T(10)*y(15)*T(34)+y(4)*((1+y(13)-params(4))*(-T(10))*T(34)+T(14)*T(33)));
g1(10,6)=(-(y(4)*T(1)*(T(12)*(1-params(3))*(-params(1))*T(39)+T(12)*y(10)*(1+1/(params(7)-1))*T(39)-T(13)*T(4)*T(12)*params(7)*params(6)*params(1)/(params(7)-1))+y(16)*(-((-1)/(params(7)-1)*y(10)*T(39)/y(8)))));
g1(10,1)=(-(y(4)*T(1)*(T(7)*(1-params(3))*(-params(1))*T(43)+T(7)*y(10)*(1+1/(params(7)-1))*T(43)-T(13)*T(4)*y(6)*params(7)*params(6)*params(1)/(params(7)-1)*T(43))));
g1(10,8)=T(1)*T(45)-(T(2)*y(15)*T(45)+y(4)*((1+y(13)-params(4))*T(2)*(-T(45))+T(1)*(-(T(4)*T(12)*y(6)*params(7)*params(6)*params(1)/(params(7)-1)*getPowerDeriv(y(8),(-1),1))))+y(16)*(-((-((-1)/(params(7)-1)*y(10)*T(7)))/(y(8)*y(8)))));
g1(10,9)=T(1)*T(46)-(T(2)*y(15)*T(46)+y(4)*(1+y(13)-params(4))*T(2)*(-T(46)));
g1(10,10)=(-(y(4)*T(1)*(T(12)*T(7)*(1+1/(params(7)-1))-T(13)*T(12)*y(6)*params(7)*params(6)*params(1)/(params(7)-1)*T(48))+y(16)*(-(T(7)*(-1)/(params(7)-1)/y(8)))));
g1(10,13)=(-(y(4)*T(2)*(-T(10))));
g1(10,4)=(-((1+y(13)-params(4))*T(2)*(-T(10))+T(1)*T(14)));
g1(10,15)=(-(T(2)*T(10)));
g1(10,16)=T(11);
g1(11,1)=(-((params(11)+y(2)*2*params(12))*y(14)*y(17)*T(42)));
g1(11,2)=(-(2*params(12)*T(23)*y(14)*y(17)));
g1(11,14)=(-((params(11)+y(2)*2*params(12))*T(23)*y(17)));
g1(11,16)=(-1);
g1(11,25)=params(2)*params(5);
g1(11,17)=(-((params(11)+y(2)*2*params(12))*y(14)*T(23)));
g1(12,5)=(-(T(29)*T(33)+T(29)*y(15)*(-T(34))+y(4)*((1+y(13)-params(4))*T(29)*T(34)+T(17)*T(33))));
g1(12,6)=y(16)*(T(38)-y(10)*(1+(-params(3))/(params(7)-1)-params(3))*T(37))-(T(1)*T(40)+y(15)*(-T(2))*T(40)+y(4)*((1+y(13)-params(4))*T(2)*T(40)+T(1)*(T(12)*y(10)*y(8)*(1-params(3))*params(1)*(1-params(3)-params(3)/(params(7)-1))*T(37)-T(12)*T(16)*T(37))));
g1(12,1)=(-(y(4)*T(1)*(params(1)*T(43)-T(8)*T(16)*T(43)+T(8)*y(10)*y(8)*(1-params(3))*params(1)*(1-params(3)-params(3)/(params(7)-1))*T(43)-T(4)*params(6)*params(1)*(1-params(7)*params(3)/(params(7)-1))*T(43))));
g1(12,8)=(-(y(4)*T(1)*(T(12)*T(8)*y(10)*(1-params(3))*params(1)*(1-params(3)-params(3)/(params(7)-1))-T(12)*T(8)*T(15))));
g1(12,9)=(-(T(1)*T(47)+y(15)*(-T(2))*T(47)+y(4)*(1+y(13)-params(4))*T(2)*T(47)));
g1(12,10)=y(16)*(-(T(8)*(1+(-params(3))/(params(7)-1)-params(3))))-y(4)*T(1)*(T(12)*T(8)*y(8)*(1-params(3))*params(1)*(1-params(3)-params(3)/(params(7)-1))-T(12)*params(6)*params(1)*(1-params(7)*params(3)/(params(7)-1))*T(48));
g1(12,13)=(-(y(4)*T(2)*T(29)));
g1(12,4)=(-((1+y(13)-params(4))*T(2)*T(29)+T(1)*T(17)));
g1(12,15)=(-(T(29)*(-T(2))));
g1(12,16)=T(9)-T(8)*y(10)*(1+(-params(3))/(params(7)-1)-params(3));
g1(12,17)=(-1);
g1(13,5)=T(33)-(y(15)*T(34)+y(4)*(1+y(13)-params(4))*(-T(34)));
g1(13,18)=(-((1-params(4))*T(35)+y(24)*params(2)*(1-params(4))*(-T(36))+y(15)*((1+y(22)-params(4))*(1-params(4))*params(2)*T(36)+T(21)*T(35))));
g1(13,19)=(-(y(15)*T(26)*((-params(1))*T(18)+T(18)*(1-params(3))*params(1)*y(20)*T(41)-T(18)*(1-params(3))*params(1)*y(20)*y(21)*T(41)+T(20)*params(6)*params(1)*T(18))));
g1(13,7)=(-(y(15)*T(26)*((-params(1))*y(19)*T(44)+(1-params(3))*params(1)*y(20)*T(19)*T(44)-T(19)*(1-params(3))*params(1)*y(20)*y(21)*T(44)+T(20)*params(6)*params(1)*y(19)*T(44))-T(32)*getPowerDeriv(y(7),params(1)-1,1)));
g1(13,20)=(-(y(15)*T(26)*(T(18)*(1-params(3))*params(1)*T(19)-T(18)*T(19)*(1-params(3))*params(1)*y(21))));
g1(13,21)=(-(y(15)*T(26)*(T(18)*params(6)*params(1)*y(19)*getPowerDeriv(y(21),params(7),1)-T(18)*(1-params(3))*params(1)*y(20)*T(19))));
g1(13,12)=T(25)*params(1)*y(23)*params(2)*y(26)*(-(params(11)+params(12)*2*y(12)));
g1(13,13)=(-(y(4)*(-T(2))));
g1(13,22)=(-(y(15)*(1-params(4))*T(3)*params(2)));
g1(13,23)=T(25)*params(1)*T(31);
g1(13,4)=(-((1+y(13)-params(4))*(-T(2))));
g1(13,15)=(-(T(2)+(1+y(22)-params(4))*(1-params(4))*T(3)*params(2)+T(21)*T(26)));
g1(13,24)=(-(params(2)*(1-params(4))*(-T(3))));
g1(13,26)=T(25)*params(1)*y(23)*params(2)*T(30);

end
