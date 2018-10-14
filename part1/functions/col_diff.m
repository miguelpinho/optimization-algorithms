function [diffV] = col_diff(V)
%COL_DIFF Returns the finite differences between the
%column-wise vectors of matrix V
%   This was implemented because cvx does not recognize
%   the diff function for its type 'cvx' operands 

diffV = V(:, 2:end) - V(:, 1:end-1);
end

