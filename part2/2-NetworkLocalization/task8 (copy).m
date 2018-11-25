%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%               Optimization and Algorithms
%
%                   Part2 of the Project
%
%
%
%   Authors:
%         - Duarte Dias,  81356,  duarte.ferreira.dias@tecnico.ulisboa.pt
%         - Miguel Pinho, 80826,  miguel.m.pinho@tecnico.ulisboa.pt
%         - Pedro Mendes, 81046,  pedrogoncalomendes@tecnico.ulisboa.pt
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;

%load the workspace
load('lmdata1.mat');

lambda = 1;
tolerance = power(10, -6);


iter = 0;
diff = 1;

SA = zeros(16, 2);
aux1 = 1;
aux2 = 3;
aux3 = 5;
aux4 = 7;
aux5 = 9;
aux6 = 11;
aux7 = 13;
aux8 = 15;
newS = zeros(2, 16);

for i=1:1:size(iA)
   if iA(i,2) == 1
       SA(aux1,1) = iA(i,1);
       aux1 = aux1 + 1 ;
   end
   if iA(i,2) == 2
       SA(aux2,1) = iA(i,1);
       aux2 = aux2 + 1 ;
   end
   if iA(i,2) == 3
       SA(aux3,1) = iA(i,1);
       aux3 = aux3 + 1 ;
   end
   if iA(i,2) == 4
       SA(aux4,1) = iA(i,1);
       aux4 = aux4 + 1 ;
   end
   if iA(i,2) == 5
       SA(aux5,1) = iA(i,1);
       aux5 = aux5 + 1 ;
   end
   if iA(i,2) == 6
       SA(aux6,1) = iA(i,1);
       aux6 = aux6 + 1 ;
   end
   if iA(i,2) == 7
       SA(aux7,1) = iA(i,1);
       aux7 = aux7 + 1 ;
   end
   if iA(i,2) == 8
       SA(aux8,1) = iA(i,1);
       aux8 = aux8 + 1 ; 
   end
   p = iA(i,2);
   newS(1,i) = xinit(2*p-1);
   newS(2,i) = xinit(2*p);
end
    


A1 = repmat(A(:,1), 1, 4);
A2 = repmat(A(:,2), 1, 4);
A3 = repmat(A(:,3), 4, 1);
A4 = repmat(A(:,4), 4, 1);

AT = [A1 A2 A3 A4];







S1 = repmat(A(:,1), 1, 3);
S2 = repmat(A(:,2), 1, 3);
S3 = repmat(A(:,3), 1, 3);
S4 = repmat(A(:,4), 1, 3);









while diff > tolerance
    cvx_begin quiet

 
    
    
    cvx_end;
end


