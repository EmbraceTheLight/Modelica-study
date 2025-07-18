within ;
model NewtonCooling
  // 使用基本类型派生出新类型，并直接指定新类型的单位等属性。
  type Temperature = Real(unit="K", min=0);
  type CovectionCoefficient = Real(unit="W/(m2.K)", min=0);
  type Area = Real(unit="m2", min = 0);
  type Mass = Real(unit="kg", min=0);
  type SpecificHeat = Real(unit="J/(K.kg)", min=0);

  // parameter 参数必须提供一个值
  parameter Temperature T_inf = 25 "Ambient temperature";
  parameter Temperature T0 = 90 "initial temperature";
  parameter CovectionCoefficient h(unit="W/(m2.K)") = 0.7 "Convective cooling coefficient";
  parameter Area A = 1.0 "Surface area";
  parameter Mass m = 0.1 "Mass of thermal capacitance";

  // 变量名后面使用 unit 关联物理单位, 也可以向上面一样使用基本类型派生出新类型，并直接指定新类型的单位等属性。
  parameter SpecificHeat c_p(unit="J/(K.kg)") = 1.2 "Specific heat";

  Real T "Temperature";
initial equation
  T = T0 "Specify initial value for T";
equation
  m*c_p*der(T) = h*A*(T_inf-T) "Newton's law of cooling";
end NewtonCooling;
