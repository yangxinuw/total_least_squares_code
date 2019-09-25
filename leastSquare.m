function [X,cost]=leastSquare(A,B)
%compute the least square method with pseudorinverse

A_inv=pinv(A'*A);
X=A_inv*A'*B;
B_hat=A*X-B;
V=B_hat.^2;
cost=sum(sum(V));
X=[A,A*X];
end