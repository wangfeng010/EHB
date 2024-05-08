function J=RC_iden(V)
load('Data.mat');  %试验数据 工作区

F_test1=Brake_Pressure;
s_test1=Pedal_Displacement;
v_test1=gradient(Pedal_Displacement)./gradient(t);
t1=0:0.001:1.055;
t1=t1';
t_test1=t1;

%待辨识参数，共10个，设置一个V向量
a=V(1) ;            
a1 = V(2);
a2 = V(3);
a3 = V(4);
b=V(5);
c1 = V(6);
c2 = V(7);
c3 = V(8);
f0=V(9);
k=V(10);

options = simset('SrcWorkspace','current');
sim('RC_model_iden',[],options);

% 计算目标函数值
J = sum((F_test1 - F_sim1).^2)
V

% J=sum((F_test1-F_sim1).^2)