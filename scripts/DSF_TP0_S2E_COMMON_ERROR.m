% GRAFICAS ERROR GLOBAL PARA LOS DIFERENTES PASOS DE INTEGRACION DEL METODO
% ELEGIDO
for k = 1:numel(S)


% EXTRAIGO LOS ATRIBUTOS Y DATOS DESDE LA ESTRUCTURA
h = S(k).h;
t = S(k).Data.Time;

errGlobal = S(k).Data.Error;


% HANDLER DE FIGURA DE SOLUCION ANALITICA vs. METODO INTEGRACION
fig = figure('Name', [S(k).FileHead '_GlobalError']);
hold on


% GRAFICAS DEL ERROR GLOBAL
    hErrorGlobal = plot(t, errGlobal);
                      
    
% AJUSTO PROPIEDADES DE LAS LINEAS (FUNCIONAL)
    % -- FUNCIONAL
    set(hErrorGlobal, 'Color', [0.8500 0.3250 0.0980]);
    
    % -- ESTETICO
    set(hErrorGlobal, 'LineWidth', 2);
    
% Add labels
hXLabel = xlabel('Tiempo [s]');
hYLabel = ylabel('$x_a(t) - x(t)$','Interpreter','Latex');

% Add legend
hLegend = legend([hErrorGlobal], ...
                 'Error Global', ...
                 'Location', [S(k).LegendLocation.GlobalError]);

             
             
% Adjust font
set(gca, 'FontName', 'Helvetica');
%set([hXLabel, hYLabel], 'FontName', 'Nunito');
set([hLegend, gca], 'FontSize', 10);
set([hXLabel, hYLabel], 'FontSize', 12);

% Adjust axes properties
grid on
set(gca, 'XLim', [0 10]);

hold off


% IMPRIMIR IMAGEN A .EPS
if printEps
    print(['images/' S(k).FileHead '_GlobalError'], '-depsc');
end

end