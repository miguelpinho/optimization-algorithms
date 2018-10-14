function [sq_norm2] = sq_l2_norm(V, N)
%SQ_L2_NORM Returns the squared l2 norm of the T column-wise vectors
%matrix V

sq_norm2 = zeros(1, N);
for n = 1:N
   sq_norm2(n) = power(norm(V(:, n), 2), 2);
end
end
