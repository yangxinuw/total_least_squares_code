t=[0.9,0.6,0.3];
methods=["count_sketch","leverage_score","gaussian"];
names=["cc","ll","gg",'cl'];


X=5*[1:20];
testF='sparse';

%for index=1:3
index=1;
f1=figure(2*index-1);
hold on;
set(f1,'Position',[0,0,350,350]);
sname=sprintf('%s-S-%s+%s.txt',testF,methods(3),methods(3));
S=load(sname);
plot(X,S(1,:),'-o');
plot(X,S(2,:),'-+');
tname=sprintf('%s-time-%s+%s.txt',testF,methods(3),methods(3));
T=load(tname);

plot(X,T(1,:),'-*');
plot(X,T(2,:),'-.');
plot(X,T(3,:),'-x');
plot(X,T(4,:),'-s');

legend('TLS','LS','FTLS 0.9', 'FTLS 0.6', 'FTLS 0.3','FTLS 0.1');
titlename=sprintf('%s+%s',methods(3),methods(3));
%title(titlename,'Interpreter', 'none');
%set(gca,'fontsize',15,'position',[0,0,200,200]);
savename1=sprintf('small-%s-%s-time.eps',testF,names(3));
saveas(f1,savename1,'epsc');
%close(f1);

f2=figure(2*index);
set(f2,'Position',[0,0,350,350]);
hold on;
rname=sprintf('%s-ratio-%s+%s.txt',testF,methods(3),methods(3));
R=load(rname);

plot(X,R(1,:),'-o');
plot(X,R(2,:),'-+');
plot(X,R(3,:),'-*');
plot(X,R(4,:),'-.');
plot(X,R(5,:),'-x');
plot(X,R(6,:),'-s');


legend('TLS','LS','FTLS 0.9', 'FTLS 0.6', 'FTLS 0.3','FTLS 0.1');
%title(titlename,'Interpreter', 'none');

savename2=sprintf('small-%s-%s-error.eps',testF,names(3));
saveas(f2,savename2,'epsc');
%close(f2);
%end

% 
% legend('TLS','LS','FTLS 0.9', 'FTLS 0.6', 'FTLS 0.3');
% set(gca,'fontsize',15);
% %legend;
% %title(['percent of sampled rows= ' num2str(t/10)]);
% 
% figure(2)
% hold on
% for i=1:5
%     plot(X,R(i,:))
% end
% 
% legend('TLS','LS','FTLS 0.9', 'FTLS 0.6', 'FTLS 0.3');
% set(gca,'fontsize',15);