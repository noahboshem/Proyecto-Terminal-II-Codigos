clc;
close all; clear all;

N=[10,15,20,25,30];
Lambda=[0.001,0.003,0.01,0.03];
Xi=[14,16,18,20,22];
W=[16,32,64,128,256];
K=[5,10,15,20,25];
L={10,'.',15,'.',20,'.',25,'.',30};
%%%

%%
  %%%%%%%   VARIANDO N%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 markers=['s','o','h','p','d','v','*'];
Colores=fliplr(["#746AB0","#FFCE30","#288BA8","#E389B9","#FF7F50","#556B2F","#ADFF2F"]);
figure(1)
hold on; grid on;
througput=zeros(1,length(N));
avg_timeratio=zeros(1,length(N));
retardo_promedio=zeros(1,7);
for a=1:length(N)
    [througput(a),avg_timeratio(a),retardo_promedio]=PRIMAC(N(a),Lambda(4),18,64,15);
    p1=plot(retardo_promedio,'linewidth',2); p1.Marker=markers(1); p1.Color=Colores(a); p1.LineStyle='--';
end

title('RETARDO PROMEDIO');
ylabel('Retardo Promedio');
xlabel('Grado');


figure(2)
p2=plot(througput,'linewidth',2); p2.Marker=markers(1); p2.Color=Colores(a); p2.LineStyle='--';
title('THROUGPUT');
%ylim([0.15 0.35]);
grid on;
ylabel('Througput');
xlabel('Numero de Nodos');
xticklabels(L)

figure(3)
p3=plot(avg_timeratio,'linewidth',2); p3.Marker=markers(1); p3.Color=Colores(a); p3.LineStyle='--';
title('TIEMPO ACTIVO PROMEDIO')
ylim([0.01 0.07]);
grid on;
hold on;
ylabel('Tiempo Activo Promedio');
xlabel('Numero de Nodos');
xticklabels(L)

figure(1); legend({'N=10','N=15','N=20','N=25','N=30'},'Location','northwest');


save resultados_lambda_001.mat

%%
 %%%%%%%   VARIANDO Lambda%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
hold on; grid on;
througput=zeros(1,length(Lambda));
avg_timeratio=zeros(1,length(Lambda));
retardo_promedio=zeros(1,7);
for a=1:length(Lambda)
    [througput(a),avg_timeratio(a),retardo_promedio]=PRIMAC(3,Lambda(a),18,64,15);
    plot(retardo_promedio,'linewidth',2);
end
title('retardo promedio');


figure(5)
plot(througput,'linewidth',2);
title('througput');
ylim([0.15 0.35]);
grid on;


figure(6)
plot(avg_timeratio,'linewidth',2);
title('avg timeratio')
ylim([0.02 0.06]);
grid on;

%%
%%%%%%%   VARIANDO Xi%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
hold on; grid on;
througput=zeros(1,length(Xi));
avg_timeratio=zeros(1,length(Xi));
retardo_promedio=zeros(1,7);
for a=1:length(Xi)
    [througput(a),avg_timeratio(a),retardo_promedio]=PRIMAC(3,0.03,Xi(a),64,15);
    plot(retardo_promedio,'linewidth',2);
end
title('retardo promedio');


figure(5)
plot(througput,'linewidth',2);
title('througput');
ylim([0.15 0.35]);
grid on;


figure(6)
plot(avg_timeratio,'linewidth',2);
title('avg timeratio')
ylim([0.02 0.06]);
grid on;


%%
%%%%%%%   VARIANDO W%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
hold on; grid on;
througput=zeros(1,length(W));
avg_timeratio=zeros(1,length(W));
retardo_promedio=zeros(1,7);
for a=1:length(W)
    [througput(a),avg_timeratio(a),retardo_promedio]=PRIMAC(3,0.03,18,W(a),15);
    plot(retardo_promedio,'linewidth',2);
end
title('retardo promedio');


figure(5)
plot(througput,'linewidth',2);
title('througput');
ylim([0.15 0.35]);
grid on;


figure(6)
plot(avg_timeratio,'linewidth',2);
title('avg timeratio')
ylim([0.02 0.06]);
grid on;

%%
%%%%%%%   VARIANDO K%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4)
hold on; grid on;
througput=zeros(1,length(K));
avg_timeratio=zeros(1,length(K));
retardo_promedio=zeros(1,7);
for a=1:length(K)
    [througput(a),avg_timeratio(a),retardo_promedio]=PRIMAC(3,0.03,18,64,K(a));
    plot(retardo_promedio,'linewidth',2);
end
title('retardo promedio');


figure(5)
plot(througput,'linewidth',2);
title('througput');
ylim([0.15 0.35]);
grid on;


figure(6)
plot(avg_timeratio,'linewidth',2);
title('avg timeratio')
ylim([0.02 0.06]);
grid on;

