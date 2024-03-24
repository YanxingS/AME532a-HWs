%% creating Van Der Pol Oscillator 
function [xd] = vdpol(time,x,r) 
xd = [10*(x(2)-x(1)) x(1)*(24.06-x(3))-x(2) x(1)*x(2)-(8*x(3)/3)];
end
