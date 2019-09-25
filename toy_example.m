m=3;
n=2;
d=1;
A=zeros(m,n);
B=zeros(m,1);
%A=normrnd(0,1,[m,n]);
%B=normrnd(0,3,[m,1]);
rho=0.8;


for i=1:n
    A(i,i)=1;
end
B(n+1,1)=3;

% %worse: baart deriv2 wing
% 
% %better: parallax ursell
% 
% %slightly better: phillips
% 
% n=400;
% [A,B]=wing(n);
% m=n;
% rho=0.6;

% 
[C1,c1]=totalLeastSquare(A,B);
disp(c1);
% %dlmwrite('tls.txt',C1,'delimiter',' ');
% 
[C2,c2]=leastSquare(A,B);
disp(c2);
% %dlmwrite('ls.txt',C2,'delimiter',' ');
% 
% [C3,c3]=optimalSelect(A,B,ceil(rho*m),ceil(rho*m),1,2);
% %disp(C3); 
% disp(c3); 
% %dlmwrite('ftls.txt',C3,'delimiter',' ');
% 

[C3,c3]=optimalSelect(A,B,ceil(rho*m),ceil(rho*m),3,3);
disp(C3);
disp(c3);


[C3,c3]=optimalSelect(A,B,ceil(rho*m),ceil(rho*m),3,3);
disp(C3);
disp(c3);

% method={"count sketch","leverage score","gaussian"};
% 
% for i=1:3
%     for k=1:3
%         num=1000;
%         R=zeros(num,1);
%         for j=1:num
%             [C3,c3]=optimalSelect(A,B,ceil(rho*m),ceil(rho*m),i,k);
%             R(j)=c3;
%         end
%         disp([method(i), "+", method(k), ":", num2str(sum(sum(R))/num)]);
%     end
% end

num=1000;
R=zeros(num,1);
for j=1:num
    [C3,c3]=optimalSelect(A,B,ceil(rho*m),ceil(rho*m),3,3);
    R(j)=c3;
end

RX=unique(R);
out=[RX,histc(R(:),RX)];
histogram(R);
set(gca,'fontsize',24);
xlim([0,9.5]);

disp(c1);
disp(c2);
%tc1=sprintf('TLS cost =%f',c1);
%text(0,0,tc1);