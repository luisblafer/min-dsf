function outTable = addTable(methodHandler, h)
%ADDTABLE Summary of this function goes here
%   Detailed explanation goes here

[t,x] = methodHandler(h);


% Calculo solucion analitica para el vector t
xa = 1 - exp(-t);

% Creo Tabla para con Tiempo, solucion numerica y analitica
outTable = table(t', x', xa',...
    'VariableNames',{'Time', 'MIN','Analitica'});

% Calculo el Error Global por Truncamiento
outTable.Error = outTable.MIN - outTable.Analitica;

% Le agrego unidades a la tabla
outTable.Properties.VariableUnits = {'seg' '' '' '' };
end

