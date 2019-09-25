function [S]=slowLeverageScoreSampling(A,s)
% return the leverage score sampling matrix of each *row*
% using SVD decomposition. Compute the exact leverage scores

[U E V]=svd(A);
[m,n]=size(A);

rankA=sum(sum(E>1e-6));
U=U(:,1:rankA);



leverageScores = sum(U.^2,2);
prob=leverageScores/(sum(leverageScores));

S=zeros(s,n);
index = randsample ( m , s , true , prob ) ;
for i = 1:s
    normalizer=1/sqrt(s*prob(index(i)));
    S(i,:)=A(index(i),:).*normalizer;
end
end


