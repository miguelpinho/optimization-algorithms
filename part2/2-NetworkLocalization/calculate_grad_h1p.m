function  [grad_h1p] = calculate_grad_h1p(M_sp, M_sq, p)
    %return the gradient of fp (1x16)
    %[0 0 0... df/dsp  0 0 0 ..] all zeros except positision 2*p-1 and 2*p
    grad_h1p = zeros(1,16);
    normSPQ = vecnorm(M_sp - M_sq);%vector 1x2
    %normSPQ = (norm(M_sp - M_sq, 'fro'));
   
    grad_h1p(2*p-1:2*p) = (M_sp-M_sq)./ normSPQ;    

end