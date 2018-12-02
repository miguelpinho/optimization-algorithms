function [ result ] = gradient2_f_hat( t, X_hat, Y, k )

result = (1/k) * sum(exp(X_hat'*t)./8(1 + exp(X_hat'*t))^2));

end

