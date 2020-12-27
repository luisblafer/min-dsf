%% GRAFICAS DE SOLUCIONES PARA EL METODO DE BACKWARD EULER
% SE GRAFICAN LA SOLUCION ANALITICA vs. LA SOLUCION POR EL METODO DE
% BACKWARD EULER DEL SISTEMA ELEMENTAL DE PRIMER ORDEN DE UN CIRCUITO RL,
% PARA DIFERENTES PASOS DE INTEGRACION:
%
%           h = [0.01, 0.1, 1, 2, 3]
%
% ADICIONALMENTE PRESENTAN LAS GRAFICAS DEL ERROR GLOBAL PARA CADA UNO DE
% ESTOS PASOS DE INTEGRACION.


init

printEps = true;


% DEFINO ATRIBUTOS PARA CONSTRUIR Y EVALUAR LA DATA A UTILIZAR
% Metodo de Integracion: Euler, Heun, Backward_Euler
MethodAttr.Name = 'Backward-Euler';
MethodAttr.Handler = @ejemplo3;

% Pasos de integracion
hAttr = [0.01, 0.1, 1, 2, 3];

% Atributos para identificar a los Archivos/Graficas.
StepNameAttr = {'H1', 'H2', 'H3', 'H4', 'H5'};
FileHeadAttr = 'PLOT_23';

% Atributos para mejorar la visualizacion
LegendLocationAttr.Function = {'southeast','southeast','southeast', ...
                              'southeast','southeast'};
LegendLocationAttr.GlobalError = {'southeast','southeast','southeast', ...
                              'southeast','southeast'};
         


% CREO UNA ESTRUCTURA ITERATIVA QUE GUARDE LAS PROPIEDADES DE LAS
% SOLUCIONES
S = struct();
S = myStruct(MethodAttr, hAttr, StepNameAttr, FileHeadAttr, ...
             LegendLocationAttr);


% EXPORTAMOS LOS ERRORES DE LAS SOLUCIONES CONVERGENTES
cellBackwardEulerError = { 'Backward Euler', ...
                  max(abs(S(1).Data.Error)), ...
                  max(abs(S(2).Data.Error)), ...
                  max(abs(S(3).Data.Error))};

              save('output/backward-euler.mat', 'cellBackwardEulerError');
              
         
%%
% CREO FUNCION ANALITICA DE XA(t)
xAnalitica = @(t) 1 - exp(-t);


% EJECUTAMOS EL SCRIPT QUE SE OCUPA DE REALIZAR LAS GRAFICAS DE LA FUNCION
% ANALITICA vs. METODO DE INTEGRACION, Y GUARDAR AUTOMATICAMENTE EN
% ARCHIVOS LOS RESULTADOS.

DSF_TP0_S2E_COMMON_FUNCTION;


% EJECUTAMOS EL SCRIPT QUE SE OCUPA DE REALIZAR LAS GRAFICAS DE LA FUNCION
% ANALITICA vs. METODO DE INTEGRACION, Y GUARDAR AUTOMATICAMENTE EN
% ARCHIVOS LOS RESULTADOS.

DSF_TP0_S2E_COMMON_ERROR;

