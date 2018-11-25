function [grad_f] = gradient_f(A_s, M_sp, M_sq, y, z, iS)
%return a column of 16x1 with all the parcial derivatives of f
    grad_f = zeros(16, 1);

    for p=1:1:8
         grad_f(2*p-1:2*p) = calculate_grad_f(A_s(2*p-1:2*p, :), M_sp(2*p-1:2*p,:), M_sq(2*p-1:2*p,:), y(2*p-1:2*p), z(3*p-2:3*p), iS, p, z, M_sp);
    end
    
   
end