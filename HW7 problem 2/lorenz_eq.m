%% creating Van Der Pol Oscillator 
function [xd] = lorenz_eq(time,x,r) 
xd = [10*(x(2)-x(1)) x(1)*(166-x(3))-x(2) x(1)*x(2)-(8*x(3)/3)];
end
