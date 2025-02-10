%% need to run model linearizer to get A,B matrix

%% model linearizer output 

A = linsys1.A;
B = linsys1.B;
C = linsys1.C;
D = linsys1.D;

Q = eye(10);
R = eye(4);

[K,S,P] = lqr(A,B,Q,R);

sys1 = ss(A-B*K,B,C,D);
step(sys1);
%% give system a step input

