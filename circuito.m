function xdot = circuito(t,x)
%CIRCUITO Sistema a simular del circuito
%   Pasa por referencia la funcion del sistema
    xdot=[x(2);-x(1)-100*x(2)+1];
end

