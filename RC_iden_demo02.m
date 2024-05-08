function J=RC_iden(V)
load('qingli01_Data.mat');  %试验数据 工作区

F_test1=p_test;
s_test1=x_test;
t1=0:0.001:1.818;
t1=t1';
t_test1=t1;
v_test1=gradient(x_test)./gradient(t1);
% 定义窗口长度
windowLength = 40;

% 创建一个窗口，这里使用简单的均匀窗口
window = ones(windowLength, 1) / windowLength;

% 计算移动平均
v_test1 = filter(window, 1, v_test1);

% 注意：filter函数的结果会在开始有一个"ramp-up"期，
% 因为它是逐渐"填满"窗口的过程。如果这是个问题，可以通过裁剪或其他方式进行调整。

% v_test1= y_new(:,2);

%待辨识参数，共12个，设置一个V向量
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