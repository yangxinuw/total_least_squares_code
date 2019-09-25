function [X]=rankOptimize(A,B,C,k)
% solve the optimizing problem: min_{rank k X} ||A-BXC||_2


[ma,na]=size(A);
[mb,nb]=size(B);

[UA,SA,VA]=svd(A);
[UB,SB,VB]=svd(B);
[UC,SC,VC]=svd(C);

D=UB*UB'*A*VC*VC';
[UD,SD,VD]=svd(D);

sz=size(SD);
d=sz(1);

% disp('D is ');
% disp(D);
% disp('SD is ');
% disp(SD);

if(k<d)
    UD=UD(:,1:k);
    SD=SD(1:k,1:k);
    VD=VD(:,1:k);
end
    
    
% for i=k+1:d
%     SD(i,i)=0;
% end

E=UD*SD*VD';

B_inv=pinv(B);
C_inv=pinv(C);




X=B_inv*E*C_inv;
end