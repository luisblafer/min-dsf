function outStruct = myStruct2( hValues, stepNames, fileHead, ...
    legendLocation, odeFunction)
%MYSTRUCT Crea una estructura con los datos y calculo del metodo enviado
    for k=1:length(stepNames)
        % outStruct(k).Metodo = method.Name;
        outStruct(k).h = hValues(k);
        outStruct(k).PasoIntegracion = stepNames{k};
        
        % Creo un head dinamico para los archivos que seran guardados
        outStruct(k).FileHead = [fileHead '_' stepNames{k}];
        
        outStruct(k).Euler.Data = eulerSolver(odeFunction.Handler, ...
                     odeFunction.Tspan,odeFunction.y0,hValues(k));
        outStruct(k).Euler.Name = 'Euler';
        outStruct(k).Heun.Data = heunSolver(odeFunction.Handler, ...
                     odeFunction.Tspan,odeFunction.y0,hValues(k));
        outStruct(k).Heun.Name = 'Heun';

        
        % Asigno los atributos que se emplearan para los graficos
        outStruct(k).LegendLocation.Posicion = legendLocation.Posicion{k};
        outStruct(k).LegendLocation.Velocidad = legendLocation.Velocidad{k};

    end
end

