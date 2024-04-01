clc; clear; close 

% Cramer's rule

syms a b c d e f g h s 

G = [1 0; 0 1]*inv([s-a -b; -c s-d])*[e f; g h];

% using ss2tf

A = [1 2; 3 4]; B = [5 6;7 8];
C = [1 0;0 1]; D = [0 0;0 0];

[num_coe, den_coe] = ss2tf(A,B,C,D,1);