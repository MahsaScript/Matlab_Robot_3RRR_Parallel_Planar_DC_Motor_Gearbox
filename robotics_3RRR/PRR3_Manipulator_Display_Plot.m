function [] = PRR3_Manipulator_Display(P11,P12,P13,d,b,t,a,Pe,D,dn)
% Function to display 3PRR manipulator for given link sizes and angular
% positions alongwith a plot of points in D
cla
a = a(1,:);

h11 = line([P11(1) P11(1)+d(1)*cos(b(1))], [P11(2) P11(2)+d(1)*sin(b(1))],'LineWidth',10,'Color',[0 1 0]); %Displaying
h12 = line([P11(1)+d(1)*cos(b(1)) P11(1)+d(1)*cos(b(1))+a(1)*cos(t(1))], [P11(2)+d(1)*sin(b(1)) P11(2)+d(1)*sin(b(1))+a(1)*sin(t(1))],'LineWidth',3,'Color',[1 0 0]); %Displaying
h21 = line([P12(1) P12(1)+d(2)*cos(b(2))], [P12(2) P12(2)+d(2)*sin(b(2))],'LineWidth',10,'Color',[0 1 0]); %Displaying
h22 = line([P12(1)+d(2)*cos(b(2)) P12(1)+d(2)*cos(b(2))+a(2)*cos(t(2))], [P12(2)+d(2)*sin(b(2)) P12(2)+d(2)*sin(b(2))+a(2)*sin(t(2))],'LineWidth',3,'Color',[1 0 0]); %Displaying
h31 = line([P13(1) P13(1)+d(3)*cos(b(3))], [P13(2) P13(2)+d(3)*sin(b(3))],'LineWidth',10,'Color',[0 1 0]); %Displaying
h32 = line([P13(1)+d(3)*cos(b(3)) P13(1)+d(3)*cos(b(3))+a(3)*cos(t(3))], [P13(2)+d(3)*sin(b(3)) P13(2)+d(3)*sin(b(3))+a(3)*sin(t(3))],'LineWidth',3,'Color',[1 0 0]); %Displaying

patch([P11(1)-3*cos(b(1))-0.3*sin(b(1)),P11(1)-3*cos(b(1))+0.3*sin(b(1)),P11(1)+0.3*cos(b(1))+0.3*sin(b(1)),P11(1)+0.3*cos(b(1))-0.3*sin(b(1))],...
      [P11(2)-3*sin(b(1))+0.3*cos(b(1)),P11(2)-3*sin(b(1))-0.3*cos(b(1)),P11(2)+0.3*sin(b(1))-0.3*cos(b(1)),P11(2)+0.3*sin(b(1))+0.3*cos(b(1))],...
      'k','FaceAlpha',0,'LineWidth',1);

patch([P12(1)-3*cos(b(2))-0.3*sin(b(2)),P12(1)-3*cos(b(2))+0.3*sin(b(2)),P12(1)+0.3*cos(b(2))+0.3*sin(b(2)),P12(1)+0.3*cos(b(2))-0.3*sin(b(2))],...
      [P12(2)-3*sin(b(2))+0.3*cos(b(2)),P12(2)-3*sin(b(2))-0.3*cos(b(2)),P12(2)+0.3*sin(b(2))-0.3*cos(b(2)),P12(2)+0.3*sin(b(2))+0.3*cos(b(2))],...
      'k','FaceAlpha',0,'LineWidth',1);
  
patch([P13(1)-3*cos(b(3))-0.3*sin(b(3)),P13(1)-3*cos(b(3))+0.3*sin(b(3)),P13(1)+0.3*cos(b(3))+0.3*sin(b(3)),P13(1)+0.3*cos(b(3))-0.3*sin(b(3))],...
      [P13(2)-3*sin(b(3))+0.3*cos(b(3)),P13(2)-3*sin(b(3))-0.3*cos(b(3)),P13(2)+0.3*sin(b(3))-0.3*cos(b(3)),P13(2)+0.3*sin(b(3))+0.3*cos(b(3))],...
      'k','FaceAlpha',0,'LineWidth',1);

hold on
m = patch([P11(1)+d(1)*cos(b(1))+a(1)*cos(t(1)) P12(1)+d(2)*cos(b(2))+a(2)*cos(t(2)) P13(1)+d(3)*cos(b(3))+a(3)*cos(t(3))],...
         [P11(2)+d(1)*sin(b(1))+a(1)*sin(t(1)) P12(2)+d(2)*sin(b(2))+a(2)*sin(t(2)) P13(2)+d(3)*sin(b(3))+a(3)*sin(t(3))],'b','FaceAlpha',0.25); %Displaying

rectangle('Position',[P11(1)+d(1)*cos(b(1))+a(1)*cos(t(1))-0.4,P11(2)+d(1)*sin(b(1))+a(1)*sin(t(1))-0.4,0.8,0.8],...
          'Curvature',[1,1],...
          'LineWidth',1);

rectangle('Position',[P12(1)+d(2)*cos(b(2))+a(2)*cos(t(2))-0.4,P12(2)+d(2)*sin(b(2))+a(2)*sin(t(2))-0.4,0.8,0.8],...
          'Curvature',[1,1],...
          'LineWidth',1);
      
rectangle('Position',[P13(1)+d(3)*cos(b(3))+a(3)*cos(t(3))-0.4,P13(2)+d(3)*sin(b(3))+a(3)*sin(t(3))-0.4,0.8,0.8],...
          'Curvature',[1,1],...
          'LineWidth',1);
      
rectangle('Position',[P11(1)+d(1)*cos(b(1))-0.4,P11(2)+d(1)*sin(b(1))-0.4,0.8,0.8],...
          'Curvature',[1,1],...
          'LineWidth',1);
      
rectangle('Position',[P12(1)+d(2)*cos(b(2))-0.4,P12(2)+d(2)*sin(b(2))-0.4,0.8,0.8],...
          'Curvature',[1,1],...
          'LineWidth',1)
      
rectangle('Position',[P13(1)+d(3)*cos(b(3))-0.4,P13(2)+d(3)*sin(b(3))-0.4,0.8,0.8],...
          'Curvature',[1,1],...
          'LineWidth',1)

plot(D(:,1),D(:,2),'-r','LineWidth',2);
drawnow;
if(dn==1)
    text((P11(1)+P11(1)+d(1)*cos(b(1)))/2,(P11(2)+P11(2)+d(1)*sin(b(1)))/2,'d1','FontWeight','Bold');
    text((P12(1)+P12(1)+d(2)*cos(b(2)))/2, (P12(2)+P12(2)+d(2)*sin(b(2)))/2  ,'d2','FontWeight','Bold');
    text((P13(1)+P13(1)+d(3)*cos(b(3)))/2, (P13(2)+P13(2)+d(3)*sin(b(3)))/2,'d3','FontWeight','Bold');
    text((P11(1)+d(1)*cos(b(1))+P11(1)+d(1)*cos(b(1))+a(1)*cos(t(1)))/2,(P11(2)+d(1)*sin(b(1))+P11(2)+d(1)*sin(b(1))+a(1)*sin(t(1)))/2,'a11','FontWeight','Bold');
    text((P12(1)+d(2)*cos(b(2))+P12(1)+d(2)*cos(b(2))+a(2)*cos(t(2)))/2, (P12(2)+d(2)*sin(b(2))+P12(2)+d(2)*sin(b(2))+a(2)*sin(t(2)))/2,'a12','FontWeight','Bold');
    text((P13(1)+d(3)*cos(b(3))+P13(1)+d(3)*cos(b(3))+a(3)*cos(t(3)))/2, (P13(2)+d(3)*sin(b(3))+P13(2)+d(3)*sin(b(3))+a(3)*sin(t(3)))/2,'a13','FontWeight','Bold');
    line([P11(1)+d(1)*cos(b(1))+a(1)*cos(t(1)) Pe(1)],[P11(2)+d(1)*sin(b(1))+a(1)*sin(t(1)) Pe(2)],'Color',[0 0 0]);
    text((P11(1)+d(1)*cos(b(1))+a(1)*cos(t(1))+Pe(1))/2,(P11(2)+d(1)*sin(b(1))+a(1)*sin(t(1))+Pe(2))/2,'a21','FontWeight','Bold');
    line([P12(1)+d(2)*cos(b(2))+a(2)*cos(t(2)) Pe(1)],[P12(2)+d(2)*sin(b(2))+a(2)*sin(t(2)) Pe(2)],'Color',[0 0 0]);
    text((P12(1)+d(2)*cos(b(2))+a(2)*cos(t(2))+Pe(1))/2,(P12(2)+d(2)*sin(b(2))+a(2)*sin(t(2))+Pe(2))/2,'a22','FontWeight','Bold');
    line([P13(1)+d(3)*cos(b(3))+a(3)*cos(t(3)) Pe(1)],[P13(2)+d(3)*sin(b(3))+a(3)*sin(t(3)) Pe(2)],'Color',[0 0 0]);
    text((P13(1)+d(3)*cos(b(3))+a(3)*cos(t(3))+Pe(1))/2,(P13(2)+d(3)*sin(b(3))+a(3)*sin(t(3))+Pe(2))/2,'a23','FontWeight','Bold');
end
drawnow
end