function J=RC_iden(V)
load('alldata.mat');  %试验数据 工作区

F_test1=p3_train;
s_test1=x3_train;
t1=0:0.001:(0.001*(length(F_test1)-1));
t1=t1';
t_test1=t1;
v_test1=gradient(s_test1)./gradient(t1);

% window_size = 10; % 设置移动平均窗口的大小
% v_test1_smooth = smoothdata(v_test1, 'movmean', window_size); % 平滑速度数据

% % 定义窗口长度
% windowLength = 20;
% 
% % 创建一个窗口，这里使用简单的均匀窗口
% window = ones(windowLength, 1) / windowLength;
% 
% % 计算移动平均
% v_test1 = filter(window, 1, v_test1);

% 注意：filter函数的结果会在开始有一个"ramp-up"期，
% 因为它是逐渐"填满"窗口的过程。如果这是个问题，可以通过裁剪或其他方式进行调整。


% v_test1= y_new(:,2);

%待辨识参数，共10个，设置一个V向量
a=V(1) ;            
a3 = V(2);
b=V(3);
c3 = V(4);
f0=V(5);
k=V(6);
m=V(7);
a1=0;a2=0;c1=0;c2=0;

options = simset('SrcWorkspace','current');
sim('RC_model_iden_dongtaifenduan.slx',[],options); %注意仿真时间设置为0.001*(length(F_test1)-1)-1),不然矩阵维度不一致

% 计算目标函数值
J = sum((F_test1 - F_sim1).^2)
V

% J=sum((F_test1-F_sim1).^2)

end