function [f_] = fp(A, iA, iS, B, y, z, x, E)
    %returns a (px1) vector (p=size(iA)+size(iS))
    sA =  size(iA, 1); 
    sS =  size(iS, 1);
    f_ = zeros(sA+sS, 1);
    
    for j=1:1:sA
        f_(j) = norm(A(:,iA(j,1)) - B(:,:,iA(j,2))*x) - y(j);  
    end
     
    for i=1:1:sS
        f_(i+sA) = norm(E(:,:,i)*x) - z(i);
    end
    
end