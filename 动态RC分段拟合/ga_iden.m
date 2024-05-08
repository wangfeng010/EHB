% 定义目标函数
fun = @RC_iden_dongtai;

% 参数的下界和上界
lb = [0, -10, 0, 0, -50, -5, 0];
ub = [100, 20, 10, 10, 10, 10, Inf];

% 参数个数
nvars = 7;

% 调用遗传算法进行优化
[V_optimized, J_min] = ga(fun, nvars, [], [], [], [], lb, ub, [], []);

% 输出优化结果
disp('Optimized Parameters:');
disp(V_optimized);
disp('Minimum Objective Function Value:');
disp(J_min);
