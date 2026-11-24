%% Poisson verification using a manufactured exact solution
% -Delta u = f on (0,1)^2, u=0 at the boundary
% choose u_exact = sin(pi x) sin(pi y)
clear; close all; clc
Ns=[8 16 32 64]; err=zeros(size(Ns));
for kk=1:numel(Ns)
    N=Ns(kk); h=1/N; x=(h:h:1-h)'; n=N-1;
    [X,Y]=ndgrid(x,x);
    f=2*pi^2*sin(pi*X).*sin(pi*Y);
    e=ones(n,1); T=spdiags([-e 4*e -e],-1:1,n,n);
    A=(kron(speye(n),T)+kron(spdiags([-e -e],[-1 1],n,n),speye(n)))/h^2;
    uh=A\f(:); uh=reshape(uh,n,n);
    ue=sin(pi*X).*sin(pi*Y);
    err(kk)=max(abs(uh(:)-ue(:)));
end
loglog(1./Ns,err,'o-','LineWidth',1.5); hold on
loglog(1./Ns,err(1)*((1./Ns)/(1/Ns(1))).^2,'--'); grid on
set(gca,'XDir','reverse'); xlabel('h'); ylabel('Galat maksimum')
legend('Galat numerik','Referensi O(h^2)','Location','best')
title('Grid refinement skema lima titik Poisson')
disp(table(Ns(:),(1./Ns(:)),err(:),'VariableNames',{'N','h','MaxError'}))
