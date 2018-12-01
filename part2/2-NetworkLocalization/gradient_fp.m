function [gradientfp] = gradient_fp(iA, A, iS, B, E, x) 
    %return the gradient of fp (16xp)
       
    sA =  size(iA, 1); 
    sS =  size(iS, 1);
    gradientfp = zeros(16, sS+sA);
    
    for i=1:1:sA
        gradientfp(:,i) = (-B(:,:,iA(i,2))' * (A(:,iA(i,1))- B(:,:,iA(i,2))*x))./(norm(A(:,iA(i,1)) - B(:,:,iA(i,2))*x));
    end
    for  i=1:1:sS
        gradientfp(:,i+sA) = (E(:,:,i)'*( E(:,:,i)*x))./(norm(E(:,:,i)*x));
    end
   
end