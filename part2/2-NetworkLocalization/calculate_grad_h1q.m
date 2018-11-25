function  [grad_h1q] = calculate_grad_h1q(sp, sq)
    %return the gradient of fp (1x2)
    normSPQ = vecnorm(sp - sq);%vector 1x2
    %normSPQ = (norm(sp - sq, 'fro'));
    grad_h1q = (sq-sp)./ normSPQ;    
end