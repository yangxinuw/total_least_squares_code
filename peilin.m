function [X_hat]=peilin(L,M,N,k)
%Given L M N, solve |L X M - N|_F

[UL SL VL]=svd(L);
% rL=sum(sum(SL>1e-6));
% UL=UL(:,1:rL);
% SL=SL(1:rL,1:rL);
% VL=VL(:,1:rL);

[UN SN VN]=svd(N);
% rN=sum(sum(SN>1e-6));
% UN=UN(:,1:rN);
% SN=SN(1:rN,1:rN);
% VN=VN(:,1:rN);

L_inv=pinv(L);
N_inv=pinv(N);

Y=UL*UL'*M*VN*VN';
[UY SY VY]=svd(Y);

szy=size(Y);
dy=szy(1);

if k<dy
    UY=UY(:,1:k);
    SY=SY(1:k,1:k);
    VY=VY(:,1:k);
end

X_hat=L_inv*UY*SY*VY'*N_inv;
end