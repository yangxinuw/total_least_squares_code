function [X,cost]=regression(A,B)


A_inv=pinv(A);
X=A_inv*B;

V=A*X-B;
cost=sum(sum(V.^2));