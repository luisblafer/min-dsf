%% SIMULACION DEL SISTEMA RLC SERIE

% CARGAMOS EN MEMORIA EL MODELO DE SIMULINK PARA EJECUCION POR LINEA DE
% COMANDOS
model = 'circuitoRLC';
load_system(model)


% DORMAND-PRINCE (ode45)

S.DormandPrince.paramNameValStruct.StartTime    = '0';
S.DormandPrince.paramNameValStruct.StopTime     = '500';
S.DormandPrince.paramNameValStruct.Solver       = 'ode45';
S.DormandPrince.paramNameValStruct.RelTol       = '1e-3';
S.DormandPrince.paramNameValStruct.AbsTol       = '1e-3';
S.DormandPrince.paramNameValStruct.Refine       = '1';

simOut = sim(model,S.DormandPrince.paramNameValStruct);

S.DormandPrince.t = simOut.tout;
S.DormandPrince.x1 = simOut.x.x1.Data;
S.DormandPrince.x2 = simOut.x.x2.Data;

S.DormandPrince.steps = length(simOut.tout);



% NDF (ode15s)

S.NDF.paramNameValStruct.StartTime    = '0';
S.NDF.paramNameValStruct.StopTime     = '500';
S.NDF.paramNameValStruct.Solver       = 'ode15s';
S.NDF.paramNameValStruct.RelTol       = '1e-3';
S.NDF.paramNameValStruct.AbsTol       = '1e-3';
S.NDF.paramNameValStruct.Refine       = '1';

simOut = sim(model,S.NDF.paramNameValStruct);

S.NDF.t = simOut.tout;
S.NDF.x1 = simOut.x.x1.Data;
S.NDF.x2 = simOut.x.x2.Data;

S.NDF.steps = length(simOut.tout);