function [R]=GaussianSampling(A,s)
sz=size(A);
m=sz(1);
R=normrnd(0,1/sqrt(s),[s,m]);
%S=R*A
end