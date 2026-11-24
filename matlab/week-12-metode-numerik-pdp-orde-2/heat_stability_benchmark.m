%% Heat equation: analytical benchmark and three time schemes
% u_t = alpha u_xx, 0<x<1, u(0,t)=u(1,t)=0,
% u(x,0)=sin(pi x), exact u=exp(-alpha*pi^2*t) sin(pi x)
clear; close all; clc
alpha = 0.1; L = 1; T = 0.1; Nx = 41;
x = linspace(0,L,Nx)'; dx = x(2)-x(1);
uex = @(t) exp(-alpha*pi^2*t).*sin(pi*x/L);

% FTCS with r <= 1/2
r = 0.4; dt = r*dx^2/alpha; Nt = ceil(T/dt); dt = T/Nt; r = alpha*dt/dx^2;
uF = sin(pi*x/L);
for n=1:Nt
    old = uF;
    uF(2:end-1) = old(2:end-1) + r*(old(3:end)-2*old(2:end-1)+old(1:end-2));
end

% Interior second-difference matrix
m = Nx-2; e = ones(m,1); D = spdiags([e -2*e e],-1:1,m,m);
I = speye(m);

% Backward Euler: deliberately coarse time grid (stable, but not necessarily accurate)
dtBE = 0.05; NtBE = round(T/dtBE); dtBE = T/NtBE; rBE = alpha*dtBE/dx^2;
uBE = sin(pi*x/L);
A = I-rBE*D;
for n=1:NtBE
    uBE(2:end-1) = A\uBE(2:end-1);
end

% Crank-Nicolson on the same coarse time grid
dtCN = 0.05; NtCN = round(T/dtCN); dtCN = T/NtCN; rCN = alpha*dtCN/dx^2;
uCN = sin(pi*x/L);
A = I-0.5*rCN*D; B = I+0.5*rCN*D;
for n=1:NtCN
    uCN(2:end-1) = A\(B*uCN(2:end-1));
end

plot(x,uex(T),'LineWidth',1.8); hold on
plot(x,uF,'o'); plot(x,uBE,'s'); plot(x,uCN,'^'); grid on
xlabel('x'); ylabel('u(x,T)')
legend('Analitik','FTCS','Backward Euler','Crank-Nicolson','Location','best')
title('Benchmark persamaan panas')

fprintf('FTCS max error = %.3e\n',max(abs(uF-uex(T))));
fprintf('BE   max error = %.3e\n',max(abs(uBE-uex(T))));
fprintf('CN   max error = %.3e\n',max(abs(uCN-uex(T))));
