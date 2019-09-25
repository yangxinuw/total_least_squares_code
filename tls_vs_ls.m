num=100;
R=zeros(1,num);
X=zeros(1,num);
sigma=1;
mu=0;
T1=zeros(1,num);
T2=zeros(1,num);


for i=1:num
    if mod(i,20)==0
        disp(i);
    end
    m=10*i+5;
    n=2*i+1;
    d=1;
    A=normrnd(mu,sigma,[m,n]);
    B=normrnd(mu,3*sigma,[m,d]);
    tic;
    [C1,c1]=totalLeastSquare(A,B);
    T1(i)=toc;
    tic;
    [X1,c2]=leastSquare(A,B);
    T2(i)=toc;
    X(i)=i;
    R(i)=c1/c2;
end

plot(R)
%plot(T1);
%plot(T2);
set(gca,'fontsize',12)