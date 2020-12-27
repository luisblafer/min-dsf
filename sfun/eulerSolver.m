function outStruct = eulerSolver(odeFunction, tspan, y0, h)
%EULERSOLVER Recibe un handler de funcion y agrega metadatos
%   Detailed explanation goes here
    outStruct.solver = 'euler1';
    outStruct.extdata.odefun = odeFunction;
%     st = dbstack;
%     disp(st);
    [x,y] = euler1(odeFunction,y0,tspan(end),h);
    outStruct.x = x;
    outStruct.y = y;
%     outStruct.st = st;
    
end

