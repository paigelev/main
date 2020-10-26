function [h,v] = fsatellite(T,unit)
% FSATELLITE is the functional form of the satellite script. It takes the
% orbital period of a satellite T and the units of time (optional). Units
% of time can include "hr" for hours (default), "min" for minutes, "s" for
% seconds, and "dy" for days. The function returns the altitude in km and
% velocity in km/s
 
if nargin==1 % nargin stores the number of arguments put in with the function
    unit= "hr";
elseif nargin ==0 
    error("Invalid input")    
end

% Defining constants
mts = 60;
hts= 3600;
dts = 86400;
G = 6.67*10^(-11);
M = 5.98*10^(24);
R = 6.371*10^(6);
% Calculations using anonymous functions!!
% Is this overkill? Maybe
V = @(r) sqrt(G*M./r);
H = @(t) (G*M*t.^2./(4*pi.^2)).^(1/3) - R;
% Checks the unit input
switch unit
    case "sec"
        t=T;
        tconvert = 1;
        lab = "sec";
    case "min"
        t= mts*T;
        tconvert = mts;
        lab = "min";
    case "hr" 
        t = hts*T; 
        tconvert = hts;
        lab = "hrs";
    case "dy"
        t = dts*T;
        tconvert = dts
        lab = "days";
    otherwise
        error("Invalid input")
end
% Calculate altitude and velocity
h = mtokm(H(t));
v = mtokm(V(R+H(t)));
time = 5200:100:8*t;
height = 0:100:H(time(end));
% Graph results in 2 figures
figure
plot(time/tconvert,mtokm(H(time)),'b-',t/tconvert,h,'r*')
ylabel("altitude (km)")
xlab = "period of orbit " + "(in " + lab + ")";
xlabel(xlab)
title('Altitude of Orbit')
figure
plot(mtokm(height),mtokm(V(height+R)),'b-',h,v,'r*')
xlabel('altitude (km)')
ylabel('velocity in orbit (km/s)')
title('Orbital Velocity')

end

% Local Functions
function H = mtokm(h)
     % Converts input from meters to kilometers
     H = h./1000;
end
function h = kmtom(H) 
     % Converts input from kilometers to meters
     h = 1000.*H;
end

