%% 参数辨识后的参数
% a=0.843849350182070;
% a1=2.383415999915566e+02;
% a2 =1.425626858339681e+03;
% a3 =-0.006948099932663;
% b=-0.003630656158796;
% c1 =25.344983502592260;
% c2 =-7.225196482777575;
% c3 =-1.209402431726149e-04;
% f0=-2.726050474502923;
% k=0.363200948670565;

% a=0.291154305800150;
% a1=2.175740541624766e+02;
% a2 =52.142505518725600;
% a3 =0.001127631960936;
% b=0.002795853746169;
% c1 =3.116034160050940;
% c2 =9.3600e-05;
% c3 =0.002569325377605;
% f0=-5.036869379045065;
% k=0.449611638317636;

% J=350；
% a=0.2745;
% a1=216.9130;
% a2 =51.9813;
% a3 =-1.7911;
% b=1.1163;
% c1 =4.4516;
% c2 =4.7800;
% c3 =0.0031;
% f0=-3.1031;
% k=0.4603;

% J = 69.0388
a=1.19001595204032e-05;
a1=216.986140271856;
a2 =51.9969921476556;
a3 =-4.85038740996786;
b=-4.99998404294289;
c1 =3.69821992974568;
c2 =8.28628350297708;
c3 =0.0112779556916311;
f0=4.66079282313882;
k=-0.0271829954253508;
m=0.0141707256428496;

t1=0:0.001:0.848;
t1=t1';
Pedal_Displacement_01_t = [t1,Pedal_Displacement_01];

%% 这里根据i的大小递增I画了一组曲线
% for i=0:2:10
%     I=0.1*i;
i = 0;
I = 0.1*i;
sim('RC_calculation_2017a_yuan'); %注意仿真时间设置为0.848,不然矩阵维度不一致
FF(:,i/2+1)=Fsim;
% end

%% 含有RC算子的唯象模型 计算广义力的理论图像
% 定义一个大的图形窗口
figure;

% 力时间曲线
subplot(3,1,1); % 分割成3行1列，当前激活第1个区域
h1=plot(t1,Brake_Pressure_01,'g','linewidth',1);hold on;
h2=plot(t1,FF(:,1),'-.r','linewidth',1);hold on;
legend([h1(1),h2(1)],'Experiment','RC model');
xlabel('Time(s)'); ylabel('Force (kN)');

% 位移时间曲线
subplot(3,1,2); % 分割成3行1列，当前激活第2个区域
h1=plot(t1,Pedal_Displacement_01,'g','linewidth',1);hold on;
h2=plot(t1,x1,'-.r','linewidth',1);hold on;
legend([h1(1),h2(1)],'Experiment','RC model');
xlabel('Time(s)'); ylabel('Displacement(mm)');

% 力位移曲线
subplot(3,1,3); % 分割成3行1列，当前激活第3个区域
h1=plot(Pedal_Displacement_01,Brake_Pressure_01,'g','linewidth',1);hold on;
h2=plot(x1,FF(:,1),'-.r','linewidth',1);hold on;
legend([h1(1),h2(1)],'Experiment','RC model');
xlabel('Displacement(mm)'); ylabel('Force (kN)');

hold off;

% %% 图像绘制
% % 力时间曲线
% figure(1);
% h1=plot(t1,Brake_Pressure_01,'g','linewidth',1);hold on;
% h2=plot(t1,FF(:,1),'-.r','linewidth',1);hold on;
% legend([h1(1),h2(1)],'Experiment','RC model');
% xlabel('Time(s)'); ylabel('Force (kN)');
% 
% % 位移时间曲线
% figure(2);
% h1=plot(t1,Pedal_Displacement_01,'g','linewidth',1);hold on;
% h2=plot(t1,x1,'-.r','linewidth',1);hold on;
% legend([h1(1),h2(1)],'Experiment','RC model');
% xlabel('Time(s)'); ylabel('Displacement(mm)');
% 
% % 力位移曲线
% figure(3);
% h1=plot(Pedal_Displacement_01,Brake_Pressure_01,'g','linewidth',1);hold on;
% h2=plot(x1,FF(:,1)/1000,'-.r','linewidth',1);hold on;
% legend([h1(1),h2(1)],'Experiment','RC model');
% xlabel('Displacement(mm)'); ylabel('Force (kN)');

% 力速度曲线
% figure(3);
% h1=plot(x2_f_10,F_f_10,'g','linewidth',1);hold on;
% h2=plot(x2,FF(:,1)/1000,'-.r','linewidth',1);hold on;
% legend([h1(1),h2(1)],'Experiment','RC model');
% axis([-80 80 -1.5 1.5])
% xlabel('Velocity (mm/s)'); ylabel('Force (kN)');