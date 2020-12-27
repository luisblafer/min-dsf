%% GRAFICAS DE SOLUCIONES PARA LA POSICION DEL PENDULO
% SE GRAFICAN LA SOLUCION ANALITICA vs. LA SOLUCION POR EL METODO DE EULER
% DEL SISTEMA ELEMENTAL DE PRIMER ORDEN DE UN CIRCUITO RL, PARA DIFERENTES
% PASOS DE INTEGRACION:
%
%           h = [0.01, 0.1, 1, 2, 3]
%
% ADICIONALMENTE PRESENTAN LAS GRAFICAS DEL ERROR GLOBAL PARA CADA UNO DE
% ESTOS PASOS DE INTEGRACION.


init

printEps = true;


% Pasos de integracion
hAttr = [0.01, 0.1, 1, 2, 3];
t0 = 0;
tf = 50;
tspan = [t0 tf];
y0 = [1 0]';


% MethodAttr.Name = 'Euler1';
% MethodAttr.Handler = @eulerStruct;

OdeFunAttr.Handler = @pendulo;
OdeFunAttr.Tspan = tspan;
OdeFunAttr.y0 = y0;


% Atributos para identificar a los Archivos/Graficas.
StepNameAttr = {'H1', 'H2', 'H3', 'H4', 'H5'};
FileHeadAttr = 'PLOT_24';

% Atributos para mejorar la visualizacion
LegendLocationAttr.Posicion = {'southeast','southeast','southwest', ...
                              'northwest','southwest'};
LegendLocationAttr.Velocidad = {'northeast','northeast','northeast', ...
                              'northwest','northwest'};

S = struct();
S = myStruct2(hAttr,StepNameAttr,FileHeadAttr, LegendLocationAttr,OdeFunAttr);


% CREO SOLUCION ANALITICA DE XA(t) USANDO ODE45
sol = ode45(@pendulo,tspan,y0);

% REEVALUAMOS LA SOLUCION DEL SISTEMA, UTILIZANDO UN PASO DE INTEGRACION DE
% UN ORDEN ME MAGNITUD MENOR AL DEL MINIMO PASO DE INTEGRACION A SIMULAR.
tAnalitica = [sol.x(1) : 0.001 : sol.x(end)];

% VECTORES DE RESPUESTAS ANALITICAS
    % -- POSICION
    x1_Analitica = deval(sol,tAnalitica,1);

    % -- VELOCIDAD ANGULAR
    x2_Analitica = deval(sol,tAnalitica,2);




% GRAFICAS ANALITICA vs. METODOS NUMERICOS DE LA POSICION, PARA LOS
% DIFERENTES PASOS DE INTEGRACION.
for k = 1:numel(S)

    
% EXTRAIGO LOS ATRIBUTOS Y DATOS DESDE LA ESTRUCTURA
h = S(k).h;

t_Euler = S(k).Euler.Data.x;
x1_MIN_Euler = S(k).Euler.Data.y(1,:);

t_Heun = S(k).Heun.Data.x;
x1_MIN_Heun = S(k).Heun.Data.y(1,:);
%x2_MIN_Euler = S(k).Euler.Data.y(2,:);
%x2_MIN_Heun = S(k).Heun.Data.y(2,:);


% HANDLER DE FIGURA DE SOLUCION ANALITICA vs. METODOS NUMERICOS
fig = figure('Name', [S(k).FileHead '_Posicion']);
hold on


% GRAFICAS DE LAS RESPUESTAS TEMPORALES
    % -- ANALITICA
    hA = plot(tAnalitica, x1_Analitica);
                           
    % -- METODOS NUMERICOS
    hMIN_Euler = plot(t_Euler, x1_MIN_Euler);
    hMIN_Heun = plot(t_Heun, x1_MIN_Heun);
    
                      
    
% AJUSTO PROPIEDADES DE LAS LINEAS (FUNCIONAL)
    % -- FUNCIONAL
    set(hA, 'Color', [0.1 0.1 0.1]);
    set(hMIN_Euler, 'Color', [0 0.477 0.7410]);
    set(hMIN_Heun, 'Color', [0.8500 0.3250 0.0980]);
    
    % -- ESTETICO
    set(hA, 'LineWidth', 1);
    set(hMIN_Euler, 'LineWidth', 2);
    set(hMIN_Heun, 'LineWidth', 2);
    
% Add labels
hXLabel = xlabel('Tiempo [s]');
hYLabel = ylabel('$\theta(t)$','Interpreter','Latex');

% Add legend
hLegend = legend([hA, hMIN_Euler, hMIN_Heun], ...
                 'Analitica', ['Metodo ' S(k).Euler.Name], ...
                 ['Metodo ' S(k).Heun.Name], ...
                 'Location', [S(k).LegendLocation.Posicion]);

             
             
% Ajust font
set(gca, 'FontName', 'Helvetica');
%set([hXLabel, hYLabel], 'FontName', 'Nunito');
set([hLegend, gca], 'FontSize', 10);
set([hXLabel, hYLabel], 'FontSize', 12);

% Adjust axes properties
grid on
set(gca, 'XLim', [0 50]);
%set(gca, 'YLim', [-10 10]);

hold off


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' S(k).FileHead '_Posicion'], '-depsc');
end

end

% GRAFICAS ANALITICA vs. METODOS NUMERICOS DE LA VELOCIDAD, PARA LOS
% DIFERENTES PASOS DE INTEGRACION.
for k = 1:numel(S)

    
% EXTRAIGO LOS ATRIBUTOS Y DATOS DESDE LA ESTRUCTURA
h = S(k).h;

t_Euler = S(k).Euler.Data.x;
x2_MIN_Euler = S(k).Euler.Data.y(2,:);

t_Heun = S(k).Heun.Data.x;
x2_MIN_Heun = S(k).Heun.Data.y(2,:);
%x2_MIN_Euler = S(k).Euler.Data.y(2,:);
%x2_MIN_Heun = S(k).Heun.Data.y(2,:);


% HANDLER DE FIGURA DE SOLUCION ANALITICA vs. METODOS NUMERICOS
fig = figure('Name', [S(k).FileHead '_Velocidad']);
hold on


% GRAFICAS DE LAS RESPUESTAS TEMPORALES
    % -- ANALITICA
    hA = plot(tAnalitica, x2_Analitica);
                           
    % -- METODOS NUMERICOS
    hMIN_Euler = plot(t_Euler, x2_MIN_Euler);
    hMIN_Heun = plot(t_Heun, x2_MIN_Heun);
    
                      
    
% AJUSTO PROPIEDADES DE LAS LINEAS (FUNCIONAL)
    % -- FUNCIONAL
    set(hA, 'Color', [0.1 0.1 0.1]);
    set(hMIN_Euler, 'Color', [0 0.477 0.7410]);
    set(hMIN_Heun, 'Color', [0.8500 0.3250 0.0980]);
    
    % -- ESTETICO
    set(hA, 'LineWidth', 1);
    set(hMIN_Euler, 'LineWidth', 2);
    set(hMIN_Heun, 'LineWidth', 2);
    
% Add labels
hXLabel = xlabel('Tiempo [s]');
hYLabel = ylabel('$\omega(t)$','Interpreter','Latex');

% Add legend
hLegend = legend([hA, hMIN_Euler, hMIN_Heun], ...
                 'Analitica', ['Metodo ' S(k).Euler.Name], ...
                 ['Metodo ' S(k).Heun.Name], ...
                 'Location', [S(k).LegendLocation.Velocidad]);

             
             
% Ajust font
set(gca, 'FontName', 'Helvetica');
%set([hXLabel, hYLabel], 'FontName', 'Nunito');
set([hLegend, gca], 'FontSize', 10);
set([hXLabel, hYLabel], 'FontSize', 12);

% Adjust axes properties
grid on
set(gca, 'XLim', [0 50]);
%set(gca, 'YLim', [-10 10]);

hold off


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' S(k).FileHead '_Velocidad'], '-depsc');
end

end
