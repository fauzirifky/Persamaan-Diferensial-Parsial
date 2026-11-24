%% Simplified reservoir pressure diffusivity benchmark
% u_t = D u_xx, x>0, u(x,0)=0, u(0,t)=1, u(infinity,t)=0
% exact u = erfc(x/(2 sqrt(D t)))
clear; close all; clc
D=0.08; L=3; Tf=0.8; Nx=121; dt=0.01;
x=linspace(0,L,Nx)'; dx=x(2)-x(1); Nt=round(Tf/dt); r=D*dt/dx^2;
u=zeros(Nx,1); u(1)=1;
m=Nx-2; e=ones(m,1); D2=spdiags([e -2*e e],-1:1,m,m); I=speye(m);
A=I-0.5*r*D2; B=I+0.5*r*D2;
for n=1:Nt
    rhs=B*u(2:end-1);
    % boundary u(0,t)=1 contributes half from old and new time levels
    rhs(1)=rhs(1)+r;
    u(2:end-1)=A\rhs; u(1)=1; u(end)=0;
end
uex=erfc(x/(2*sqrt(D*Tf)));
plot(x,uex,'LineWidth',1.8); hold on; plot(x,u,'o','MarkerIndices',1:5:Nx); grid on
xlabel('Jarak x'); ylabel('Drawdown ternormalisasi');
legend('Analitik erfc','Crank-Nicolson','Location','best')
title('Pressure diffusivity benchmark')
