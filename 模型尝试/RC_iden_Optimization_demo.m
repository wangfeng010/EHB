V_initial = [0 -100 -1500 -100 0 -5 -10 -5 -20 -5 ] % V的初始猜测值
[V_optimized, J_min] = fminsearch(@RC_iden_demo, V_initial);

% V_initial = [0 -100 -1500 -100 0 -5 -10 -5 -20 -5]; % V的初始猜测值
% V_optimized = RC_iden_optimization_GA(V_initial);