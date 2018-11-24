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

%each sensor is connected to 2 anchors and other 3 sensor - initialization 
%of matrix Msp 16x3 containing the positions of each sensor
Msp = zeros(16, 3);
for i=1:2:16
    Msp(i:i+1, :) = repmat(xinit(i:i+1), 1, 3); 
end    

Msq = zeros(16, 3);
l = 1;
for i=1:1:size(iS)
    for j = 1:1:4
        Msq(l:l+1 , j) = xinit(iS(i,2));
    end
    l = l + 2; 
end


%initialization of matrix to store the positions of sensor m and n that are
%connected to sensro p (2x2)
As = zeros(16, 2);

%vector 16x1 to store the measurements in the order (am,s1)(an,s1)
%(ar,s2)..... ordered according the sensor p
y_new = zeros(16, 1);

aux1 = 1;
aux2 = 1;
aux3 = 1;
aux4 = 1;
aux5 = 1;
aux6 = 1;
aux7 = 1;
aux8 = 1;

for i=1:1:size(iA)
   if iA(i,2) == 1
       As(1:2 ,aux1) = A(:, iA(i,1) );
       y_new(aux1) = y(i);
       aux1 = aux1 + 1 ;
   elseif iA(i,2) == 2
       As(3:4,aux2) = A(:, iA(i,1));
       y_new(aux2+2) = y(i);
       aux2 = aux2 + 1 ;
   elseif iA(i,2) == 3
       As(5:6,aux3) = A(:, iA(i,1));
       y_new(aux3+4) = y(i);       
       aux3 = aux3 + 1 ;
    elseif iA(i,2) == 4
       As(7:8,aux4) = A(:, iA(i,1));
       y_new(aux4+6) = y(i);
       aux4 = aux4 + 1 ;
   elseif iA(i,2) == 5
      As(9:10,aux5) = A(:, iA(i,1));
      y_new(aux5+8) = y(i);
      aux5 = aux5 + 1 ;
   elseif iA(i,2) == 6
       As(11:12,aux6) = A(:, iA(i,1));
       y_new(aux6+10) = y(i);
       aux6 = aux6 + 1 ;
   elseif iA(i,2) == 7
       As(13:14,aux7) = A(:, iA(i,1));
       y_new(aux7+12) = y(i);       
       aux7 = aux7 + 1;
   elseif iA(i,2) == 8
       As(15:16,aux8) = A(:, iA(i,1));
       y_new(aux8+14) = y(i);
       aux8 = aux8 + 1;
   end
end
    

n_grad = norm(gradient);  
xk = xinit;

while n_grad > tolerance
    
    
    b = -f(As, Msp, Msq, y_new, z);
    
    belief = sum () + gradient_f1p()*(x-xk).^2 + lambda*vector_norm(x));
    
    beliaf = A\b;
    
    if f(belief) < f(xk) 
        xk = belief;
        lambda = 0.7* lambda;
    else
        lambda = 2* lambda;
    end
        
    iter = iter+1;

    
    %data for the next iteration 
    n_grad = norm(gradient);  
    
    
    for i=1:2:16
        Msp(i:i+1, :) = repmat(xk(i:i+1), 1, 3); 
    end
    
    l = 1;
    for i=1:1:size(iS)
        for j = 1:1:4
            Msq(l:l+1 , j) = xk(iS(i,2));
        end
        l = l + 2; 
    end
    
    
end


