function [hatC,cost]=optimalSelect(A,B,s1,d2,o1,o2)

C=[A,B];
szA=size(A);
n=szA(2);
% step 1: compute the sketch version


if o1==1
    SC=countSketch(C,s1);
elseif o1==2
    SC=slowLeverageScoreSampling(C,s1);
else
    SC=GaussianSampling(C,s1)*C;
end
    
% step 2: compute leverage score sampling matrix D_1 according to columns of S_1 C
%CD=slowLeverageScoreSampling(SC',d1)';
%omit this step now

CD=C;

% step 3: compute the leverage score sampling matrix D_2 according to rows of C D_1
%DD=slowLeverageScoreMatrix(CD,d2);


%DC=slowLeverageScoreSampling(C,d2);
%DC=fastLeverageScoreSampling(C,d2);
if o2==1
    DC=countSketch(C,d2);
elseif o2==2
    DC=slowLeverageScoreSampling(C,d2);
else
    DC=GaussianSampling(C,d2)*C;
end

% step 4: solve the small size problem
Z=rankOptimize(DC,DC,SC,n);

hatC=CD*Z*SC;

V=hatC-C;
cost=sum(sum(V.^2));


% compare to optimal solution
% hatX=rankOptimize(B,A,eye(d),d);
end