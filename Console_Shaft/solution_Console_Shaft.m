function solution_Console_Shaft    %Функция интегрирования уравнений движения на заданном интервале времени и построения графиков
h=0.0005;    %Шаг
t=[0:h:10];    %Период интегрирования
x=[0.01; 0; 0; 0; 0; 0.175; 0; 0]';   %Начальные условия
y = zeros(8,1);

i=1; 
y(1:8,i)=x;
for i=2:size(t,2)
y(1:8,i)=sredn_Console_Shaft(h,t(i-1),y(:,i-1));
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