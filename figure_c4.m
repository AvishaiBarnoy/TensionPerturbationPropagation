format compact;

% t = [0:0.001:100 100.1:0.1:2000 2001:1:5001];
t = 0:0.1:5001;
r = [0.1:0.001:1]; % grid
% t = [0:0.001:100 100.1:0.1:2000 2001:1:5001];
% r = [0:0.01:11]; % grid

% parameters
a = 0.1;    % 0.1 mum
% e0 = -0.1;  % epsilon_0

sim_grid40 = zeros(length(t),length(r));
sim_grid400 = zeros(length(t),length(r));
% for i = 1:length(t)    
%     sim_grid40(i,:) = calculate_ee0(r,t(i),a,0.04);
%     sim_grid400(i,:) = calculate_ee0(r,t(i),a,0.4);
%     max_eps40 = a^2/pi*1./r.^2*exp(-1);
%     max_eps400 = a^2/pi*1./r.^2*exp(-1);
% end

hold on
max_eps40 = a^2/pi*1./r.^2*exp(-1);
max_eps400 = a^2/pi*1./r.^2*exp(-1);
colors = [0 0.4470 0.7410; 0.8500 0.3250 0.0980; 0.4660 0.6740 0.1880];
% [maxs40, maxs_id40] = max(sim_grid40,[],1);
% [maxs400, maxs_id400] = max(sim_grid400,[],1);
% B40 = t(maxs_id40);
% B400 = t(maxs_id400);
% plot(r,B40,'-',LineWidth=2.5,color=colors(1,:))
% plot(r,B400,'--',LineWidth=2.5,color=colors(1,:))
plot(r,max_eps40,'-',LineWidth=2.5)
% plot(r,max_eps400,'--',LineWidth=2.5)

grid on; ax = gca;
labelsize=16; ax.XAxis.FontSize = labelsize; ax.YAxis.FontSize = labelsize;
xlabel("\rho [\mum]",FontSize=18);
ylabel('$\varepsilon$ / $\varepsilon_0$', 'Interpreter','latex',FontSize=18)
xlim([0 1])
% ylabel("t^* [s]",FontSize=16)
% legend(["40Pa" "400Pa"],FontSize=14)
hold off

function ee0 = calculate_ee0(r,t,a,D)
ee0 = 1/pi*(4*a^2)/(16*D*t+a^2)*exp(-4*r.^2/(16*D*t+a^2));
end

function plot_max_times(sim_grid, t, x)
[maxs, maxs_id] = max(sim_grid,[],1);
B = t(maxs_id);
plot(x,B,LineWidth=2.5)
xlabel("$\rho$ [\mum]",FontSize=13)
ylabel("t^* [s]",FontSize=13)
grid on
end

function max_gam_at_dist(sim_grid400, x, b0, a, e0)
hold off
[maxs40, maxs_id] = max(sim_grid40,[],1);
[maxs400, maxs_id] = max(sim_grid400,[],1);
maxs40 = gg0(x,b0,a,40,e0);
maxs400 = gg0(x,b0,a,400,e0);
hold on
plot(x,maxs400,'-',LineWidth=2)
plot(x,maxs40,'--',LineWidth=2)
ax = gca;
ax.XAxis.FontSize = 16;
ax.YAxis.FontSize = 16;
legend('400 Pa', '40 Pa',FontSize=12)
% xlim([0 0.0005])
xlabel("\rho [\mum]","FontSize",22)
ylabel("\Delta\gamma [\muN/m]","FontSize",20)
grid on
hold off
end