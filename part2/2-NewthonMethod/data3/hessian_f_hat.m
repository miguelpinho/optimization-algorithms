function [ result ] = hessian_f_hat( t, X_hat, Y, k )

result = 1/k * X_hat * diag(exp(X_hat'*t)./((1 + exp(X_hat'*t)).^2)) * X_hat';

end

