
%forward difference numerical integration
dhfit = zeros(length(tspan));
for i=1:length(tspan)-1
    dhfit(i)= (Hfit(i+1)-Hfit(i))/.01;
end

drfit = zeros(length(tspan));
for i=1:length(tspan)-1
    drfit(i)= (Rfit(i+1)-Rfit(i))/.01;
end

dhave = Have;
for i=1:length(tspan)-1
    dhave(i)= (Have(i+1)-Have(i))/.01;
end

drave = Rave;
for i=1:length(tspan)-1
    drave(i)= (Rave(i+1)-Rave(i))/.01;
end




figure
subplot(2,1,1)
plot(tspan(1:600),dhfit(1:600))
hold on
plot(tspan(1:600),dhave(1:600))
xlabel("time (s)")
ylabel("Velocity (vertical) (m/s)")
title("dy/dt of Height")
legend(["Fit" "Average"])

subplot(2,1,2)
plot(tspan(1:600),drfit(1:600))
hold on
plot(tspan(1:600),drave(1:600))
xlabel("time (s)")
ylabel("Velocity (horizontal) (m/s)")
title("dy/dt of Range")
legend(["Fit" "Average"])


%use num integration to find derivatives of h/t and r/t
%plot them in a 2x1 subplot