function [func] = f(A, iA, iS, B, y, z, x, E)
    %returns a number
    f_ = fp(A, iA, iS, B, y, z, x, E).^2;
    func = sum(f_);
   
end