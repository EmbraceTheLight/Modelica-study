within ;
model FirstOrder "A simple first order differential equation"

  // 模型注释必需插入在名称后面
  Real x "state variable";
initial equation

  // 添加初始条件，x 初始化为2
  x = 2 "Used before simulation to compute initial values";
  // der(x) = 0 "Initialize the system in steady state";
equation
  der(x) = 1 - x "Drives value of x toward 1.0";

  // 设置实验条件：仿真开始时间、结束时间
  annotation(experiment(StartTime=0,StopTime=8));
end FirstOrder;
