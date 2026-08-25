function y=sredn_Console_Shaft(h,t,x)     %Функция решения уравнений колебаний вала методом средней точки
Data_Console
E=eye(8,8);

M=1/Delta*[0 Delta 0 0 0 0 0 0;delt_22/m 0 0 0 0 0 -delt_12/m 0;0 0 0 Delta 0 0 0 0; 0 0 delt_22/m 0 delt_12/m 0 0 0;0 0 0 0 0 Delta 0 0;0 0 delt_12/I_1 0 delt_11/I_1 0 0 I_0/I_1*omega*(delt_11*delt_22-delt_12^2);0 0 0 0 0 0 0 Delta;-delt_12/I_1 0 0 0 0 -I_0/I_1*omega*(delt_11*delt_22-delt_12^2) delt_11/I_1 0];
y=((E-0.5*h*M)^(-1))*((E+0.5*h*M)*x);