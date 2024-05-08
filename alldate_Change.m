load("test1.mat");

t_test = 0:0.001:1.818;
t_test = t_test';

% 检查x_test中的NaN值并将它们替换为0
x_test(isnan(x_test)) = 0;
x_test_t = [t_test, x_test];

t_test = 0:0.001:1.818;  % 这行代码实际上是重复的，可以省略
t_test = t_test';

% 检查p_test中的NaN值并将它们替换为0
p_test(isnan(p_test)) = 0;
p_test_t = [t_test, p_test];
