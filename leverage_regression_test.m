m=500;
n=20;
d=1;

R=zeros(3,100);

A=normrnd(0,1,[m,n]);
B=normrnd(0,1,[m,d]);

for i=1:100
    rho=i/10;  
    [X,c,X1,c1]=leverageRegression(A,B,rho*m);
    R(1,i)=c;
    R(2,i)=c1;
    [X2,c2]=regression(A,B);
    R(3,i)=c2;
end

hold on
for i=1:3
    plot(R(i,1:100))
end

legend('leverage score sampling', 'gaussian sampling', 'exact solution')
set(gca,'fontsize',15);