function [D] = PRR3_InversePosKin(P11,P12,P13,Pe,b,a,d3)
% Function to return the joint variables of the 3PRR manipulator for
% given end effector pose and manipulator geometry
sgn1 = -1;
sgn2 = 1;
sgn3 = 1;

x31 = Pe(1)+a(2,1)*cos(Pe(3)+d3(1));
x32 = Pe(1)+a(2,2)*cos(Pe(3)+d3(2));
x33 = Pe(1)+a(2,3)*cos(Pe(3)+d3(3));

y31 = Pe(2)+a(2,1)*sin(Pe(3)+d3(1));
y32 = Pe(2)+a(2,2)*sin(Pe(3)+d3(2));
y33 = Pe(2)+a(2,3)*sin(Pe(3)+d3(3));

A1 = y31-P11(2)-(x31-P11(1))*tan(b(1))+a(1,1)*tan(b(1));
B1 = 2*a(1,1);
C1 = y31-P11(2)-(x31-P11(1))*tan(b(1))-a(1,1)*tan(b(1));

A2 = y32-P12(2)-(x32-P12(1))*tan(b(2))+a(1,2)*tan(b(2));
B2 = 2*a(1,2);
C2 = y32-P12(2)-(x32-P12(1))*tan(b(2))-a(1,2)*tan(b(2));

A3 = y33-P13(2)-(x33-P13(1))*tan(b(3))+a(1,3)*tan(b(3));
B3 = 2*a(1,3);
C3 = y33-P13(2)-(x33-P13(1))*tan(b(3))-a(1,3)*tan(b(3));

if((isreal(sqrt(B1^2-4*A1*C1)))&(isreal(sqrt(B2^2-4*A2*C2)))&(isreal(sqrt(B3^2-4*A3*C3))))
t21b = 2*atan2((-B1+sgn1*sqrt(B1^2-4*A1*C1)),(2*A1));
t11 = t21b-pi;
d1 = sqrt((x31+a(1,1)*cos(t21b)-P11(1))^2+ (y31+a(1,1)*sin(t21b)-P11(2))^2);

t22b = 2*atan2((-B2+sgn2*sqrt(B2^2-4*A2*C2)),(2*A2));
t12 = t22b-pi;
d2 = sqrt((x32+a(1,2)*cos(t22b)-P12(1))^2+ (y32+a(1,2)*sin(t22b)-P12(2))^2);

t23b = 2*atan2((-B3+sgn3*sqrt(B3^2-4*A3*C3)),(2*A3));
t13 = t23b-pi;
d3 = sqrt((x33+a(1,3)*cos(t23b)-P13(1))^2+ (y33+a(1,3)*sin(t23b)-P13(2))^2);

D = [d1 d2 d3 t11 t12 t13];
else
    D = [];
end