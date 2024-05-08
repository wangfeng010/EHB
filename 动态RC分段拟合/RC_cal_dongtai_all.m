%% 加载数据
load("alldata.mat");
x_train = {x1_train, x2_train, x3_train};
I=0;
c1=0;c2=0;a1=0;a2=0;

FF = cell(1, 3);

%% 算三组的p_sim放到FF的前三列
for i = 1:3
    % 直接从元胞数组中取出数据
    Pedal_Displacement = x_train{i};
    
    % 假设Pedal_Displacement是一个向量，根据实际情况调整时间向量的创建
    t = (0:length(Pedal_Displacement)-1)' * 0.001;
    Pedal_Displacement_t = [t, Pedal_Displacement]; % 直接使用向量
    
    % 根据i设置参数
    switch i
        case 1
            params = struct('a', 39.1063, 'a3', -5.9349, 'b', 1.5290, 'c3', 0.0004, 'f0', -6.5912, 'k', 0.7788, 'm', 0.0000);
        case 2
            params = struct('a', 0.2609, 'a3', 0.6095, 'b', 2.3796, 'c3', 0.0000, 'f0', -9.8732, 'k', 0.6627, 'm', 0.0273);
        case 3
            params = struct('a', 4.8429, 'a3', 1.9167, 'b', 1.0523, 'c3', 0.0002, 'f0', 1.9105, 'k', -0.0265, 'm', 0.0000);
    end
    
    % 使用结构体中的参数
    a = params.a;
    a3 = params.a3;
    b = params.b;
    c3 = params.c3;
    f0 = params.f0;
    k = params.k;
    m = params.m;

    % 模拟
    simTime = length(x_train{i})*0.001-0.001; % 根据数据集长度确定仿真时间
    set_param('RC_calculation_dongtai_fenduan', 'StopTime', num2str(simTime));
    sim('RC_calculation_dongtai_fenduan');
    FF{i} = Fsim;
end

%% tall
% 计算总时间
totalLength = 0;
for i = 1:3
    totalLength = totalLength + length(x_train{i});
end
% 创建一个连续的时间向量tall
tall = (0:totalLength-1)' /50; %还原为真实时间（因为采集频率是50hz）

%% xall
% 初始化xall为空的列向量
xall = [];

% 循环遍历x_train并连续串联所有向量
for i = 1:length(x_train)
    xall = [xall; x_train{i}];
end

%% pall
% 假设FF已经被定义，并且有至少三列数据
% 初始化pall为空的列向量
pall = [];

% 循环遍历FF并连续串联所有向量
for i = 1:length(FF)
    pall = [pall; FF{i}];
end

%% 绘图
figure;

% 第一个图：时间与Force的关系
subplot(2,2,1); % 调整为4行1列，当前激活第1个区域
plot(tall,pall,'-.r','linewidth',1); hold on;
plot(tall,pall_train,'g','linewidth',1); hold off;
legend('模拟值','训练值');
title('时间与Force的关系');
xlabel('时间 (s)'); 
ylabel('Force (MPa)');

% % 第二个图：时间与Pedal Displacement的关系
% subplot(3,1,2); % 调整为4行1列，当前激活第2个区域
% plot(tall,xall,'-.r','linewidth',1); hold on;
% plot(tall,xall_train,'g','linewidth',1); hold off;
% legend('模拟值','训练值');
% title('时间与Pedal Displacement的关系');
% xlabel('时间 (s)'); 
% ylabel('Pedal Displacement (mm)');

% 第三个图：Pedal Displacement与Force的关系
subplot(2,2,2); % 调整为4行1列，当前激活第3个区域
plot(xall,pall,'-.r','linewidth',1); hold on;
plot(xall_train,pall_train,'g','linewidth',1); hold off;
legend('模拟值','训练值');
title('Pedal Displacement与Force的关系');
xlabel('Pedal Displacement (mm)'); 
ylabel('Force (MPa)');

% 第四个图：误差图
subplot(2,2,3); % 调整为4行1列，当前激活第4个区域
% 计算误差
errors = pall_train - pall;
plot(tall, errors, 'b-', 'LineWidth', 1.5); 
grid on;
title('误差（训练值 - 模拟值）');
xlabel('时间 (s)'); 
ylabel('Force Difference (MPa)');

% 第五个图：误差图
subplot(2,2,4); % 调整为4行1列，当前激活第4个区域
% 计算误差
errors = pall_train - pall;
plot(xall, errors, 'b-', 'LineWidth', 1.5); 
grid on;
title('误差（训练值 - 模拟值）');
xlabel('Pedal Displacement (mm)'); 
ylabel('Force Difference (MPa)');