filename='insurance.csv';

t=[0.9,0.6,0.3,0.1];
tsize=4;

C=load(filename);
sz=size(C);
m=sz(1);
%C=C(2:m,:);
%m=m-1;
n=85;
d=1;
A=C(:,1:n);
B=C(:,n+1:n+d);

iter=5;

R=zeros(iter,tsize+2);   
T=zeros(iter,tsize+2);
meanT=zeros(2,tsize+2);
meanR=zeros(2,tsize+2);

for num=1:iter
    tic; 
    [C1,c1]=totalLeastSquare(A,B); 
    T(num,1)=toc;
    R(num,1)=c1;
    meanT(1,1)= meanT(1,1)+T(num,1);
    meanR(1,1)= meanR(1,1)+R(num,1);
    meanT(2,1)= meanT(2,1)+T(num,1)*T(num,1);
    meanR(2,1)= meanR(2,1)+R(num,1)*R(num,1);
    
    tic; 
    [C3,c3]=leastSquare(A,B); 
    T(num,2)=toc;
    R(num,2)=c3;
    meanT(1,2)= meanT(1,2)+T(num,2);
    meanR(1,2)= meanR(1,2)+R(num,2);
    meanT(2,2)= meanT(2,2)+T(num,2)*T(num,2);
    meanR(2,2)= meanR(2,2)+R(num,2)*R(num,2);
    
    for iname=1:1
        for jname=2:2
            for j=1:tsize
                index=j;
                tic;
                [C2,c2]=optimalSelect(A,B,ceil(t(j)*m),ceil(t(j)*m),iname,jname);
                T(num,2+index)=toc;
                R(num,2+index)=c2;   
                meanT(1,2+index)= meanT(1,2+index)+T(num,2+index);
                meanR(1,2+index)= meanR(1,2+index)+R(num,2+index);
                meanT(2,2+index)= meanT(2,2+index)+T(num,2+index)*T(num,2+index);
                meanR(2,2+index)= meanR(2,2+index)+R(num,2+index)*R(num,2+index);
            end
        end
    end
end


meanT=meanT/iter;
meanR=meanR/iter;
for i=1:tsize+2
    meanT(2,i)=meanT(2,i)-meanT(1,i)*meanT(1,i);
    meanT(2,i)=sqrt(meanT(2,i));
end
for i=1:tsize+2
    meanR(2,i)=meanR(2,i)-meanR(1,i)*meanR(1,i);
    meanR(2,i)=sqrt(meanR(2,i));
end

T=[T;meanT];
R=[R;meanR];


s1=sprintf('cost-%s',filename);
s2=sprintf('time-%s',filename);
dlmwrite(s1,meanR,'delimiter',' ');
%dlmwrite(s1,meanR,'delimiter',' ');
dlmwrite(s2,meanT,'delimiter',' ');
%dlmwrite(s2,meanT,'delimiter',' ');
