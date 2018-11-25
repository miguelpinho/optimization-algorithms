function [f_] = fp(A_sp, M_sp, y)
    %returns a column with 2 elements  
    f_ = (transpose(vecnorm(A_sp - M_sp))-y);
    
end