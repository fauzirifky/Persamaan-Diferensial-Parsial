%% MA25-31018 - Pertemuan 9
% Visualisasi solusi analitik persamaan gelombang
clear; close all; clc;

%% 1) Vibrating string: satu mode
L = 10;      % m
c = 2;       % m/s
A = 0.1;     % m
x = linspace(0,L,500);
times = [0 1.25 2.5 3.75];

figure;
hold on;
for t = times
    u = A*sin(pi*x/L).*cos(pi*c*t/L);
    plot(x,u,'LineWidth',1.5,'DisplayName',sprintf('t = %.2f s',t));
end
xlabel('x (m)'); ylabel('u(x,t) (m)');
title('Vibrating string: mode pertama');
grid on; legend('Location','best');

%% 2) Latihan: superposisi dua mode
L = 6; c = 2;
x = linspace(0,L,500);
times = [0 1 2];

figure;
hold on;
for t = times
    u = 0.12*sin(pi*x/L).*cos(pi*t/3) ...
      + 0.05*sin(2*pi*x/L).*cos(2*pi*t/3);
    plot(x,u,'LineWidth',1.5,'DisplayName',sprintf('t = %.0f s',t));
end
xlabel('x (m)'); ylabel('u(x,t) (m)');
title('Superposisi dua mode');
grid on; legend('Location','best');

%% 3) Gelombang air dangkal linear - pulsa ke kanan
H = 4;       % m
g = 9.81;    % m/s^2
c = sqrt(g*H);
x = linspace(0,220,700);
times = [0 5 10 15];

figure;
hold on;
for t = times
    eta = 0.2*exp(-((x - 50 - c*t)/12).^2);
    plot(x,eta,'LineWidth',1.5,'DisplayName',sprintf('t = %.0f s',t));
end
xlabel('x (m)'); ylabel('\eta(x,t) (m)');
title(sprintf('Shallow-water linear: H = %.1f m, c = %.2f m/s',H,c));
grid on; legend('Location','best');
