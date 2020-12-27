function outStruct = heunSolver(odeFunction, tspan, y0, h)
%HEUNSOLVER Recibe un handler de funcion y agrega metadatos
%   Detailed explanation goes here
    outStruct.solver = 'heun2';
    outStruct.extdata.odefun = odeFunction;
%     st = dbstack;
%     disp(st);
    [x,y] = heun2(odeFunction,y0,tspan(end),h);
    outStruct.x = x;
    outStruct.y = y;
%     outStruct.st = st;
    
end

