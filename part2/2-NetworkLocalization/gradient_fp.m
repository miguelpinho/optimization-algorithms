function [gradientfp] = gradient_fp(A_s, M_s, M_sq, iS) 
    %return the gradient of fp (16x16)
    %in order to save computation time the matrix of the gradient fp is
    %store in a row instead of a column so then we don't need to calculate
    %the transpose matrix
    
    gradientfp = zeros(16, 16);

    for i=1:1:8
        gradientfp(i,:) = calculate_grad_f1p(A_s(2*i-1:2*i, :), M_s(2*i-1:2*i,1:2), i);
    end
   
    for i=9:1:24
        p = i-8;
        gradientfp(i, :) = calculate_grad_h1p(M_s(2*p-1:2*p, :), M_sq(2*p-1:2*p,:), p);
        
        for j=1:1:size(iS)
            if iS(j,2) == p
              	q = iS(j,1);
                sq = M_s(2*q-1:2*q, 1);
                sp = M_s(2*p-1:2*p, 1);
                gradientfp(i, 2*q-1:2*q) = calculate_grad_h1p(sq, sp);
            end
        end
        
    end
   
end