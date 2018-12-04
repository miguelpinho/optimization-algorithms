function [ result ] = gradient_f_hat( t, X_hat, Y, k )

result = 1/k * X_hat * (exp(X_hat'*t)./(1 + exp(X_hat'*t)) - Y');

end

