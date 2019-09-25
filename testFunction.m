%num=20;
num=1;
tsize=4;
R=zeros(tsize+2,num);
X=zeros(1,num);
T=zeros(tsize,num);
S=zeros(2,num);
sigma=1;
mu=0;

t=[0.9,0.6,0.3,0.1];
tsize=4;
methods=["count_sketch","leverage_score","gaussian"];


testF='naive';

for iname=1:1
    for jname=2:2
        R=zeros(tsize+2,num);
        X=zeros(1,num);
        T=zeros(tsize,num);
        S=zeros(2,num);
        for k=1:num
            %if mod(i,20)==0
            %    disp(i);
            %end
            disp(k);
            i=10000;
            X(k)=i;
            m=50000;
            n=20;
            d=1;
%            [A,B]=parallax(m);
             A=zeros(m,n);
             B=zeros(m,d);
             for j=1:n
                 A(j,j)=1;
             end
             B(n+1,1)=3;

            tic;
            [C1,c1] = leastSquare(A,B);
            S(1,k)=toc;
            disp('tls done');
            
            tic;
            [C3,c3]=leastSquare(A,B);
            S(2,k)=toc;
            
            disp('ls done');
            
            R(1,k)=1;
            R(2,k)=c1/c3;

            for j=1:tsize
                tic;
                [C2,c2]=optimalSelect(A,B,ceil(t(j)*m),ceil(t(j)*m),iname,jname);
                T(j,k)=toc;
                R(j+2,k)=c1/c2;
            end
        end
        s1=sprintf('%s-ratio-%s+%s.txt',testF,methods(iname),methods(jname));
        s2=sprintf('%s-time-%s+%s.txt',testF,methods(iname),methods(jname));
        s3=sprintf('%s-S-%s+%s.txt',testF,methods(iname),methods(jname));
        dlmwrite(s1,R,'delimiter',' ');
        dlmwrite(s2,T,'delimiter',' ');
        dlmwrite(s3,S,'delimiter',' ');
    end
end