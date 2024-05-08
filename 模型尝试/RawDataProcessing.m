plot(RawData(:,4),RawData(:,3));
xlabel('踏板行程'),ylabel('制动压力');
title('制动压力于、与踏板行程的关系');
axis([0 30 0 9])

Brake_Pressure = RawData(:,3);
Pedal_Displacement = RawData(:,4);
Pedal_Force = RawData(:,5);
FL_RR = RawData(:,6);
FR_RL = RawData(:,7);
FL = RawData(:,8);
FR = RawData(:,9);
RL = RawData(:,10);
RR = RawData(:,11);

% 将21秒均分为1056份
total_time = 21; % 总时间为21秒
num_divisions = 1056; % 分割数为1056
% 计算每个时间间隔
time_interval = total_time / num_divisions;
% 生成时间矩阵
t = (0:time_interval:total_time-time_interval)';
% 显示时间矩阵的维度
disp(['时间矩阵维度: ' num2str(size(t))]);