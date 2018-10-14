function [norm1] = l1_norm(V, N)
%L1_NORM Returns the l2 norm of the T column-wise vectors of
%matrix V

norm1 = zeros(1, N);
for n = 1:N
   norm1(n) = norm(V(:, n), 1);
end
end

