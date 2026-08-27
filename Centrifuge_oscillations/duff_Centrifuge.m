function dZdt = duffing_centrifuge(t, Z, m, b, k0, k1, e, omega)
    x     = Z(1);
    y     = Z(2);
    x_dot = Z(3);
    y_dot = Z(4);
        
    r2 = x^2 + y^2;   % Квадрат модуля радиус-вектора смещения ротора
    
    % ИСКАЖАЕМ ВЕКТОР СИЛЫ: по оси X множитель 3.0, по оси Y - классический 1.0
    dZdt = [
        x_dot;
        y_dot;
        (3.0 * m*e*omega^2*cos(omega*t) - b*x_dot - k0*x - k1*x*r2) / m;
        (1.0 * m*e*omega^2*sin(omega*t) - b*y_dot - k0*y - k1*y*r2) / m
    ];
end