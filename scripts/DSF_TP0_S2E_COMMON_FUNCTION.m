% GRAFICAS ANALITICA vs. METODO NUMERICO ELEGIDO PARA LOS DIFERENTES PASOS
% DE INTEGRACION.
for k = 1:numel(S)

    
% EXTRAIGO LOS ATRIBUTOS Y DATOS DESDE LA ESTRUCTURA
h = S(k).h;
t = S(k).Data.Time;

xMIN = S(k).Data.MIN;


% HANDLER DE FIGURA DE SOLUCION ANALITICA vs. METODO NUMERICO
fig = figure('Name', [S(k).FileHead '_AvE']);
hold on


% GRAFICAS DE LAS RESPUESTAS TEMPORALES
    % -- ANALITICA
    hA = fplot(xAnalitica, [0 10]);
                           
    % -- METODO NUMERICO
    hMIN = plot(t, xMIN);
                      
    
% AJUSTO PROPIEDADES DE LAS LINEAS (FUNCIONAL)
    % -- FUNCIONAL
    set(hA, 'Color', [0.1 0.1 0.1]);
    set(hMIN, 'Color', [0 0.477 0.7410]);
    
    % -- ESTETICO
    set(hA, 'LineWidth', 1);
    set(hMIN, 'LineWidth', 2);
    
% Add labels
hXLabel = xlabel('Tiempo [s]');
hYLabel = ylabel('$x(t)$','Interpreter','Latex');

% Add legend
hLegend = legend([hA, hMIN], ...
                 'Analitica', ['Metodo ' S(k).Metodo], ...
                 'Location', [S(k).LegendLocation.Function]);

             
             
% Ajust font
set(gca, 'FontName', 'Helvetica');
%set([hXLabel, hYLabel], 'FontName', 'Nunito');
set([hLegend, gca], 'FontSize', 10);
set([hXLabel, hYLabel], 'FontSize', 12);

% Adjust axes properties
grid on

hold off


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' S(k).FileHead '_AvE'], '-depsc');
end

end