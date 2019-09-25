function [X,cost,X1,c1]=leverageRegression(A,B,s)

S=GaussianSampling(A,s);
%S=slowLeverageScoreMatrix(A,s);
SA_inv=pinv(S*A);
X=SA_inv*S*B;

V=A*X-B;
cost=sum(sum(V.^2));

S=slowLeverageScoreMatrix(A,s);
SA_inv=pinv(S*A);
X1=SA_inv*S*B;

V=A*X1-B;
c1=sum(sum(V.^2));
end