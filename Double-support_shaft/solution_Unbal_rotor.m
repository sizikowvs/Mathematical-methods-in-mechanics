function solution_Unbal_rotor    %Функция интегрирования уравнений движения на заданном интервале времени и построения графиков
h=0.005;    %Шаг
t=[0:h:10];    %Период интегрирования
x=[0 0 0 0]';   %Начальные условия
y = zeros(4,1);

i=1; 
y(1:4,i)=x;
for i=2:size(t,2)
y(1:4,i)=sredn_Unbal_rotor(h,t(i-1),y(:,i-1));
end

%Графики координаты ц.м. диска
figure
plot(t,y(1,:),'k'); grid on;
legend('координата x (м. cр. точки)');
xlabel('t'); ylabel('x_C, м');

figure
plot(y(1,:),y(3,:),'r'); grid on;
legend('траектория ц.м. (м. cр. точки)');
xlabel('x_C, м'); ylabel('y_C, м');