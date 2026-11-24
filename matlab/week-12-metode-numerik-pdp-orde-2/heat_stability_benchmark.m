%% Persamaan panas 1D: benchmark analitik, stabilitas, refinement, BE, dan CN
% u_t = alpha u_xx, 0<x<1, t>0
% u(0,t)=u(1,t)=0, u(x,0)=sin(pi x)
% solusi eksak: u(x,t)=exp(-alpha*pi^2*t) sin(pi x)
clear; close all; clc
alpha = 0.1; L = 1; Tf = 0.1;
uexact = @(x,t) exp(-alpha*pi^2*t).*sin(pi*x/L);

%% A. FTCS stabil + grid refinement
Ns = [21 41 81 161];
err = zeros(size(Ns));
for kk = 1:numel(Ns)
    Nx = Ns(kk);
    x = linspace(0,L,Nx)';
    h = x(2)-x(1);

    rTarget = 0.4;                 % stabil karena <= 1/2
    dt = rTarget*h^2/alpha;
    Nt = ceil(Tf/dt);
    dt = Tf/Nt;                   % tepat mencapai Tf
    r = alpha*dt/h^2;

    u = sin(pi*x/L);
    for n = 1:Nt
        old = u;
        u(2:end-1) = old(2:end-1) ...
            + r*(old(3:end)-2*old(2:end-1)+old(1:end-2));
        u(1)=0; u(end)=0;
    end
    err(kk) = max(abs(u-uexact(x,Tf)));
end
pObs = log(err(1:end-1)./err(2:end))/log(2);
disp(table(Ns(:),(1./(Ns(:)-1)),err(:), ...
    [pObs(:); NaN], 'VariableNames',{'Nx','h','MaxError','ObservedOrder'}));

figure;
loglog(1./(Ns-1),err,'o-','LineWidth',1.5); grid on
xlabel('h'); ylabel('max error'); title('FTCS grid refinement');

%% B. FTCS di luar syarat stabilitas
Nx = 41; x = linspace(0,L,Nx)'; h = x(2)-x(1);
rBad = 0.60; dt = rBad*h^2/alpha;
Nt = ceil(Tf/dt); dt = Tf/Nt; rBad = alpha*dt/h^2;
uBad = sin(pi*x/L);
figure; hold on
plot(x,uBad,'DisplayName','t=0');
for n = 1:Nt
    old = uBad;
    uBad(2:end-1) = old(2:end-1) ...
        + rBad*(old(3:end)-2*old(2:end-1)+old(1:end-2));
    if ismember(n,round([0.2 0.5 1]*Nt))
        plot(x,uBad,'DisplayName',sprintf('step %d',n));
    end
end
grid on; legend('Location','best');
title(sprintf('FTCS di luar kestabilan, r = %.3f',rBad));

%% C. Bandingkan FTCS, Backward Euler, dan Crank-Nicolson
Nx=41; x=linspace(0,L,Nx)'; h=x(2)-x(1);
% waktu sengaja relatif kasar untuk BE/CN
dt = 0.02; Nt = round(Tf/dt); dt = Tf/Nt; r = alpha*dt/h^2;

m = Nx-2; e = ones(m,1);
D2 = spdiags([e -2*e e],-1:1,m,m);
I = speye(m);

% Backward Euler
uBE = sin(pi*x/L); A_BE = I-r*D2;
for n=1:Nt
    uBE(2:end-1) = A_BE\uBE(2:end-1);
end

% Crank-Nicolson
uCN = sin(pi*x/L);
A_CN = I-0.5*r*D2; B_CN = I+0.5*r*D2;
for n=1:Nt
    rhs = B_CN*uCN(2:end-1);
    uCN(2:end-1) = A_CN\rhs;
end

figure;
plot(x,uexact(x,Tf),'LineWidth',1.8); hold on
plot(x,uBE,'s'); plot(x,uCN,'^'); grid on
xlabel('x'); ylabel('u(x,Tf)');
legend('Analitik','Backward Euler','Crank-Nicolson','Location','best');
title('Benchmark analitik vs metode implisit');

fprintf('BE max error = %.3e\n',max(abs(uBE-uexact(x,Tf))));
fprintf('CN max error = %.3e\n',max(abs(uCN-uexact(x,Tf))));
