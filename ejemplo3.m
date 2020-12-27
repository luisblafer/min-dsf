function [t,x] = ejemplo3(h)
%EJEMPLO2 Resulve el sistema empleando metodo de Backward Euler
%   Resuelve dx/dt=1-x
%   entre t=0 y t=10 para x0=0
%   utilizando el metodo de Backward Euler
    x = 0;
    t = 0;
    N = 10/h;
    
    for k=1:N
        t(k+1)=t(k)+h;
        x(k+1)=(x(k)+h)/(1+h);
    end
end
