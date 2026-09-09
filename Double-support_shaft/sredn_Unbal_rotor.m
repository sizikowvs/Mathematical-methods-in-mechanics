function y=sredn_Unbal_rotor(h,t,x)     %Функция решения уравнений колебаний вала методом средней точки
Data_Unbal
E=eye(2,2);

M=[0 1; -omega_0^2 -2*h_v];
y(1:2)=((E-0.5*h*M)^(-1))*((E+0.5*h*M)*x(1:2)+h*[0 e*omega_0^2*cos(omega*(t+h/2))]');
y(3:4)=((E-0.5*h*M)^(-1))*((E+0.5*h*M)*x(3:4)+h*[0 e*omega_0^2*sin(omega*(t+h/2))]');