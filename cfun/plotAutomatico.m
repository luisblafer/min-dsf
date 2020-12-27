function [outputArg1,outputArg2] = plotAutomatico(t,x,options)
%PLOT AUTOMATICO Summary of this function goes here
%   Detailed explanation goes here
    arguments
        t
        x
        options
    end
    
    
    fig = figure('Name',options.FigureName);
    hold on
    
    for idx = 1:length(x)
        figureHandler(idx) = plot(t{idx}, x{idx});
        set(figureHandler(idx), 'Color', options.LineColor(idx,:))
        set(figureHandler(idx), 'LineWidth', options.LineWidth(idx));
    end
        
    hXLabel = xlabel(options.XLabelText);
    hYLabel = ylabel(options.YLabelText,'Interpreter',options.Interpreter);
    hLegend = legend(figureHandler,options.LegendText);
    
    set(hLegend,'Location',options.LegendLocation);
    
    
    % Ajust font
    set(gca, 'FontName', 'Helvetica');
    set([hLegend, gca], 'FontSize', 10);
    set([hXLabel, hYLabel], 'FontSize', 12);
    
    grid on
    
    set(gca, 'XLim', options.XLimSpan);
    set(gca, 'YLim', options.YLimSpan);

    hold off
end

