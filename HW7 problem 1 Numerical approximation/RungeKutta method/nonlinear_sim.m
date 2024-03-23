clear all;

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

for i = 0:N
    time = i*dt;
    if rem(i,NP) == 0
        k = k+1;
        y(k,1) = x(1);
        y(k,2) = x(2);
    end
    [x] = RK4(name,time,dt,x,u);
end

t= NP*dt*[0:k-1];
figure(1)
plot(y(:,1), y(:,2)) % For Van der Pol
grid on
axis([-3,3,-4,5])
xlabel('X(1)')
ylabel('X(2)')
text(-1.8,3.2,'(-2,3)')


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