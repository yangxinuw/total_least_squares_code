function [S]=fastLeverageScoreSampling(A,s)
% return the leverage score sampling matrix of each *row*
% just using uniform sampling to approximate

[U E V]=svd(A);
[m,n]=size(A);

%rankA=sum(sum(E>1e-6));
%U=U(:,1:rankA);



%leverageScores = sum(U.^2,2);
%prob=leverageScores/(sum(leverageScores));


S=zeros(s,n);
index = randsample ( m , s , true) ;
for i = 1:s
    normalizer=1/sqrt(s/m);
    S(i,:)=A(index(i),:).*normalizer;
end
end