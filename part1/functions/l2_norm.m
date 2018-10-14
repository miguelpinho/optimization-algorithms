function [norm2] = l2_norm(V, N)
%L2_NORM Returns the l2 norm of the N column-wise vectors of
%matrix V

norm2 = zeros(1, N);
for n = 1:N
   norm2(n) = norm(V(:, n), 2);
end
end
