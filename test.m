clear;
clf;

%TIME CONDITION
End_time = 10000;
Time_step = 1;

%INTIAL CONDITION
Intial_speed = 0;
Intial_altitude = 0;

%FIXED PARAMETERS
G = 6.67408e-11;        % Universal Gravitational Constant
M = 5.9722e24;          % Mass of the earth
R = 6371e3;             % Radius of the earth(m)
A = 75;                 % Area of the rocket 
Cd = 0.4;               % Drag Coefficient for the rocket
m_e = 54000;            % Empty mass of the rocket
m_0 = 894000;           % Intial mass of the rocket
v_e = 12000;             % Exhaust gas speed
dmdt_f = 5000;          % Rate of change of mass with fuel left
dmdt_o = 0;             % Rate of change of mas with all fuel being used

%SETTING ARRAYS
t = 0:Time_step:End_time;
Speed = zeros(1,length(t));
Altitude = zeros(1,length(t));
Speed(1) = Intial_speed;
Altitude(1) = Intial_altitude;
r(1) = Intial_altitude+R;
m(1)= m_0;
r(1) = Intial_altitude+R;
rho(1) = 1.225;

%FOR LOOP
for i=2:length(t)
  %CALCULATION FOR dmdt BEING NOT CONSTANT THROUGHT  
    if m(i-1)> m_e
        dmdt = dmdt_f;
    else
       dmdt = dmdt_o;
    end 
    m(i) = m(i-1) - Time_step*dmdt;             %Calculate the current speed
    rho(i)=1.225*10.^((-3*Altitude(i-1)/50000));      %Calculate the current air density
    dvdt = v_e * dmdt / m(i-1) - G*M/r(i-1)^2 - 0.5*rho(i)*A*Cd*Speed(i-1)*abs(Speed(i-1))/m(i-1);
    Speed(i) = Speed(i-1) + Time_step*dvdt;
    r(i) = r(i-1) + Time_step*0.5*(Speed(i)+Speed(i-1));    %Calculate the current radius 
    Altitude(i) = Altitude(i-1) + Time_step*0.5*(Speed(i)+Speed(i-1));  %Calculate the current altitude
end
    
%DISPLAY THE RESULTS
subplot(2,1,1)
plot (t,Speed,'m')
xlabel('Time(s)')
ylabel('Speed(m/s)')
subplot(2,1,2)
plot(t,Altitude)
xlabel('Time(s)')
ylabel('Altitude(m)')