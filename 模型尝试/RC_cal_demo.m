%% 参数辨识后的参数
a=0.3;
a1=189.2;
a2 =709.081;
a3 =0;
b=0;
c1 =11;
c2 =22.7;
c3 =0;
f0=-2.1;
k=0.3;
Imin=0;
Imax=1;

%% 含有RC算子的唯象模型 计算广义力的理论图像
% 这里根据i的大小递增I画了一组曲线
for i=0:2:10
    I=0.1*i;
sim('RC_calculation_2017a'); %注意仿真时间设置为1.055,不然矩阵维度不一致
FF(:,i/2+1)=Fsim;
end

%% 图像绘制
% 力时间曲线
figure(1);
h1=plot(t1,Brake_Pressure,'g','linewidth',1);hold on;
h2=plot(t1,FF(:,1),'-.r','linewidth',1);hold on;
legend([h1(1),h2(1)],'Experiment','RC model');
xlabel('Time(s)'); ylabel('Force (kN)');

% 位移时间曲线
figure(2);
h1=plot(t1,Pedal_Displacement,'g','linewidth',1);hold on;
h2=plot(t1,x1,'-.r','linewidth',1);hold on;
legend([h1(1),h2(1)],'Experiment','RC model');
xlabel('Time(s)'); ylabel('Displacement(mm)');

% 力位移曲线
figure(3);
h1=plot(Pedal_Displacement,Brake_Pressure,'g','linewidth',1);hold on;
h2=plot(x1,FF(:,1)/1000,'-.r','linewidth',1);hold on;
legend([h1(1),h2(1)],'Experiment','RC model');
xlabel('Displacement(mm)'); ylabel('Force (kN)');

% 力速度曲线
% figure(3);
% h1=plot(x2_f_10,F_f_10,'g','linewidth',1);hold on;
% h2=plot(x2,FF(:,1)/1000,'-.r','linewidth',1);hold on;
% legend([h1(1),h2(1)],'Experiment','RC model');
% axis([-80 80 -1.5 1.5])
% xlabel('Velocity (mm/s)'); ylabel('Force (kN)');
