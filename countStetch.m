function [S]=countStetch(m,n)
%compute the count_sketch matrix S with m rows, n columns

S=zeros(m,n);
for j = 1:n
    h =randi(m);
    sign=randi(2);
    i=(2*sign-3);
    S(h,j)=i;
end
end