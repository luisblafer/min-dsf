%% GRAFICAS DE SOLUCIONES DEL CIRCUITO RLC SERIE
% SE GRAFICAN LA SOLUCION ANALITICA vs. LAS SIMULACIONES EN SIMULINK DEL
% MODELO DEL CIRCUITO, EMPLEANDO EN METODO ODE15s
%
% ADICIONALMENTE SE CALCULA LA CANTIDAD DE PASOS DE INTEGRACION QUE LE
% INSUME A CADA UNO.


init

printEps = true;


% Atributos generales
h = [0.1];
t0 = 0;
tf = 500;
tspan = [t0 tf];
y0 = [0 0]';

%Atributos del cricuito
R = 100;
L = 1;
C = 1;
U = 1;


% Atributos para identificar a los Archivos/Graficas.
FileHead = 'PLOT_332';


% EJECUTAMOS EL SCRIPT QUE SE OCUPA DE GENERAR UNA SOLUCION ANALITICA DEL
% SISTEMA y TRAER LAS VARIABLES AL ESPACIO DE TRABAJO
% 
%    VARIABLES DE SALIDA: S.Analitica.t
%                         S.Analitica.x1
%                         S.Analitica.x2                    
%

DSF_TP0_S3E_COMMON_CIRCUITO_ANALITICA;


% EJECUTAMOS EL SCRIPT QUE SE OCUPA DE SIMULAR CON TODOS LOS METODOS Y
% ATRIBUTOS PEDIDOS PARA EL SISTEMA, Y DE TRAER AL ESPACIO DE TRABAJO LOS
% RESULTADOS EN UNA ESTRUCTURA
% 
%    CONJUNTO DE SALIDAS:   S.DormandPrince.*
%                           S.NDF.*
%

DSF_TP0_S3E_COMMON_CIRCUITO;


% OBTENEMOS LAS TENSIONES DE CADA UNO DE LOS COMPONENTES DEL CIRCUITO
% EMPLEANDO LAS VARIABLES DE ESTADO.

ur = S.DormandPrince.x2 * R;
ul = - S.DormandPrince.x2 * R - S.DormandPrince.x1 + 1;
uc = S.DormandPrince.x1;


%%
% GRAFICAS DE LAS SIMULACIONES EN SIMULINK DE LAS TENSIONES, CON EL METODO
% DE DORMAND-PRINCE (ode45)

t = {S.DormandPrince.t, S.DormandPrince.t, S.DormandPrince.t};
x = {ur, ul, uc};

optionsNameValStruct.FigureName     = [FileHead '_ODE45_Tensiones'];
optionsNameValStruct.LegendText     = {'Resistencia', 'Inductor', ...
                                       'Capacitor'};
optionsNameValStruct.LineColor      = [[0 0.477 0.7410]; ...
                                       [0.8500 0.3250 0.0980]; ...
                                       [0.9290 0.6940 0.1250]];
optionsNameValStruct.LineWidth      = [1.2,1.2,1.2];
optionsNameValStruct.XLabelText     = 'Tiempo [s]';
optionsNameValStruct.YLabelText     = 'Tension';
optionsNameValStruct.Interpreter    = 'none';
optionsNameValStruct.XLimSpan       = [0 500];
optionsNameValStruct.YLimSpan       = [-0.2 1];
optionsNameValStruct.LegendLocation = 'northeast';


plotAutomatico(t,x,optionsNameValStruct)


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' optionsNameValStruct.FigureName], '-depsc');
end


%%
% GRAFICO DE EVOLUCION DEL PASO DE INTEGRACION EN CADA ITERACION CON EL
% METODO DE DORMAND-PRINCE (ode45)

y = {diff(S.DormandPrince.t)};

optionsNameValStruct.FigureName     = [FileHead '_ODE45_EVOLUCION_HxI'];
optionsNameValStruct.LegendText     = {};
optionsNameValStruct.LineColor      = [[0 0.477 0.7410]; [0.8500 0.3250 0.0980]; [0.9290 0.6940 0.1250]];
optionsNameValStruct.LineWidth      = [1.25];
optionsNameValStruct.XLabelText     = 'Iteracion [#]';
optionsNameValStruct.YLabelText     = 'h [s]';
optionsNameValStruct.Interpreter    = 'none';
optionsNameValStruct.XLimSpan       = [0 15000];
optionsNameValStruct.XTicks         = [0:2500:15000];
optionsNameValStruct.YLimSpan       = [0 0.045];
optionsNameValStruct.LegendLocation = 'northeast';


stairsAutomatico(y,optionsNameValStruct)


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' optionsNameValStruct.FigureName], '-depsc');
end


%%
% GRAFICO DE EVOLUCION DEL PASO DE INTEGRACION EN CADA ITERACION CON EL
% METODO DE DORMAND-PRINCE (ode45) AMPLIADO

y = {diff(S.DormandPrince.t)};

optionsNameValStruct.FigureName     = [FileHead '_ODE45_EVOLUCION_HxI-A'];
optionsNameValStruct.LegendText     = {};
optionsNameValStruct.LineColor      = [[0 0.477 0.7410]; [0.8500 0.3250 0.0980]; [0.9290 0.6940 0.1250]];
optionsNameValStruct.LineWidth      = [1.25];
optionsNameValStruct.XLabelText     = 'Iteracion [#]';
optionsNameValStruct.YLabelText     = 'h [s]';
optionsNameValStruct.Interpreter    = 'none';
optionsNameValStruct.XLimSpan       = [0 45];
optionsNameValStruct.XTicks         = [0:5:45];
optionsNameValStruct.YLimSpan       = [0 0.045];
optionsNameValStruct.LegendLocation = 'northeast';


stairsAutomatico(y,optionsNameValStruct)


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' optionsNameValStruct.FigureName], '-depsc');
end


%%
% GRAFICO DE EVOLUCION DEL PASO DE INTEGRACION DURANTE TODA LA SIMULACION
% MEDIANTE EL METODO DE DORMAND-PRINCE (ode45)

y = {S.DormandPrince.t};

optionsNameValStruct.FigureName     = [FileHead '_ODE45_EVOLUCION_HxT'];
optionsNameValStruct.LegendText     = {};
optionsNameValStruct.LineColor      = [[0.8500 0.3250 0.0980]; [0.9290 0.6940 0.1250]];
optionsNameValStruct.LineWidth      = [1.25];
optionsNameValStruct.XLabelText     = 'Iteracion [#]';
optionsNameValStruct.YLabelText     = 'Tiempo de simulacion [s]';
optionsNameValStruct.Interpreter    = 'none';
optionsNameValStruct.XLimSpan       = [0 15000];
optionsNameValStruct.XTicks         = [0:2500:15000];
optionsNameValStruct.YLimSpan       = [0 500];
optionsNameValStruct.LegendLocation = 'northeast';


stairsAutomatico(y,optionsNameValStruct)


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' optionsNameValStruct.FigureName], '-depsc');
end


%%
% GRAFICO DE EVOLUCION DEL PASO DE INTEGRACION DURANTE TODA LA SIMULACION
% MEDIANTE EL METODO DE DORMAND-PRINCE (ode45)

y = {S.DormandPrince.t};

optionsNameValStruct.FigureName     = [FileHead '_ODE45_EVOLUCION_HxT-A'];
optionsNameValStruct.LegendText     = {};
optionsNameValStruct.LineColor      = [[0.8500 0.3250 0.0980]; [0.9290 0.6940 0.1250]];
optionsNameValStruct.LineWidth      = [1.25];
optionsNameValStruct.XLabelText     = 'Iteracion [#]';
optionsNameValStruct.YLabelText     = 'Tiempo de simulacion [s]';
optionsNameValStruct.Interpreter    = 'none';
optionsNameValStruct.XLimSpan       = [0 30];
optionsNameValStruct.XTicks         = [0:5:30];
optionsNameValStruct.YLimSpan       = [0 1];
optionsNameValStruct.LegendLocation = 'northeast';


stairsAutomatico(y,optionsNameValStruct)


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' optionsNameValStruct.FigureName], '-depsc');
end
