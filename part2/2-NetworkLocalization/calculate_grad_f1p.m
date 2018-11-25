function  [grad_f1p] = calculate_grad_f1p(A_sp, M_sp, p)
    %return the gradient of fp (1x16)
    %[0 0 0... df/dsp  0 0 0 ..] all zeros except positision 2*p-1 and 2*p
    grad_f1p = zeros(1,16);
    normAS = vecnorm(A_sp - M_sp);%vector 2x1
    %normAS = (norm(A_sp - M_sp, 'fro'));%vector 2x1
   
    grad_f1p(2*p-1:2*p) = (A_sp-M_sp)./ normAS;    
end