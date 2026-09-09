% Script-файл Disks_8_eig_freq_and_forms.m расчета крутильных колебаний
% 8-дискового вала компрессора (задача 2)
clear; clc; close all;
n = 8; 
I_elements = [50.0, 12.0, 12.0, 12.0, 12.0, 12.0, 12.0, 25.0]; % кг*м^2
c_elements = [6.0e5, 6.0e5, 4.5e5, 4.5e5, 4.5e5, 3.0e5, 3.0e5]; % Н*м/рад
I = diag(I_elements);    % 1. ФОРМИРОВАНИЕ МАТРИЦЫ ИНЕРЦИИ (I)
C = zeros(n, n);    % 2. ФОРМИРОВАНИЕ ТРЕХДИАГОНАЛЬНОЙ МАТРИЦЫ ЖЕСТКОСТИ (C)
for i = 1:(n-1)
    c_val = c_elements(i);
    C(i, i)     = C(i, i)     + c_val;
    C(i, i+1)   = C(i, i+1)   - c_val;
    C(i+1, i)   = C(i+1, i)   - c_val;
    C(i+1, i+1) = C(i+1, i+1) + c_val;
end
delta_c = c_elements(1) / 100000; % 3. ВВЕДЕНИЕ ИСКУССТВЕННО МЯГКИХ ОПОР ДЛЯ ОБРАТИМОСТИ МАТРИЦЫ С
C(1,1) = C(1,1) + delta_c;
C(n,n) = C(n,n) + delta_c;
% Метод №1. Прямая динамическая матрица.
A1 = inv(I) * C;
[V1, L1] = eig(A1);
p_method1 = sqrt(real(diag(L1))); % Фильтр real для отфильтровывания мнимого шума при округлении
[p_method1, sort_idx1] = sort(p_method1);
V1 = V1(:, sort_idx1);
% Метод №2. Симметризованная матрица.
I_sqrt_inv = diag(1 ./ sqrt(diag(I)));
A2 = I_sqrt_inv * C * I_sqrt_inv;
[U2, L2] = eig(A2);
V2 = I_sqrt_inv * U2;
p_method2 = sqrt(real(diag(L2)));  % Фильтр real для отфильтровывания мнимого шума при округлении
[p_method2, sort_idx2] = sort(p_method2);
V2 = V2(:, sort_idx2);
% Метод №3. Обратная матрица податливости.
A3 = inv(C) * I;
[V3, L3] = eig(A3);
p_method3 = sqrt(real(1 ./ diag(L3))); % Фильтр real для отфильтровывания мнимого шума при округлении
[p_method3, sort_idx3] = sort(p_method3);
V3 = V3(:, sort_idx3);
% ВЫВОД СРАВНИТЕЛЬНОЙ ТАБЛИЦЫ СПЕКТРА ЧАСТОТ И НОРМИРОВКА
fprintf('==================================================\n');
fprintf('   СПЕКТР КРУТИЛЬНЫХ ЧАСТОТ ДЛЯ 8 ДИСКОВ (рад/с)  \n');
fprintf('==================================================\n');
fprintf('Мода |   Метод 1 (I^-1*C)  |  Метод 2 (Симметр)  |  Метод 3 (C^-1*I) \n');
for idx = 1:n
    fprintf('  %d  |    %12.4f   |    %12.4f     |    %12.4f \n', ...
            idx, p_method1(idx), p_method2(idx), p_method3(idx));
    V1(:, idx) = V1(:, idx) / norm(V1(:, idx));    % Нормировка форм колебаний для графиков
    V2(:, idx) = V2(:, idx) / norm(V2(:, idx));
    V3(:, idx) = V3(:, idx) / norm(V3(:, idx));
end
% ВИЗУАЛИЗАЦИЯ 8 СОБСТВЕННЫХ ФОРМ (Размещение в окне субплотов 4х2)
figure('Name', 'Собственные формы крутильных колебаний 8-дискового вала', 'Color', 'w');
disk_indices = 1:n;
for mode_idx = 1:n
    subplot(4, 2, mode_idx);
    hold on; grid on; box on;
    plot(disk_indices, V1(:, mode_idx), 'b-o', 'LineWidth', 1.2, 'MarkerFaceColor', 'b');       % Отрисовка трех методов на одной координатной сетке
    plot(disk_indices, V2(:, mode_idx), 'r--x', 'LineWidth', 1.2, 'MarkerSize', 7);
    plot(disk_indices, V3(:, mode_idx), 'k:s', 'LineWidth', 1.0, 'MarkerFaceColor', 'none');
    xlim([0.5, n + 0.5]); set(gca, 'XTick', disk_indices);
    ylabel('\theta, рад');
    xlabel('Номер диска вала');
    title(['Собственная форма колебаний №', num2str(mode_idx), ' (p = ', num2str(p_method2(mode_idx), '%.1f'), ' рад/с)']);
    if mode_idx == 1
        legend('Метод 1', 'Метод 2', 'Метод 3', 'Location', 'best');
    end
end