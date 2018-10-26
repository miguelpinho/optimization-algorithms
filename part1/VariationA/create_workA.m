%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%               Optimization and Algorithms
%
%                   Part1 of the Project
%
%
%
%   Authors: 
%         - Duarte Dias,  81356,  duarte.ferreira.dias@tecnico.ulisboa.pt
%         - Miguel Pinho, 80826,  miguel.m.pinho@tecnico.ulisboa.pt
%         - Pedro Mendes, 81046,  pedrogoncalomendes@tecnico.ulisboa.pt
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% movement physics
A = [1  0  0.1    0; 
     0  1    0  0.1; 
     0  0  0.9    0; 
     0  0    0  0.9];
 
B = [0      0; 
     0      0;
     0.1    0;
     0    0.1];
 
 E = [1  0  0  0;
      0  1  0  0];
 
 
% initial anf final state
initialp = [ 0;   5];
finalp   = [15; -15];

initialx = [initialp;  [0; 0]];
finalx   = [  finalp;  [0; 0]];


 % waypoints
k = 6;

lambda = [0.001  0.01  0.1  1  10  100 1000];

w   = [10  20  30  30  20   10;
       10  10  10   0   0  -10];
   
tau = [10  25  30  40  50   60];


 % problem constraints
T = 80;
Umax = 100;


save("dataA.mat");


