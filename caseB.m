%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005
clear
clc
	global CL CD S m g rho	
	S		=	0.017;			% Reference Area, m^2
	AR		=	0.86;			% Wing Aspect Ratio
	e		=	0.9;			% Oswald Efficiency Factor;
	m		=	0.003;			% Mass, kg
	g		=	9.8;			% Gravitational acceleration, m/s^2
	rho		=	1.225;			% Air density at Sea Level, kg/m^3	
	CLa		=	3.141592 * AR/(1 + sqrt(1 + (AR / 2)^2));
							% Lift-Coefficient Slope, per rad
	CDo		=	0.02;			% Zero-Lift Drag Coefficient
	epsilon	=	1 / (3.141592 * e * AR);% Induced Drag Factor	
	CL		=	sqrt(CDo / epsilon);	% CL for Maximum Lift/Drag Ratio
	CD		=	CDo + epsilon * CL^2;	% Corresponding CD
	LDmax	=	CL / CD;			% Maximum Lift/Drag Ratio
	Gam		=	-atan(1 / LDmax);	% Corresponding Flight Path Angle, rad
	%V		=	3.55;
							% Corresponding Velocity, m/s
	Alpha	=	CL / CLa;			% Corresponding Angle of Attack, rad
	
%	optimal
	H		=	2;			% Initial Height, m
	R		=	0;			% Initial Range, m
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	to:.01:tf;

    
    %N = [tspan xa(:,4) xa(:,3)];
    figure
	
    for i=1:100
        vseed = rand(1);
        gamseed = rand(1);
        V = 2 + (5.5*vseed);        
        Gam = -.5 + (.9*gamseed);   
        xo		=	[V;Gam;H;R];
	    [ta,xa]	=	ode23('EqMotion',tspan,xo);
        plot(xa(:,4),xa(:,3),color=[1-vseed 1-gamseed 1-gamseed])
        hold on
        tempH = xa(:,3);
        tempR = xa(:,4);
        tempN = [tspan;tempH';tempR']; 
        N(:,:,i) = tempN;
    end

    Ph = polyfit(N(1,:,:),N(2,:,:),5);
    Pr = polyfit(N(1,:,:),N(3,:,:),5);

    Hfit = polyval(Ph,tspan);
    Rfit = polyval(Pr,tspan);

    Havetemp1 = permute(N(2,:,:),[1 3 2]);
    Ravetemp1 = permute(N(3,:,:),[1 3 2]);

    Havetemp = mean(Havetemp1);
    Ravetemp = mean(Ravetemp1);
    Have = reshape(Havetemp(1,1,:),[601,1]);
    Rave = reshape(Ravetemp(1,1,:),[601,1]);
    
    plot(Rfit,Hfit,"Color","yellow","LineWidth",2)
    plot(Rave,Have,"Color","magenta","LineWidth",2)
    
    xlabel('Range, m'), ylabel('Height, m'), grid
    title("Randomizing both Initial Velocity and Path Angle")
    annotation('textbox',[.15 .13 .4 .06],'String',"Black = max V & max Gam")
    annotation('textbox',[.15 .2 .4 .06],'String',"Cyan = max V & min Gam")
    annotation('textbox',[.15 .27 .4 .06],'String',"White = min V & min Gam")
    annotation('textbox',[.15 .34 .4 .06],'String',"Red = min V & max Gam")


	
    
    

	
	