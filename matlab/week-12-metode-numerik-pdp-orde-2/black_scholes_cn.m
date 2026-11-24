%% European call option: Black-Scholes analytical formula vs Crank-Nicolson PDE
clear; close all; clc
K=100; r=0.05; sigma=0.2; T=1; Smax=300; Ns=240; Nt=120;
S=linspace(0,Smax,Ns+1)'; dS=S(2)-S(1); dt=T/Nt;
V=max(S-K,0);              % payoff at tau=0, tau=T-t
N=@(z) 0.5*(1+erf(z/sqrt(2)));

% Spatial Black-Scholes operator L
n=Ns+1; A=spalloc(n,n,3*n); B=spalloc(n,n,3*n);
A(1,1)=1; A(end,end)=1; B(1,1)=1; B(end,end)=1;
for j=2:Ns
    Sj=S(j);
    lo=0.5*sigma^2*Sj^2/dS^2 - 0.5*r*Sj/dS;
    di=-sigma^2*Sj^2/dS^2-r;
    up=0.5*sigma^2*Sj^2/dS^2 + 0.5*r*Sj/dS;
    A(j,j-1)=-0.5*dt*lo; A(j,j)=1-0.5*dt*di; A(j,j+1)=-0.5*dt*up;
    B(j,j-1)= 0.5*dt*lo; B(j,j)=1+0.5*dt*di; B(j,j+1)= 0.5*dt*up;
end

for k=1:Nt
    tauOld=(k-1)*dt; tauNew=k*dt;
    V(1)=0; V(end)=Smax-K*exp(-r*tauOld);
    rhs=B*V; rhs(1)=0; rhs(end)=Smax-K*exp(-r*tauNew);
    V=A\rhs;
end

% Closed-form Black-Scholes benchmark
Cexact=zeros(size(S)); idx=S>0;
d1=(log(S(idx)/K)+(r+0.5*sigma^2)*T)/(sigma*sqrt(T));
d2=d1-sigma*sqrt(T);
Cexact(idx)=S(idx).*N(d1)-K*exp(-r*T).*N(d2);

plot(S,Cexact,'LineWidth',1.8); hold on; plot(S,V,'--','LineWidth',1.5); grid on
xlabel('Harga aset S'); ylabel('Harga call');
legend('Formula Black-Scholes','Crank-Nicolson','Location','northwest')
title('European call: analytical benchmark vs numerical PDE')
fprintf('Maximum absolute error = %.4e\n',max(abs(V-Cexact)));
