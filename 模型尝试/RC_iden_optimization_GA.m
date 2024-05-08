% 定义目标函数
fun = @RC_iden_dongtai;

% 参数的数量
nvars = 7;

% 参数的下界和上界
lb = [0, -5, 0, 0, -10, -5, 0];
ub = [10, 20, 10, 10, 10, 10, inf];

% 遗传算法选项设置
options = optimoptions('ga', ...
    'PopulationSize', 100, ... % 种群大小
    'MaxGenerations', 100, ... % 最大迭代次数
    'Display', 'iter', ... % 显示每一代的迭代信息
    'PlotFcn', {@gaplotbestf, @gaplotdistance}); % 在迭代过程中绘制的图形

% 调用ga函数进行优化
[V_optimized, J_min] = ga(fun, nvars, [], [], [], [], lb, ub, [], options);



