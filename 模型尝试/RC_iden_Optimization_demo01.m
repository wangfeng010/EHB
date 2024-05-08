% V_initial = [0.8 238 1425 0 0 25 -7 -1 -3 0 ] % V的初始猜测值
%V_initial = [0.3 189.2 709.081 0 0 11 22.7 0 -2.1 0.3 ] % V的初始猜测值
V_initial = [0.3 217 52 0 0 3 0 0 -9 0.4 0] % V的初始猜测值
[V_optimized, J_min] = fminsearch(@RC_iden_demo01, V_initial);

