function [grad_f] = calculate_grad_f(A_sp, M_sp, M_sq, y, z, iS, p, z_all, M_spall)
%return a vector 2x1 with the result of the parcial derivative of f
%in relation of sp=(xp,yp)

    M_sp2 = M_sp(:, 1:2);
    normAS = vecnorm(A_sp -M_sp2);%vector 1x2
    %normAS = norm(A_sp - M_sp2, 'fro');%vector 1x2
    p1 = (A_sp-M_sp2)./ normAS;   
    
    gradf1 = 2 * ((normAS) - transpose(y)) .* p1;
    
    normSPQ = vecnorm(M_sp - M_sq);%vector 1x3
    %normSPQ = norm(M_sp - M_sq, 'fro');%vector 1x3
    p2 = (M_sp-M_sq)./ normSPQ;    
    gradf2 = 2 * ((normSPQ) - transpose(z)) .* p2;
  
    gradf3 = zeros(2, 1);
    for i=1:1:size(iS)
        if iS(i,2) == p   
            q =iS(i,1);
            sq = M_spall(2*q-1:2*q, 1);
            sp = M_spall(2*p-1:2*p, 1);
            normSQP = vecnorm(sq-sp);%vector 1x1
            %normSQP = (norm(sq - sp, 'fro'));
            p3 = (sq - sp)./ normSQP; 
            gradf3 = gradf3 + 2 * (transpose(normSQP) - z_all(i)) .* p3;
        end
    end
      
    grad_f = sum(gradf1, 2) + sum(gradf2, 2)  + gradf3;
    
end    