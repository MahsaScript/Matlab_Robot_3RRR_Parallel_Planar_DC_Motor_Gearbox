function [P] = PRR3_ForwardPosKin(x0,P11,P12,P13,d,b,a,d3,n_limit)
% Function to return the position of the 3PRR manipulator end effector for
% given manipulator geometry and joint variables
ni = 0;
sgn = 1;
%x -> xe ye phie t11 t12 t13
Kin_Eqn = @(x) [P11(1)+d(1)*cos(b(1))+a(1,1)*cos(x(4))-x(1)-a(2,1)*cos(x(3)+d3(1));
    P11(2)+d(1)*sin(b(1))+a(1,1)*sin(x(4))-x(2)-a(2,1)*sin(x(3)+d3(1));
    P12(1)+d(2)*cos(b(2))+a(1,2)*cos(x(5))-x(1)-a(2,2)*cos(x(3)+d3(2));
    P12(2)+d(2)*sin(b(2))+a(1,2)*sin(x(5))-x(2)-a(2,2)*sin(x(3)+d3(2));
    P13(1)+d(3)*cos(b(3))+a(1,3)*cos(x(6))-x(1)-a(2,3)*cos(x(3)+d3(3));
    P13(2)+d(3)*sin(b(3))+a(1,3)*sin(x(6))-x(2)-a(2,3)*sin(x(3)+d3(3))];
f1 = [0 0 0 0 0 0]';
options=optimset('MaxFunEvals',1000,'Display','Off');   % Option to display output
[P, fval, exitflag] = fsolve(Kin_Eqn,x0,options);
while(exitflag<1 & ni<n_limit)
    [P, fval, exitflag] = fsolve(Kin_Eqn,x0,options);
    f2 = fval;
%     if(ni/2==uint8(ni/2))% Alternate Algorithms tried
%         sgn = -1;
%     else
%         sgn = +1;
%     end
%     sgn = [sign(f1-f2)]'
%     x0(1:2) = x0(1:2) + sgn(1:2)*0.1;
%     x0(3) = x0(3) + sgn(3)*ni*0.01;
%     x0(4:6) = x0(4:6) + sgn(4:6)*ni*0.01;
    x0(1:2) = x0(1:2) + sgn*0.1;
    x0(3) = x0(3) + sgn*ni*0.01;
    x0(4:6) = x0(4:6) + sgn*ni*0.01;
    ni = ni+1;
    f1 = f2;
end
if(ni==n_limit)
    P = [];
end