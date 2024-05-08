% % J =  64.2737
 a=4.755148999027856e-06;
 a1=216.986140271856;
 a2 =51.9969921476556;
%a1 = 0;
%a2 = 0;
 a3 =-4.667453705814229;
 b=-5.745721345365244;
c1 =3.69821992974568;
 c2 =8.28628350297708;
%c1=0;
%c2=0;
 c3 =0.010312630474325;
 f0=4.527490174888555;
 k=-0.017999550541035;
 m=0.019584640303568;

t1=0:0.001:0.848;
t1=t1';
Pedal_Displacement_01_t = [t1,Pedal_Displacement_01];

%% 这里根据i的大小递增I画了一组曲线
% for i=0:2:10
%     I=0.1*i;
i = 0;
I = 0.1*i;
sim('RC_calculation_dongtai_bianjiegou'); %注意仿真时间设置为0.848,不然矩阵维度不一致
FF(:,i/2+1)=Fsim;
% end

%% 含有RC算子的唯象模型 计算广义力的理论图像
% 定义一个大的图形窗口
figure;

% 基于原有代码调整subplot布局为4行1列

% 第一个图：力时间曲线
subplot(4,1,1); % 调整为4行1列，当前激活第1个区域
h1=plot(t1,Brake_Pressure_01,'g','linewidth',1);hold on;
h2=plot(t1,FF(:,1),'-.r','linewidth',1);hold on;
legend([h1(1),h2(1)],'Experiment','RC model');
xlabel('Time(s)'); ylabel('Force (MPa)');

% 第二个图：位移时间曲线
subplot(4,1,2); % 调整为4行1列，当前激活第2个区域
h1=plot(t1,Pedal_Displacement_01,'g','linewidth',1);hold on;
h2=plot(t1,x1,'-.r','linewidth',1);hold on;
legend([h1(1),h2(1)],'Experiment','RC model');
xlabel('Time(s)'); ylabel('Displacement(mm)');

% 第三个图：力位移曲线
subplot(4,1,3); % 调整为4行1列，当前激活第3个区域
h1=plot(Pedal_Displacement_01,Brake_Pressure_01,'g','linewidth',1);hold on;
h2=plot(x1,FF(:,1),'-.r','linewidth',1);hold on;
legend([h1(1),h2(1)],'Experiment','RC model');
xlabel('Displacement(mm)'); ylabel('Force (Mpa)');

% 新增的第四个图：差异值随Pedal_Displacement_01的分布
subplot(4,1,4); % 新增一个区域，4行1列，当前激活第4个区域
difference = Brake_Pressure_01 - FF(:,1); % 计算差异
plot(Pedal_Displacement_01, difference, 'b-', 'LineWidth', 1.5); % 绘制差异值曲线
grid on; % 显示网格
title('Difference (Experiment - RC Model) along Pedal Displacement'); % 设置标题
xlabel('Pedal Displacement (mm)'); % 设置x轴标签
ylabel('Force Difference (Mpa)'); % 设置y轴标签
