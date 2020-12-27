function [t,x] = ejemplo1(h)
%EJEMPLO1 Resulve el sistema empleando metodo de Euler
%   Resuelve dx/dt=1-x
%   entre t=0 y t=10 para x0=0
%   utilizando el metodo de Euler
    x = 0;
    t = 0;
    N = 10/h;
    
    for k=1:N
        t(k+1)=t(k)+h;
        x(k+1)=x(k)+h*(1-x(k));
    end
end