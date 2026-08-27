%Script-файл Data_Centrifuge с исходными данными параметров ФГП центрифуги
m = 10;     
b = 1;      
k0 = 2.0e4;  
k1 = 5e7;   
omega_0=sqrt(k0/m);
omega_reg1=round(0.69*omega_0);
omega_reg2=round(1.14*omega_0);
omega_reg3=round(1.68*omega_0);