format compact;
beta = linspace(0.05,0.3,100);
zetah = 0.4; % linspace(0.2,0.6,100); % zeta/h
xlim([0.01,0.3])

% parameters
h = 2.5; % 2.5nm
mu = 3; % N*s/m, viscosity
a = 0.1e-6; % m, compartment radius

P = linspace(0, 6000, 100); % 40; % Pa

% lambda = 1/(4*pi) * h/mu * ft_inv(pi*zeta/(2*h));
% D = 1/16 * beta.^(-1)*lambda*a^2*P;

% Z = zeros(length(beta),length(zetah));
% for i = 1:length(zetah)

Z = zeros(length(beta),length(P));
lambda = 1/(4*pi) * h/mu * ft_inv(zetah);

for i = 1:length(P)
%     lambda = 1/(4*pi) * h/mu * ft_inv(zetah(i));
%     D_i = 1/16 * beta.^(-3/2).*lambda.*a^2*P*1e12;
    D_i = 1/16 * beta.^(-3/2) .* lambda .* a^2 .* P(i)*1e12;

    Z(i,:) = D_i;
end
[X,Y] = meshgrid(beta,P);

surf(X,Y,Z)
xlabel("\beta_0",FontSize=20)
ylabel("P [Pa]",FontSize=20)
zlabel("D [\mum^2/s]",FontSize=20)
ax = gca; ax.XAxis.FontSize = 16; ax.YAxis.FontSize = 16; ax.ZAxis.FontSize = 16;
colorbar
cb = colorbar('Location','eastoutside');
ax.Position = ax.Position - [0 0 .1 .1];
cb.Position = cb.Position + [.01 0 0 0];

function ft = ft_inv(t)
t = t * pi/2;
ft = 1 - 2*log(2*t) + 2/3*t.^2 - 1/9*t.^4 + 8/135*t.^6 ...
    - 53/1350*t.^8 + 1112/42525*t.^10 - 241643/13395375*t.^12 ...
    + 18776/1488375*t.^14;
end