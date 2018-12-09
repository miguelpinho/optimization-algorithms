function g=GradF(x)
    
     load('data1.mat');
     ak=[ X ; -1*ones(1,length(X))];
     eak=exp(ak'*x);
     
     s1=eak./( eak+ones(length(eak),1) ) ;
     s2=s1-Y';
     s=sum(ak'.*[s2, s2, s2]);
     
     g=(s/length(X))';

end