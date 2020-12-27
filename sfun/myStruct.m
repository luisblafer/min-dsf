function outStruct = myStruct(method, hValues, stepNames, fileHead, ...
    legendLocation)
%MYSTRUCT Crea una estructura con los datos y calculo del metodo enviado
    for k=1:length(stepNames)
        outStruct(k).Metodo = method.Name;
        outStruct(k).h = hValues(k);
        outStruct(k).PasoIntegracion = stepNames{k};
        
        % Agrego una tabla calculada para el metodo y el paso de
        % integracion enviados como argumento
        outStruct(k).Data = addTable(method.Handler, hValues(k));
        
        % Creo un head dinamico para los archivos que seran guardados
        outStruct(k).FileHead = [fileHead '_' stepNames{k} '_' method.Name];
        
        % Asigno los atributos que se emplearan para los graficos
        outStruct(k).LegendLocation.Function = legendLocation.Function{k};
        outStruct(k).LegendLocation.GlobalError = legendLocation.GlobalError{k};

    end
end

