num=20;
R=zeros(5,num);
X=zeros(1,num);
T=zeros(3,num);
S=zeros(2,num);
sigma=1;
mu=0;

t=[0.9,0.6,0.3];


for k=1:num
    %if mod(i,20)==0
    %    disp(i);
    %end
    disp(k);
    i=5*k;
    X(k)=i;
    m=20*i+5;
    n=2*i+1;
    d=1;
    A=normrnd(mu,sigma,[m,n]);
    B=normrnd(mu,3*sigma,[m,d]);
%     A=zeros(m,n);
%     B=zeros(m,d);
%     for j=1:n
%         A(j,j)=1;
%     end
%     B(n+1,1)=3;
    
    tic;
    [C1,c1]=totalLeastSquare(A,B);
    S(1,k)=toc;
    
    tic;
    [C3,c3]=leastSquare(A,B);
    S(2,k)=toc;
    
    R(1,k)=1;
    R(2,k)=c1/c3;
    
    for j=1:3
        tic;
        [C2,c2]=main(A,B,ceil(t(j)*m),ceil(t(j)*m),0);
        T(j,k)=toc;
        R(j+2,k)=c1/c2;
    end
end

figure(1)
hold on
plot(X,S(1,:))
plot(X,S(2,:))
for i=1:3
    plot(X,T(i,:))
end

legend('TLS','LS','FTLS 0.9', 'FTLS 0.6', 'FTLS 0.3');
set(gca,'fontsize',15);
%legend;
%title(['percent of sampled rows= ' num2str(t/10)]);

figure(2)
hold on
for i=1:5
    plot(X,R(i,:))
end

legend('TLS','LS','FTLS 0.9', 'FTLS 0.6', 'FTLS 0.3');
set(gca,'fontsize',15);