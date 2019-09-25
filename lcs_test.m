A=[1,0,0;0,1,0];
b=[0,0,3];

[C1,c1]=totalLeastSquare(A',b');
disp(C1);
disp(c1);

[X2,c2]=leastSquare(A',b');
disp(X2);
disp(c2);