function [hatC,cost]=totalLeastSquare(A,B)
%X is the optimal solution, cost is the square of Frobenius norm \sum
%a_{ij}^2
bs=size(B);
d=bs(2);

as=size(A);
n=as(2);
m=as(1);

C=[A B];

hatC=rankOptimize(C,eye(m),eye(n+d),n);

%X=peilin(A,eye(d),B,m);

V=C-hatC;
cost=sum(sum(V.^2));