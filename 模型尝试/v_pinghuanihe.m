x2; %这个x2是RC_cal模块算出来的上下跳动的v

% 假设x2是一个849x1的数组
% 初始化x值
x = (1:849)';

% 直接计算每个段的线性拟合系数并更新y值
% 第一段 1-240
coeffs1 = polyfit(x(1:240), x2(1:240), 1);
y_new(1:240) = polyval(coeffs1, x(1:240));

% 第二段 241-540
coeffs2 = polyfit(x(241:540), x2(241:540), 1);
y_new(241:540) = polyval(coeffs2, x(241:540));

% 第三段 541-849
coeffs3 = polyfit(x(541:849), x2(541:849), 1);
y_new(541:849) = polyval(coeffs3, x(541:849));

% y_new现在是按照每段的线性函数拟合生成的新849x1数组
y_new = [t1,y_new];

