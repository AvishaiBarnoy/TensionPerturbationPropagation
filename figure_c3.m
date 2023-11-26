format compact;
% eps/eps_0 vs. rho
t = linspace(0,5000,10000);
a = 0.1;
D = 0.04; % for 40 Pa

% r = [1 3 5];
r = [5];
colors = [0 0.4470 0.7410; 0.8500 0.3250 0.0980; 0.4660 0.6740 0.1880];
hold on
for i = 1:length(r)
%     gg0 = calculate_ee0(t,r(i),a,D);
%     plot(t,gg0,LineWidth=2.5)
    gg0 = calculate_ee0(t,r(i),a,D);
    plot(t,gg0,'-',LineWidth=2.5,color=colors(i,:))
    gg0 = calculate_ee0(t,r(i),a,0.4);
    plot(t,gg0,'--',LineWidth=2.5,color=colors(i,:))
end
% legendStrings = string(t(tp)) + " s"; % auto generate 
% legend(legendStrings)
ax = gca; grid on;
labelsize=16; ax.XAxis.FontSize = labelsize; ax.YAxis.FontSize = labelsize;
legend(["5\mum 40Pa" "5\mum 400Pa"],FontSize=14)
% legend(["1\mum" "3\mum" "5\mum"],FontSize=14)
xlabel("t [s]",FontSize=16)
ylabel('$\varepsilon$ / $\varepsilon_0$', 'Interpreter','latex',FontSize=18)
% xlim([0 0.12])
hold off

function gg0 = calculate_ee0(t,r,a,D)
% e0 = 0.1;
e = 1/pi*(4*a^2)./(16*D.*t+a^2).*exp(-4*r^2./(16*D.*t+a^2));
gg0 = e;
end