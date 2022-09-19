%%
%%
clc;
close all; clear all;

N=[10,15,20];
Lambda=[0.001,0.003,0.005];
Xi=[14,16,18,20,22];
W=[16,32,64,128,256];
K=[5,10,15,20,25];
%%%

%% OBTENCION DE DEADLINES  (CORRER PRIMERO)
  %%%%%%PARA LA OBTENCION DE LOS CASOS EN QUE SE VARIA LAMBDA
  clc; close all; clear all;
  LAMBDA=0.001:0.002:0.009; 
  througput=zeros(1,length(LAMBDA));
  avg_timeratio=zeros(1,length(LAMBDA));
  retardo_promedio=zeros(1,7);
  pkt_loss=zeros(1,7); retardos=cell(7,1);
  deadlines=zeros(1,length(LAMBDA)); ret_un_cuarto=zeros(1,length(LAMBDA)); ret_tres_cuartos=zeros(1,length(LAMBDA));
  for a=1:length(LAMBDA)
  [througput(a),avg_timeratio(a),retardo_promedio,pkt_loss,retardos]=H_MAC(20,LAMBDA(a),18,20,15);
  retmax=max(retardos{7}); deadlines(a)=(retmax+retardo_promedio(7))/2;
  ret_un_cuarto(a)=(deadlines(a)+retardo_promedio(7))/2;
  ret_tres_cuartos(a)=(deadlines(a)+retmax)/2;
  impresion=['El retardo maximo con λ=',num2str(LAMBDA(a)),' Es ',num2str(retmax),' --El retardo promedio es ',num2str(retardo_promedio(7)),' --El punto a 1/4 es:',num2str(ret_un_cuarto(a))];
  impresion1=['El retardo maximo con λ=',num2str(LAMBDA(a)),' Es ',num2str(retmax),' --El retardo promedio es ',num2str(retardo_promedio(7)),' --El punto medio es:',num2str(deadlines(a))];
  impresion2=['El retardo maximo con λ=',num2str(LAMBDA(a)),' Es ',num2str(retmax),' --El retardo promedio es ',num2str(retardo_promedio(7)),' --El punto a 3/4 es:',num2str(ret_tres_cuartos(a))];
  impresion3=['--------------------------------------------------------------------------------------'];
  disp(impresion); disp(impresion1); disp(impresion2); disp(impresion3);
  end
  
  load('Tono.mat');
  gong = audioplayer(y, fs);
  play(gong);

%% APARTADO DE GRAFICACION (CORRER SEGUNDO)
 %%%%%%VARIANDO LAMBDA CON N=20
close all; clear all; clc;
markers=['o','s','h','p','d','v','*'];
Colores=["#746AB0","#FFCE30","#288BA8","#E389B9","#FF7F50","#556B2F","#ADFF2F"];
LAMBDA=0.001:0.002:0.009; N=20; clc; 
N=[10,15,20];
Tam=length(N);
%deadlines=[2.8243,355.377,1871.8208,2858.7436,3198.2543];  %%%DEADLINE EN RETARDO PROMEDIO  --------
%deadlines=[8.1244,680.7423,2271.3813,3323.7481,3638.3838];     %%DEADLINE EN DECREMENTO
%deadlines=[13.4426,1006.1076,2670.9417,3788.7525,4078.5132];  %%DEADLINE MEDIO   -----------------
deadlines=[18.7608,1331.4729,3070.5022,4253.7569,4518.6426];  %%DEADLINE EN INCREMENTO -----------
througput=zeros(1,Tam); avg_timeratio=zeros(1,Tam); 
retardo_promedio=zeros(Tam,7); 
pkt_loss=zeros(Tam,7);

througput1=zeros(1,Tam); avg_timeratio1=zeros(1,Tam); 
retardo_promedio1=zeros(Tam,7); 
pkt_loss1=zeros(Tam,7);
retardos=cell(7,1);
retardos1=cell(7,1);
for a=1:Tam
    [througput1(a),avg_timeratio1(a),retardo_promedio1(a,:),pkt_loss1(a,:),retardos1]=H_MAC_DEAD_LINE(N,LAMBDA(a),18,N,15,deadlines(a));
    [througput(a),avg_timeratio(a),retardo_promedio(a,:),pkt_loss(a,:),retardos]=H_MAC(N,LAMBDA(a),18,N,15);
    
    figure(1); hold on; grid on;
    p= plot(retardo_promedio(a,:),'linewidth',2) ;   p.Marker=markers(1); p.Color=Colores(a);
    p1= plot(retardo_promedio1(a,:),'linewidth',2);  p1.Marker=markers(2); p1.Color=Colores(a);
  
    figure(2); hold on; grid on;
    p2=plot(pkt_loss(a,:),'linewidth',2);    p2.Marker=markers(1); p2.Color=Colores(a);
    p3=plot(pkt_loss1(a,:),'linewidth',2);    p3.Marker=markers(2); p3.Color=Colores(a);
    
end
figure(1); title('RETARDO PROMEDIO  H-MAC  VS  H-MAC-DL');
figure(2); title('PKT LOSS PROB  H-MAC  VS  H-MAC-DL');
figure(3); title('THROUGHPUT  H-MAC  VS  H-MAC-DL'); hold on; grid on;
p4=plot(througput,'linewidth',2);    p4.Marker=markers(1); p4.Color=Colores(1);
p5=plot(througput1,'linewidth',2);    p5.Marker=markers(2); p4.Color=Colores(1);
save resultados_incremento_v2.mat;


load('Tono.mat');
gong = audioplayer(y, fs);
play(gong);


%%      APARTADO DE PRUEBAS QUE NECESITAN SCRIPT
VARIABLE1= 10.50;
VARIABLE2=20.50;
RESULTADO=VARIABLE1+VARIABLE2;
IMPRESION=['EL RESULTADO DE LA SUMA ', num2str(VARIABLE1), '+', VARIABLE2, 'DA COMO RESULTADO:', RESULTADO]



%%
  %%%%%%%   VARIANDO N%%%%%%%%%%%%%%%%%%%%%%%%%%%%% retardo promedio
  %%%%%%%   variando  N con lambda=0.001

DL=0;

figure(1)
hold on; grid on;
througput=zeros(1,length(N));
avg_timeratio=zeros(1,length(N));
retardo_promedio=zeros(1,7);
for a=1:length(N)
    [througput(a),avg_timeratio(a),retardo_promedio]=H_MAC(N(a),0.001,18,N(a),15);
    p=plot(retardo_promedio,'linewidth',2);
    p.Marker='s';
end
for a=1:length(N)
    [througput(a),avg_timeratio(a),retardo_promedio]=H_MAC_DEAD_LINE(N(a),0.001,18,N(a),15);
    p1=plot(retardo_promedio,'linewidth',2);
    p1.Marker='o';
end

title('retardo promedio');
ylim([0 3500]);

        %%%%%Lambda= 0.005
DL=0;
figure(2)
hold on; grid on;
througput=zeros(1,length(N));
avg_timeratio=zeros(1,length(N));
retardo_promedio=zeros(1,7);
for a=1:length(N)
    [througput(a),avg_timeratio(a),retardo_promedio]=H_MAC(N(a),0.001,18,N(a),15);
    p=plot(retardo_promedio,'linewidth',2);
    p.Marker='s';
end
for a=1:length(N)
    [througput(a),avg_timeratio(a),retardo_promedio]=H_MAC_DEAD_LINE(N(a),0.001,18,N(a),15);
    p1=plot(retardo_promedio,'linewidth',2);
    p1.Marker='o';
end

title('retardo promedio');
ylim([0 3500]);

%%  para la probalbilidad de paquetes perdidos
figure(1)
hold on; grid on;
througput=zeros(1,length(N));
avg_timeratio=zeros(1,length(N));
retardo_promedio=zeros(1,7);
pkt_loss=zeros(1,7);
for a=1:length(N)
    [througput(a),avg_timeratio(a),retardo_promedio,pkt_loss]=H_MAC(N(a),0.001,18,N(a),15);
    p1=plot(pkt_loss,'linewidth',2);
    p1.Marker='s';
end

for a=1:length(N)
    [througput(a),avg_timeratio(a),retardo_promedio]=H_MAC_Merge_Sort(N(a),0.001,18,N(a),15);
    p1=plot(pkt_loss,'linewidth',2);
    p1.Marker='o';
end

title('Packet loss probability');
ylim([0 0.04]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% lambda 0.005
figure(2)
hold on; grid on;
througput=zeros(1,length(N));
avg_timeratio=zeros(1,length(N));
retardo_promedio=zeros(1,7);
pkt_loss=zeros(1,7);
for a=1:length(N)
    [througput(a),avg_timeratio(a),retardo_promedio,pkt_loss]=H_MAC(N(a),0.005,18,N(a),15);
    p1=plot(pkt_loss,'linewidth',2);
    p1.Marker='s';
end

for a=1:length(N)
    [througput(a),avg_timeratio(a),retardo_promedio]=H_MAC_Merge_Sort(N(a),0.005,18,N(a),15);
    p1=plot(pkt_loss,'linewidth',2);
    p1.Marker='o';
end

title('Packet loss probability');
ylim([0 1]);


%%
retardo_prom=[5.6087,6.5147,7.0521,7.4043,7.7670,8.0869,8.3500;454.9600,646.3018,649.9732,655.3031,652.9834,656.6691,657.4101;719.981976739501,1369.81572738616,1833.52240227167,1865.94434791520,1865.38503211791,1860.38121286070,1867.32832990535];
plot(retardo_prom,'linewidth',2);
ylim([0 3500]);
%%
 %%%%%%%   VARIANDO Lambda y N%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Grafica de througput
througput=zeros(1,length(N));
avg_timeratio=zeros(1,length(N));
retardo_promedio=zeros(1,7);

througput1=zeros(1,length(N));
avg_timeratio1=zeros(1,length(N));
retardo_promedio1=zeros(1,7);

for b=1:length(Lambda)
for a=1:length(N)
    [througput(a),avg_timeratio(a),retardo_promedio]=H_MAC(N(a),Lambda(b),18,N(a),15);
    [througput1(a),avg_timeratio1(a),retardo_promedio1]=H_MAC_Merge_Sort(N(a),Lambda(b),18,N(a),15);
end
figure(5)
grid on;
hold on;
p=plot(througput,'linewidth',2);
p1=plot(througput1,'linewidth',2);
p.Marker='s';
p1.Marker='o';
title('througput');

ylim([0 0.70]);

end


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


%% Obtencion de Graficas desde las variables recuperadas:
close all; clear all; clc;
load resultados_incremento_v2.mat
markers=['s','o','h','p','d','v','*'];
Colores=fliplr(["#746AB0","#FFCE30","#288BA8","#E389B9","#FF7F50","#556B2F","#ADFF2F"]);
        %%%%%%GRAFICACION DE PROBABILIDAD DE PAQUETE PERDIDO
[col,fil]=size(pkt_loss);

for a=1:col
    figure(1); grid on; hold on;p1= plot(pkt_loss(a,:),'linewidth',1.5) ;   p1.Marker=markers(1); p1.Color=Colores(a); p1.LineStyle='--'; title('Probabilidad de Paquete Perdido H-MAC');
    figure(2); grid on; hold on;p2= plot(pkt_loss1(a,:),'linewidth',2) ;   p2.Marker=markers(2); p2.Color=Colores(a); p2.LineStyle=':'; title('Probabilidad de Paquete Perdido H-MAC-DL');
    figure(3); grid on; hold on;p1= plot(pkt_loss(a,:),'linewidth',1.5) ;   p1.Marker=markers(1); p1.Color=Colores(a); p1.LineStyle='--';
                                p2= plot(pkt_loss1(a,:),'linewidth',1.5) ;   p2.Marker=markers(2); p2.Color=Colores(a); p2.LineStyle=':'; title('Probabilidad de Paquete Perdido H-MAC VS H-MAC-DL');
end
figure(1); legend({'λ=0.001','λ=0.003','λ=0.005','λ=0.007','λ=0.009'},'Location','northwest'); xlabel('Grado'); ylabel('Probabilidad');
figure(2); legend({'λ=0.001','λ=0.003','λ=0.005','λ=0.007','λ=0.009'},'Location','northwest'); xlabel('Grado'); ylabel('Probabilidad');
figure(3); legend({'H-MAC λ=0.001','H-MAC-DL λ=0.001','H-MAC λ=0.003','H-MAC-DL λ=0.003','H-MAC λ=0.005','H-MAC-DL λ=0.005','H-MAC λ=0.007','H-MAC-DL λ=0.007','H-MAC λ=0.009','H-MAC-DL λ=0.009',},'Location','northwest'); xlabel('Grado'); ylabel('Probabilidad');
            ylim([0 1.5]);

        %%%%%%GRAFICACION DE retardo promedio de paquetes
[col,fil]=size(retardo_promedio);

for a=1:col
    figure(4); grid on; hold on;p1= plot(retardo_promedio(a,:),'linewidth',1.5) ;   p1.Marker=markers(1); p1.Color=Colores(a); p1.LineStyle='--'; title('Retardo Promedio H-MAC');
    figure(5); grid on; hold on;p2= plot(retardo_promedio1(a,:),'linewidth',2) ;   p2.Marker=markers(2); p2.Color=Colores(a); p2.LineStyle=':'; title('Retardo Promedio H-MAC-DL'); ylim([0 2500]);
    figure(6); grid on; hold on;p1= plot(retardo_promedio(a,:),'linewidth',1.5) ;   p1.Marker=markers(1); p1.Color=Colores(a); p1.LineStyle='--';
                                p2= plot(retardo_promedio1(a,:),'linewidth',1.5) ;   p2.Marker=markers(2); p2.Color=Colores(a); p2.LineStyle=':'; title('Retardo Promedio H-MAC VS H-MAC-DL'); ylim([0 4500]);
end
figure(4); legend({'λ=0.001','λ=0.003','λ=0.005','λ=0.007','λ=0.009'},'Location','northwest'); xlabel('Grado'); ylabel('Retardo (s)');
figure(5); legend({'λ=0.001','λ=0.003','λ=0.005','λ=0.007','λ=0.009'},'Location','northwest'); xlabel('Grado'); ylabel('Retardo (s)');
figure(6); legend({'H-MAC λ=0.001','H-MAC-DL λ=0.001','H-MAC λ=0.003','H-MAC-DL λ=0.003','H-MAC λ=0.005','H-MAC-DL λ=0.005','H-MAC λ=0.007','H-MAC-DL λ=0.007','H-MAC λ=0.009','H-MAC-DL λ=0.009',},'Location','northwest'); xlabel('Grado'); ylabel('Retardo (s)');

    %%%%%%%GRAFICAS DEL THROUGHTPUT

figure(7); hold on; grid on; title('Throughtput H-MAC'); xlabel('Lambda (λ)'); ylabel('Throughtput');
    p1= plot(througput,'linewidth',1.5) ;   p1.Marker=markers(1); p1.Color=Colores(1); p1.LineStyle='--'; 
    xticklabels({'0.001',' ','0.003',' ','0.005',' ','0.007',' ','0.009'}); 
figure(8); hold on; grid on; title('Throughtput H-MAC-DL'); xlabel('Lambda (λ)'); ylabel('Throughtput');
    p2= plot(througput1,'linewidth',2) ;   p2.Marker=markers(2); p2.Color=Colores(2); p2.LineStyle=':'; 
    xticklabels({'0.001',' ','0.003',' ','0.005',' ','0.007',' ','0.009'}); 
figure(9); hold on; grid on; title('Throughtput H-MAC VS H-MAC-DL'); ylim([0 0.5]);
    p1= plot(througput,'linewidth',1.5) ;   p1.Marker=markers(1); p1.Color=Colores(1); p1.LineStyle='--';
    p2= plot(througput1,'linewidth',1.5) ;   p2.Marker=markers(2); p2.Color=Colores(2); p2.LineStyle=':';
    legend({'H-MAC','H-MAC-DL'},'Location','northwest'); xticklabels({'0.001',' ','0.003',' ','0.005',' ','0.007',' ','0.009'}); xlabel('Lambda (λ)'); ylabel('Throughtput');
    