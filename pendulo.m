function xdot = pendulo(t,x)
%PENDULO Sistema a simular del pendulo
%   Pasa por referencia la funcion del sistema
    xdot=[x(2);-sin(x(1))-0.1*x(2)];
end

