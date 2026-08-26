function y=sredn_Flatter(h,t,x)
Data_Flatter
%РЕШЕНИЕ методом средней точки - уравнения движения
E=eye(4,4);
a31=kw*(r^2+b^2)/m/r^2;
a32=(b*ka-(r^2+b^2+a*b)*pi*rho*F*v^2)/m/r^2;
a41=b*kw/m/r^2;
a42=(ka-(b+a)*pi*rho*F*v^2)/m/r^2;
b33=(r^2+b^2+a*b)*pi*rho*F*v/m/r^2;
b34=b*d_aero/m/r^2;
b43=(b+a)*pi*rho*F*v/m/r^2;
b44=d_aero/m/r^2;
M=[0 0 1 0; 0 0 0 1;-a31 -a32 -b33 -b34;-a41 -a42 -b43 -b44];
y=((E-0.5*h*M)^(-1))*(x+0.5*h*M*x);
