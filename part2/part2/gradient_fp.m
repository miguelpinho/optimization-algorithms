function [gradientfp] = gradient_fp(A_s, M_s, M_sq, iS) 
    %return the gradient of fp (16x16)
    %fp is the vector (1x16) in row p of gradientfp
    
    gradientfp = zeros(16, 16);

    aux = 1;
    for i=1:2:16
        p = ceil(i/2);
        gradientfp(i:i+1, :) = sum(calculate_grad_f1p(A_s(i:i+1, :), M_s(i:i+1, 1:2), ceil(i/2))) + sum(calculate_grad_h1p(M_s(i:i+1, :), M_sq(i:i+1,:), p));
        
        for j=aux:1:aux+3
            q = iS(j,2);
            sq = M_s(2*q-1:2*q, 1);
            sp = M_s(2*p-1:2*p, 1);
            gradientfp(i:i+1, q:q+1) = calculate_grad_h1p(sq, sp, q);
        end
        aux = aux + 3;
        
        gradientfp(i:i+1, :)
    end
   
   
end