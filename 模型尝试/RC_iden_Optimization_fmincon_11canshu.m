% 定义目标函数
fun = @RC_iden_demo01;

% 初始迭代位置
x0 = [0.3, 217,52,0, 0, 3,0,0, -9, 0.4 0];

% 线性约束（这里不需要）
A = [];
b = [];
Aeq = [];
beq = [];

% 参数的下界和上界
lb = [0,0,0,-5,-5,0,0,0,-10,-5,0];
ub = [10,300,100,20,10,10,10,10,10,10,inf];
    
% 非线性约束（这里不需要）
nonlcon = [];

% 调用fmincon函数进行优化
[V_optimized, J_min] = fmincon(fun, x0, A, b, Aeq, beq, lb, ub, nonlcon);