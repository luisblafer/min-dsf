% SOLUCION ANALITICA DE XA(t) USANDO ODE45
sol = ode45(@pendulo,tspan,y0);

% REEVALUAMOS LA SOLUCION DEL SISTEMA, UTILIZANDO UN PASO DE INTEGRACION DE
% UN ORDEN ME MAGNITUD MENOR AL DEL MINIMO PASO DE INTEGRACION A SIMULAR.
S.Analitica.t = [sol.x(1) : 0.001 : sol.x(end)]';

% VECTORES DE RESPUESTAS ANALITICAS
    % -- POSICION
    S.Analitica.x1 = deval(sol,S.Analitica.t,1)';

    % -- VELOCIDAD ANGULAR
    S.Analitica.x2 = deval(sol,S.Analitica.t,2)';
