function solution_flatter
h=0.0005;    %Шаг
t=[0:h:20];    %Период интегрирования
x=[0.1 0 0.1 0]';   %Начальные условия

i=1; y(:,i)=x;
for i=2:size(t,2)
y(:,i)=sredn_Flatter(h,t(i-1),y(:,i-1));
end

%Графики угла и прогиба
figure
plot(t,y(1,:),'k'); grid on;
legend('угол атаки (м. cр. точки)');
xlabel('t'); ylabel('alp, м');
figure
plot(t,y(3,:),'b'); grid on;
legend('изгиб (прогиб) (м. cр. точки)');
xlabel('t'); ylabel('w, м');