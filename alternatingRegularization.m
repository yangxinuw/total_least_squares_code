function [hatA, hatX, cost]=alternatingRegularization(A,B,L,lam)

lam=sqrt(lam);
iter=100;
[m,n]=size(A);
[m,d]=size(B);
[l,n]=size(L);
hatA=eye(m,n);
hatX=eye(n,d);
for i=1:iter
    %  [hatA ] [In hatX] =[A       B]
    %  [lam L]            [lam L   0]
    A1=cat(1,eye(n),hatX');
    B1=cat(1,A',B');
    [X1, ~]=regression(A1,B1);
    hatA=X1';
    % 
    A2=cat(1,hatA, lam*L);
    B2=cat(1,B,zeros(l,d));
    [hatX,~]=regression(A2,B2);
end 

A3=cat(1,hatA, lam*L);
X3=cat(2,eye(n),hatX);
B3=cat(1,B,zeros(l,d));
B4=cat(2,A3,B3);
V=(A3*X3-B4).^2;
cost=sum(sum(V));