function [f_] = fp(A_sp, M_sp, y)
    %returns a column with 2 elements  
    f_ = (transpose(norm(A_sp - M_sp, 'fro'))-y);
    
end