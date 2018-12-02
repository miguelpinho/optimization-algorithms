function [ result ] = f_hat( t, X_hat, Y, k )
result = (1/k) * sum(log(1 + exp(X_hat'*t)) - (Y.').*(X_hat'*t));
end

