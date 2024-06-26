%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005

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
	V		=	3.55;
							% Corresponding Velocity, m/s
	Alpha	=	CL / CLa;			% Corresponding Angle of Attack, rad
	
%	optimal
	H		=	2;			% Initial Height, m
	R		=	0;			% Initial Range, m
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to tf];
	xo		=	[V;-.18;H;R];
	[ta,xa]	=	ode23('EqMotion',tspan,xo);
	
%	lowered v
	xo		=	[2;-.18;H;R];
	[tb,xb]	=	ode23('EqMotion',tspan,xo);

%	increased v
	xo		=	[7.5;-.18;H;R];
	[tc,xc]	=	ode23('EqMotion',tspan,xo);
	
	figure
    subplot(2,1,1)
	plot(xa(:,4),xa(:,3),"Color","black")
    hold on
    plot(xb(:,4),xb(:,3),"Color","red")
    hold on
    plot(xc(:,4),xc(:,3),"color","green")
	xlabel('Range, m'), ylabel('Height, m'), grid
    title("Modifying initial Velocity")
    legend(["Nominal","Lower","Higher"])


    xo		=	[3.55;-.18;H;R];
	[td,xd]	=	ode23('EqMotion',tspan,xo);

    xo		=	[3.55;-.5;H;R];
	[te,xe]	=	ode23('EqMotion',tspan,xo);

    xo		=	[3.55;.4;H;R];
	[tf,xf]	=	ode23('EqMotion',tspan,xo);

    subplot(2,1,2)
    plot(xd(:,4),xd(:,3),"Color","black")
    hold on
    plot(xe(:,4),xe(:,3),"Color","red")
    hold on
    plot(xf(:,4),xf(:,3),"color","green")
	xlabel('Range, m'), ylabel('Height, m'), grid
    title("Modifying initial Flight Path Angle")
    legend(["Nominal","Lower","Higher"])

	
	