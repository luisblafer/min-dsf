%% GRAFICAS DE SOLUCIONES PARA LA POSICION Y VELOCIDAD DEL PENDULO
% SE GRAFICAN LA SOLUCION ANALITICA vs. LAS SIMULACIONES EN SIMULINK DEL
% MODELO SIMPLIFICADO, EMPLEANDO LOS METODOS DE EULER Y HEUN.
% PASOS DE INTEGRACION:
%
%           h = [0.1]
%
% ADICIONALMENTE SE CALCULA LA CANTIDAD DE PASOS DE INTEGRACION QUE LE
% INSUME A CADA UNO.


init

printEps = true;


% Atributos generales
h = [0.1];
t0 = 0;
tf = 50;
tspan = [t0 tf];
y0 = [1 0]';


% Atributos para identificar a los Archivos/Graficas.
FileHead = 'PLOT_31';


% EJECUTAMOS EL SCRIPT QUE SE OCUPA DE GENERAR UNA SOLUCION ANALITICA DEL
% SISTEMA y TRAER LAS VARIABLES AL ESPACIO DE TRABAJO
% 
%    VARIABLE DE SALIDA: S.Analitica.t
%                        S.Analitica.x1
%                        S.Analitica.x2                    
%

DSF_TP0_S3E_COMMON_PENDULO_ANALITICA;


% EJECUTAMOS EL SCRIPT QUE SE OCUPA DE SIMULAR CON TODOS LOS METODOS Y
% ATRIBUTOS PEDIDOS PARA EL SISTEMA, Y DE TRAER AL ESPACIO DE TRABAJO LOS
% RESULTADOS EN UNA ESTRUCTURA
% 
%    CONJUNTO DE SALIDAS:   S.Euler.*
%                           S.Heun.*
%                           S.DormandPrince.*
%                           S.DormandPrinceDecimado.*
%                           S.NDF.*
%

DSF_TP0_S3E_COMMON_PENDULO;



%%
% GRAFICAS ANALITICA vs. SIMULACION EN SIMULINK DE LA POSICION, CON LOS
% METODOS DE EULER Y HEUN.

t = {S.Analitica.t, S.Euler.t, S.Heun.t};
x = {S.Analitica.x1, S.Euler.x1, S.Heun.x1};

optionsNameValStruct.FigureName     = [FileHead '_Euler-Heun_Posicion'];
optionsNameValStruct.LegendText     = {'Analitica', 'Metodo de Euler', ...
                                       'Metodo de Heun'};
optionsNameValStruct.LineColor      = [[0.1 0.1 0.1]; [0 0.477 0.7410]; ...
                                       [0.8500 0.3250 0.0980]];
optionsNameValStruct.LineWidth      = [1,2,2];
optionsNameValStruct.XLabelText     = 'Tiempo [s]';
optionsNameValStruct.YLabelText     = '$\theta(t)$';
optionsNameValStruct.Interpreter    = 'latex';
optionsNameValStruct.XLimSpan       = [0 50];
optionsNameValStruct.YLimSpan       = [-1 1];
optionsNameValStruct.LegendLocation = 'northeast';


plotAutomatico(t,x,optionsNameValStruct)


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' optionsNameValStruct.FigureName], '-depsc');
end


%%
% GRAFICAS ANALITICA vs. SIMULACION EN SIMULINK DE LA VELOCIDAD, CON LOS
% METODOS DE EULER Y HEUN.

t = {S.Analitica.t, S.Euler.t, S.Heun.t};
x = {S.Analitica.x2, S.Euler.x2, S.Heun.x2};

optionsNameValStruct.FigureName     = [FileHead '_Euler-Heun_Velocidad'];
optionsNameValStruct.LegendText     = {'Analitica', 'Metodo de Euler', ...
                                       'Metodo de Heun'};
optionsNameValStruct.LineColor      = [[0.1 0.1 0.1]; [0 0.477 0.7410]; ...
                                       [0.8500 0.3250 0.0980]];
optionsNameValStruct.LineWidth      = [1,2,2];
optionsNameValStruct.XLabelText     = 'Tiempo [s]';
optionsNameValStruct.YLabelText     = '$\omega(t)$';
optionsNameValStruct.Interpreter    = 'latex';
optionsNameValStruct.XLimSpan       = [0 50];
optionsNameValStruct.YLimSpan       = [-1 1];
optionsNameValStruct.LegendLocation = 'northeast';


plotAutomatico(t,x,optionsNameValStruct)


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' optionsNameValStruct.FigureName], '-depsc');
end

