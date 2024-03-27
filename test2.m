%Variables
k=60;
c=-5;
m=25;
g=9.81;
t = linspace(0,5,100);

%The solution'
h = (-(k/c)*m*(log(m+c*t)))-(k*t.*(log(m+c*t)))+(k*t)-((g/2)*(t.^2))+(k*t.*(log(m)))+((k/c).*m.*(log(m)));

%Graphing the solution
plot(t,h)
xlabel('time') % x-axis label
ylabel('height') % y-axis label
title('Rocket Height')