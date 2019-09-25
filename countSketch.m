function [S]=countSketch(A,s)
% compute sketched version of A with s rows

[m,n]=size(A);
S=zeros(s,n);
sign=2*randi(2,[m,1])-3;
% disp(sign);
% disp('before ');
% disp(A);
A=bsxfun(@times,A,sign);
%disp('after ');
%disp(A);
hash = randsample(s,m,true);

for i=1:m
    S(hash(i),:)=S(hash(i),:)+A(i,:);
end
end

