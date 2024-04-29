clear all; close all; clc;

%% run instruction
% 1 enter name of the state equation that is in the m file that is in the
% same directory as this file 
% 2 enter ic file, include .dat extension
% 3 specify run time and time step

%% main body 
name = input('enter state equation name m-file: ','s');
icfile = input('enter name of the ic file:','s');
tmp = dlmread(icfile);
n = tmp(1); m = tmp(2);
x = tmp(3:n+2); u = tmp(n+3:n+m+2);
stat = fclose('all');
runtime = input('enter run time:');
dt = input('enter integration time-step:');
N  = runtime/dt; k = 0; NP = fix(max(1,N/500)); time = 0;
xd = feval(name,time,x,u);
global y
for i = 0:N
    time = i*dt;
    if rem(i,NP) == 0
        k = k+1;
        y(k,1) = x(1);
        y(k,2) = x(2);
        y(k,3) = x(3);
    end
    [x] = RK4(name,time,dt,x,u);
end

t= NP*dt*[0:k-1];

figure(1)
plot(y(:,1),y(:,2))
xlabel('X(1)')
ylabel('X(2)')
title('phase portrait')

figure(3)
plot(y(:,3),y(:,2))
xlabel('X(3)')
ylabel('X(2)')
title('y vs z')

figure(2)
timestep = 0:time/dt;
plot(timestep,y(:,1))
xlabel('time step')
ylabel('X(10')
title('wave form')



%% compute solver (RK4 method)
function [xnew]= RK4(f,time,dt,xx,u)
xd=feval(f,time,xx,u);
xa=xd*dt;
x =xx + 0.5*xa;
t =time + 0.5*dt;
xd=feval(f,t,x,u);
q = xd*dt;
x = xx + 0.5*q;
xa= xa + 2.0*q;
xd= feval(f,t,x,u);
q = xd*dt;
x = xx + q;
xa= xa + 2.0*q;
time= time + dt;
xd= feval(f,time,x,u);
xnew= xx + (xa + xd*dt)/6.0;
end