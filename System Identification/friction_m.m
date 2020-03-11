function [dx, f] = friction_m(t, x, v, g, varargin)
g=[ 10 15 20 25 30 35 40];
  %FRICTION_M  Nonlinear friction model with Stribeck, Coulomb and viscous
  %   dissipation effects.
  % Output equation.
  v=[25];
  f =  g(1)*(tanh(g(2)*v(1))-tanh(g(3)*v(1))) ... % Stribeck effect.
     + g(4)*tanh(g(5)*v(1))                   ... % Coulomb effect.
     + g(6)*v(1);                                 % Viscous dissipation term.
  % Static system; no states.
  dx = [];
  
  
  FileName      = 'friction_m';          % File describing the model structure.
Order         = [1 1 0];               % Model orders [ny nu nx].
Parameters    = {[0.20; 90; 11; ...
                  0.12; 110; 0.015]};  % Initial parameters.
InitialStates = [];                    % Initial initial states.
Ts            = 0;                     % Time-continuous system.
nlgr = idnlgrey(FileName, Order, Parameters, InitialStates, Ts,    ...
                'Name', 'Static friction model',                   ...
                'InputName', 'Slip speed', 'InputUnit', 'm/s',     ...
                'OutputName', 'Friction force', 'OutputUnit', 'N', ...
                'TimeUnit', 's');
setpar(nlgr, 'Minimum', {zeros(5, 1)});   % All parameters must be >= 0.



present(nlgr);




nlgr1 = nlgr;
nlgr1.Name = 'No Striebeck term';
setpar(nlgr1, 'Value', {[zeros(3, 1); Parameters{1}(4:6)]});
setpar(nlgr1, 'Fixed', {[true(3, 1); false(3, 1)]});
nlgr2 = nlgr;
nlgr2.Name = 'No Coulombic term';
setpar(nlgr2, 'Value', {[Parameters{1}(1:3); 0; 0; Parameters{1}(6)]});
setpar(nlgr2, 'Fixed', {[false(3, 1); true(2, 1); false]});
nlgr3 = nlgr;
nlgr3.Name = 'No dissipation term';
setpar(nlgr3, 'Value', {[Parameters{1}(1:5); 0]});
setpar(nlgr3, 'Fixed', {[false(5, 1); true]});



load(fullfile(matlabroot, 'toolbox', 'ident', 'iddemos', 'data', 'frictiondata'));
ze = iddata(f1, v, 1, 'Name', 'Static friction system');
set(ze, 'InputName', 'Slip speed', 'InputUnit', 'm/s',  ...
        'OutputName', 'Friction force', 'OutputUnit', 'N', ...
        'Tstart', 0, 'TimeUnit', 's');
zv = iddata(f2, v, 1, 'Name', 'Static friction system');
set(zv, 'InputName', 'Slip speed', 'InputUnit', 'm/s',  ...
        'OutputName', 'Friction force', 'OutputUnit', 'N', ...
        'Tstart', 0, 'TimeUnit', 's');
    
    
    figure('Name', ze.Name);
plot(ze);


figure;
compare(ze, nlgr, nlgr1, nlgr2, nlgr3);


nlgr = pem(nlgr, ze,  'Display', 'On', 'MaxIter', 30, 'Tol', 0);
nlgr1 = pem(nlgr1, ze, 'MaxIter', 30, 'Tol', 0, 'cov', 'none');
nlgr2 = pem(nlgr2, ze, 'MaxIter', 30, 'Tol', 0, 'cov', 'none');
nlgr3 = pem(nlgr3, ze, 'MaxIter', 30, 'Tol', 0, 'cov', 'none');

figure;
compare(zv, nlgr, nlgr1, nlgr2, nlgr3);


disp('   True       Estimated parameter vector');
ptrue = [0.25; 100; 10; 0.1; 100; 0.01];
fprintf('   %7.3f    %7.3f\n', [ptrue'; getpvec(nlgr)']);


fpe(nlgr, nlgr1, nlgr2, nlgr3);

figure;
pe(zv, nlgr);



figure('Name', [nlgr.Name ': residuals of estimated IDNLGREY model']);
resid(zv, nlgr);


figure('Name', [nlgr.Name ': step responses of estimated models']);
step(nlgr, nlgr1, nlgr2, nlgr3);
legend(nlgr.Name, nlgr1.Name, nlgr2.Name, nlgr3.Name, 'location', 'SouthEast');


present(nlgr);


