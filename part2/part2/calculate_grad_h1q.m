function  [grad_h1q] = calculate_grad_h1q(sp, sq)
    %return the gradient of fp (1x2)
    %[0 0 0... df/dsp  0 0 0 ..] all zeros except positision 2*p-1 and 2*p
    normSPQ = transpose(norm(sp - sq, 'fro'));%vector 2x1
    grad_h1q = (sq-sp)./ normSPQ;    

end