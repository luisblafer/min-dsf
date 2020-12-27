%% SIMULACION DEL SISTEMA DE PENDULO

% CARGAMOS EN MEMORIA EL MODELO DE SIMULINK PARA EJECUCION POR LINEA DE
% COMANDOS
model = 'penduloSLX';
load_system(model)


% EULER (ode1)

S.Euler.paramNameValStruct.StartTime    = '0';
S.Euler.paramNameValStruct.StopTime     = '50';
S.Euler.paramNameValStruct.Solver       = 'ode1';
S.Euler.paramNameValStruct.FixedStep    = '0.1';
S.Euler.paramNameValStruct.Refine       = '1';

simOut = sim(model,S.Euler.paramNameValStruct);

S.Euler.t = simOut.tout;
S.Euler.x1 = simOut.x.x1.Data;
S.Euler.x2 = simOut.x.x2.Data;

S.Euler.steps = length(simOut.tout);



% HEUN (ode2)

S.Heun.paramNameValStruct.StartTime    = '0';
S.Heun.paramNameValStruct.StopTime     = '50';
S.Heun.paramNameValStruct.Solver       = 'ode2';
S.Heun.paramNameValStruct.FixedStep    = '0.1';
S.Heun.paramNameValStruct.Refine       = '1';

simOut = sim(model,S.Heun.paramNameValStruct);

S.Heun.t = simOut.tout;
S.Heun.x1 = simOut.x.x1.Data;
S.Heun.x2 = simOut.x.x2.Data;

S.Heun.steps = length(simOut.tout);



% DORMAND-PRINCE (ode45)

S.DormandPrince.paramNameValStruct.StartTime    = '0';
S.DormandPrince.paramNameValStruct.StopTime     = '50';
S.DormandPrince.paramNameValStruct.Solver       = 'ode45';
S.DormandPrince.paramNameValStruct.RelTol       = '1e-3';
S.DormandPrince.paramNameValStruct.AbsTol       = '1e-3';
S.DormandPrince.paramNameValStruct.Refine       = '1';

simOut = sim(model,S.DormandPrince.paramNameValStruct);

S.DormandPrince.t = simOut.tout;
S.DormandPrince.x1 = simOut.x.x1.Data;
S.DormandPrince.x2 = simOut.x.x2.Data;

S.DormandPrince.steps = length(simOut.tout);



% DORMAND-PRINCE DECIMADO (ode45)

S.DormandPrinceDecimado.paramNameValStruct.StartTime    = '0';
S.DormandPrinceDecimado.paramNameValStruct.StopTime     = '50';
S.DormandPrinceDecimado.paramNameValStruct.Solver       = 'ode45';
S.DormandPrinceDecimado.paramNameValStruct.RelTol       = '1e-3';
S.DormandPrinceDecimado.paramNameValStruct.AbsTol       = '1e-3';
S.DormandPrinceDecimado.paramNameValStruct.Refine       = '3';

simOut = sim(model,S.DormandPrinceDecimado.paramNameValStruct);

S.DormandPrinceDecimado.t = simOut.tout;
S.DormandPrinceDecimado.x1 = simOut.x.x1.Data;
S.DormandPrinceDecimado.x2 = simOut.x.x2.Data;

S.DormandPrinceDecimado.steps = length(simOut.tout);



% NDF (ode15s)

S.NDF.paramNameValStruct.StartTime    = '0';
S.NDF.paramNameValStruct.StopTime     = '50';
S.NDF.paramNameValStruct.Solver       = 'ode15s';
S.NDF.paramNameValStruct.RelTol       = '1e-3';
S.NDF.paramNameValStruct.AbsTol       = '1e-3';
S.NDF.paramNameValStruct.Refine       = '1';

simOut = sim(model,S.NDF.paramNameValStruct);

S.NDF.t = simOut.tout;
S.NDF.x1 = simOut.x.x1.Data;
S.NDF.x2 = simOut.x.x2.Data;

S.NDF.steps = length(simOut.tout);