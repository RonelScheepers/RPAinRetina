% Set the initial values
u(1) = 5;
u(2) = 10;
u(3) = 1;
u(4) = 2;
u(5) = 1;
u(6) = 0.1;
u(7) = 0.1;
u(8) = 0.4;
u(9) = 1.7;
u(10) = 1;
u(11) = 1;
u(12) = 0.1;
u(13) = 1;
u(14) = 1;
u(15) = 20;
u(16) = 0.1;
u(17) = 5;
u(18) = 1;
u(19) = 30;
u(20) = 1;
u(21) = 1;
u(22) = 1;
u(23) = 1;
u(24) = 1.25;
u(25) = 2;
u(26) = 1;
u(27) = 2;
u(28) = 0.1;
u(29) = 0.5;
u(30) = 10;
u(31) = 1;
u(32) = 1;
u(33) = 1;
u(34) = 1;
u(35) = 1;
u(36) = 10;
u(37) = 0.1;
u(38) = 4;
u(39) = 0.7;
u(40) = 1;
u(41) = 1;

init = [u(1) u(2) u(3) u(4) u(5) u(6) u(7) u(8) u(9) u(10) u(11) u(12) u(13) u(14) u(15) u(16) u(17) u(18) u(19) u(20) u(21) u(22) u(23) u(24) u(25) u(26) u(27) u(28) u(29) u(30) u(31) u(32) u(33) u(34) u(35) u(36) u(37) u(38) u(39) u(40) u(41)];
tspan = [0 250];
[t,u] = ode23s(@(t,u) gene(t,u), tspan, init);

%% Plot results
t1 = 0:.5:250;
input1 = @(t) 0.5 + 0.5*(50<=t & t<100) + 1*(100<=t & t<150) + 0.5*(150<=t & t<200);
input2 = @(t) 0.5 + 0.6*(50<=t & t<100) + 1*(100<=t & t<150) + 0.6*(150<=t & t<200);
input3 = @(t) 0.5 + 0.7*(50<=t & t<100) + 1*(100<=t & t<150) + 0.7*(150<=t & t<200);
input4 = @(t) 0.5 + 0.8*(50<=t & t<100) + 1*(100<=t & t<150) + 0.8*(150<=t & t<200);
tiledlayout(4,1)
nexttile 
hold on
plot(t1,input1(t1),'-k',t1,input2(t1),'-r',t1,input3(t1),'-b',t1,input4(t1),'-g','LineWidth',2.0)
title(''); legend('CL(Input)','CH(Input)','CH1(Input)','CL2(Input)')
xlabel('Time t'); ylabel('Concentration')
hold off
ylim([0 2.5])

nexttile 
hold on
plot(t,u(:,6),'-',t,u(:,7),'-',t,u(:,8),'-',t,u(:,29),'-',t,u(:,28),'-','LineWidth',2.0)
title(''); legend('Cf','Cp','Ce','B','Cg')
xlabel('Time t'); ylabel('Concentration')
ylim([0 0.9])

nexttile 
hold on
plot(t,u(:,24),'-',t,u(:,23),'-',t,u(:,25),'-',t,u(:,16),'-',t,u(:,37), t,u(:,39),'-',t,u(:,9),'-','LineWidth',2.0)
title(''); legend('Ce1','Cp1','E1','Cf1','Cf2','Ce2','E')
xlabel('Time t'); ylabel('Concentration')
ylim([0 3])

nexttile 
hold on
plot(t,u(:,38),'-','LineWidth',2.0)
title('','FontSize',16); legend('Cp2')
xlabel('Time t'); ylabel('Concentration')
ylim([0 14])

exportgraphics(eqns,'Numeric.png','Resolution',300)
%% ODE System
function eqns = gene(t, u)
    % Using k20=p1, k23=p2, k25=p3, k30=p4, k31=p5, k32=p6, k33=p7, k34=p8, 
    % k35=p9, k36=p10, k37=p11, k38=p12, k39=p13, k40=p15, k41=p16, k42=p17, 
    % k43=p18, k44=p19, k45=p20, k46=p21, k47=p25, k48=p26, k49=p28, k50=p29, 
    % k51=p31, k52=p32, k53=p33, k54=p34, k55=p35, k56=p36, k57=p37, k58=p38, k59=p39,
    % k60=mu, k61=eta, k62=alpha, k63=phi, k64=lambda, k65=omega, k66=kappa,
    % k67=psi, k68=epsilon, k69=delta, k70=theta, k71=beta.
    % and
    
    %Sci0=u(1), C0=u(2), Sr0=u(3), Sh0=u(4), R0=u(5), Cf0=u(6), Cp0=u(7), Ce0=u(8), E0=u(9), 
    % HR0=u(10), H0=u(11), Sp0=u(12), P0=u(13),Sb0=u(14), Rb0=u(15), Cf1=u(16), Sci1=u(17), 
    % C1=u(18), Sb1=u(19), Sh1=u(20), Rb1=u(21), HR1=u(22),Cp1=u(23), Ce1=u(24), 
    %E1=u(25), H1=u(26), CO=u(27), Cg=u(28), B=u(29), Sci2=u(30), C2=u(31), Sr2=u(32), 
    % Sh2=u(33), Sp2=u(34), R2=u(35), P2=u(36), Cf2=u(37), Cp2=u(38), Ce2=u(39), 
    % H2=u(40), HR2=u(41), 

    
    % Set the model parameters
    k1 = 2;
    k2 = 3;
    k3 = 0.5;
    k4 = 60;
    k5 = 50;
    k6 = 10;
    k7 = 2;
    k8 = 0.5;
    k9 = 2;
    k10 = 1.2;
    k11 = 1;
    k12 = 10;
    k13 = 0.1;
    k14 = 0.5;
    k15 = 300;
    k16 = 46;
    k17 = 40;
    k18 = 20;
    k19 = 10;
    k20 = 0.5;
    k21 = 18;
    k22 = 25;
    k23 = 16;
    k24 = 2;
    k25 = 15;
    k26 = 3;
    k27 = 1;
    k28 = 40;
    k29 = 5;
    k30 = 20;
    k31 = 3;
    k32 = 2.8;
    k33 = 1;
    k34 = 10;
    k35 = 1;
    k36 = 3;
    k37 = 0.9;
    k38 = 10;
    k39 = 1.1;
    k40 = 1;
    k41 = 30;
    k42 = 20;
    k43 = 1;
    k44 = 1;
    k45 = 10;
    k46 = 11;
    k47 = 10;
    k48 = 1;
    k49 = 10;
    k50 = 55;
    k51 = 1;
    k52 = 1;
    k53 = 20;
    k54 = 0.7;
    k55 = 1;
    k56 = 2;
    k57 = 10;
    k58 = 10;
    k59 = 2;
    k60 = 2;
    k61 = 10;
    k62 = 2;
    k63 = 50;
    k64 = 40;
    k65 = 1.5;
    k66 = 20;
    k67 = 13;
    k68 = 15;
    k69 = 5;
    k70 = 5;
    k71 = 10;
    %% Perform the numerical integration
    k = [k1,k2,k3,k4,k5,k6,k7,k8,k9,k10,k11,k12,k13,k14,k15,k16,k17,k18,k19,k20,k21,k22,k23,k24,k25,k26,k27,k28,k29,k30,k31,k32,k33,k34,k35,k36,k37,k38,k39,k40,k41,k42,k43,k44,k45,k46,k47,k48,k49,k50,k51,k52,k53,k54,k55,k56,k57,k58,k59,k60,k61,k62,k63,k64,k65,k66,k67,k68,k69,k70,k71];
    
    %% Define anonymous function input1(t)
    %  Time: 0<=t<50 50<=t<100  100<=t<150  150<=t<200  200<=t  
    %  Input:  0.5      1          1.5          1         0.5
    in1 = @(t) 0.5 + 0.5*(50<=t & t<100) + 1*(100<=t & t<150) + 0.5*(150<=t & t<200);
    in2 = @(t) 0.5 + 0.6*(50<=t & t<100) + 1*(100<=t & t<150) + 0.6*(150<=t & t<200);
    in3 = @(t) 0.5 + 0.7*(50<=t & t<100) + 1*(100<=t & t<150) + 0.7*(150<=t & t<200);
    in4 = @(t) 0.5 + 0.8*(50<=t & t<100) + 1*(100<=t & t<150) + 0.8*(150<=t & t<200);
    
    eqns     = zeros(41,1); % To start with we have 41 empty equations
    eqns(1)  = k(60) - k(61)*u(1)*u(2);
    eqns(2)  = k(70)*u(8) - k(61)*u(1)*u(2);
    eqns(3)  = k(1)*u(1) - k(2)*u(3);
    eqns(4)  = k(1)*u(1) - k(10)*u(4);
    eqns(5)  = k(17)*u(3) - k(11)*u(5) - k(14)*u(13)*u(5);
    eqns(6)  = k(3)*in1(t) + k(26)*in2(t)*u(15) - k(4)*u(6);
    eqns(7)  = k(4)*u(6) - k(5)*u(7) + k(6)*u(8) - k(12)*u(7)*u(27);
    eqns(8)  = k(5)*u(7) - k(6)*u(8) + k(9)*u(10)*u(11) - k(7)*u(8) + k(8)*u(9) - k(21)*u(8) - k(22)*u(8)*u(28);
    eqns(9)  = k(7)*u(8) - k(8)*u(9);
    eqns(10) = k(18)*u(4) - k(15)*u(10)*u(8);
    eqns(11) = k(62) - k(9)*u(10)*u(11);
    eqns(12) = k(1)*u(1) - k(13)*u(12);
    eqns(13) = k(19)*u(12) - k(16)*u(13);
    eqns(14) = k(1)*u(1) - k(27)*u(14);
    eqns(15) = k(28)*u(14) - k(29)*u(15);
    eqns(16) = k(47)*in3(t)*u(21) - k(30)*u(16);
    eqns(17) = k(63) - k(67)*u(17)*u(18);
    eqns(18) = k(64)*u(24) - k(67)*u(17)*u(18);
    eqns(19) = k(20)*u(17) - k(23)*u(19);
    eqns(20) = k(20)*u(17) - k(25)*u(20);
    eqns(21) = k(35)*u(19) - k(36)*u(21);
    eqns(22) = k(33)*u(20) - k(34)*u(22)*u(24);
    eqns(23) = k(30)*u(16) - k(31)*u(23) + k(32)*u(24) - k(37)*u(23);
    eqns(24) = k(31)*u(23) - k(32)*u(24) - k(41)*u(24) + k(42)*u(25) + k(38)*u(22)*u(26) - k(40)*u(24);
    eqns(25) = k(41)*u(24) - k(42)*u(25);
    eqns(26) = k(65) - k(38)*u(22)*u(26);
    eqns(27) = k(37)*u(23) - k(12)*u(7)*u(27);
    eqns(28) = k(12)*u(7)*u(27) - k(22)*u(8)*u(28);
    eqns(29) = k(22)*u(8)*u(28) - k(24)*u(29);
    eqns(30) = k(71) - k(68)*u(30)*u(31);
    eqns(31) = k(66)*u(39) - k(68)*u(30)*u(31);
    eqns(32) = k(48)*u(30) - k(52)*u(32);
    eqns(33) = k(48)*u(30) - k(43)*u(33);
    eqns(34) = k(48)*u(30) - k(51)*u(34);
    eqns(35) = k(53)*u(32) - k(55)*u(35) - k(59)*u(36)*u(35);
    eqns(36) = k(57)*u(34) - k(58)*u(36);
    eqns(37) = k(54)*in4(t)*u(35) - k(56)*u(37);
    eqns(38) = k(56)*u(37) - k(49)*u(38) + k(50)*u(39);
    eqns(39) = k(49)*u(38) - k(50)*u(39) + k(46)*u(41)*u(40) - k(39)*u(39);
    eqns(40) = k(69) - k(46)*u(41)*u(40);
    eqns(41) = k(44)*u(33) - k(45)*u(41)*u(39);
end