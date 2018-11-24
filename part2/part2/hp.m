function [f_] = hp(M_sp, M_sq, z)
    %returns a column with 3 elements  
    f_ = (transpose(norm( M_sp - M_sq, 'fro'))- z);
    
end