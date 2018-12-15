function [gradientf] = gradient_f(A, iA, iS, B, y, z, x, E)
%return a column of 16x1 with all the parcial derivatives of f
    sA =  size(iA, 1); 
    sS =  size(iS, 1);
    grad_f = zeros(16, sS+sA);

    for i=1:1:sA
        grad_f(:,i) = 2*(norm(A(:,iA(i,1))-B(:,:,iA(i,2))*x)-y(i))*(-B(:,:,iA(i,2))'*(A(:,iA(i,1))-B(:,:,iA(i,2))*x))./(norm(A(:,iA(i,1))-B(:,:,iA(i,2))*x));  
    end
    for i=1:1:sS
        grad_f(:,i+sA) = 2*(norm(E(:,:,i)*x)-z(i))*(E(:,:,i)'*(E(:,:,i)*x))./(norm(E(:,:,i)*x));
    end
   %sum of the rows
   gradientf = sum(grad_f, 2);
end