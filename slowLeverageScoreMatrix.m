function [D]=slowLeverageScoreMatrix(A,s)
% return the leverage score sampling matrix of each *row*
% using SVD decomposition. Compute the exact leverage scores

[U E V]=svd(A);
[m,n]=size(A);

rankA=sum(sum(E>1e-6));
U=U(:,1:rankA);

leverageScores = sum(U.^2,2);
prob=leverageScores/(sum(leverageScores));

%disp(prob);

D=zeros(s,m);
index = randsample ( m , s , true , prob ) ;

%disp(index);

for i = 1:s
    D(i,index(i))=1/sqrt(s*prob(index(i)));
end
end

