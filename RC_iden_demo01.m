function J=RC_iden(V)
load('qingli01_Data.mat');  %试验数据 工作区

F_test1=Brake_Pressure_01;
s_test1=Pedal_Displacement_01;
t1=0:0.001:0.848;
t1=t1';
t_test1=t1;
% v_test1=gradient(Pedal_Displacement_01)./gradient(t1);
v_test1= y_new(:,2);

%待辨识参数，共10个，设置一个V向量
a=V(1);          
a1 = V(2);
a2 = V(3);
a3 = V(4);
b=V(5);
c1 = V(6);
c2 = V(7);
c3 = V(8);
f0=V(9);
k=V(10);
m=V(11);
cchuan=V(12);

options = simset('SrcWorkspace','current');
sim('RC_model_iden_bianjiegou',[],options); %注意仿真时间设置为0.848,不然矩阵维度不一致

% 计算目标函数值
J = sum((F_test1 - F_sim1).^2)
V

% J=sum((F_test1-F_sim1).^2)