%%%%%%%%%%%%%TABLAS%%%%%%%%%%%%%%%%%
%%
Ro        =1e-3;
CTS       =11e-3;
RTS       =11e-3;
ACK       =11e-3;
DATA      =43e-3;
DIFS      =10e-3;
SIFS      =5e-3;
I         =7;
Xi        =18;
%%%------------------CALCULAMOS DURACION DE CADA RANURA-------
%%%%VARIANDO LAMBDA [0.0010    0.0030    0.0050    0.0070    0.0090] CON 
%%% N FIJO [20]

Lambda=.001:.002:.009; N=20; W=N;
Capacidad_de_red=zeros(1,length(Lambda)); pkts_generados_por_la_Red=zeros(1,length(Lambda));
for a=1:length(Lambda)
    T= DIFS+(Ro*W)+RTS+CTS+DATA+ACK+(3*SIFS);
    Tc = T*(Xi+2);
    Capacidad_de_red(a)=1/Tc;
    pkts_generados_por_la_Red(a)=Lambda(a)*N*I;
end
Lambda=Lambda'; Capacidad_de_red=Capacidad_de_red'; pkts_generados_por_la_Red=pkts_generados_por_la_Red';
T1=table(Lambda,Capacidad_de_red,pkts_generados_por_la_Red)
N
%%%%VARIANDO N [10    15    20    25    30] CON 
%%% LAMBDA FIJO [0.001]
Lambda=.001; N=10:5:30; W=N;
Capacidad_de_red=zeros(1,length(N)); pkts_generados_por_la_Red=zeros(1,length(N));
for a=1:length(N)
    T= DIFS+(Ro*W(a))+RTS+CTS+DATA+ACK+(3*SIFS);
    Tc = T*(Xi+2);
    Capacidad_de_red(a)=1/Tc;
    pkts_generados_por_la_Red(a)=Lambda*N(a)*I;
end
N=N'; Capacidad_de_red=Capacidad_de_red'; pkts_generados_por_la_Red=pkts_generados_por_la_Red';
T2=table(N,Capacidad_de_red,pkts_generados_por_la_Red)
Lambda
%%%%VARIANDO N [10    15    20    25    30] CON 
%%% LAMBDA FIJO [0.005]
Lambda=.005; N=10:5:30; W=N;
Capacidad_de_red=zeros(1,length(N)); pkts_generados_por_la_Red=zeros(1,length(N));
for a=1:length(N)
    T= DIFS+(Ro*W(a))+RTS+CTS+DATA+ACK+(3*SIFS);
    Tc = T*(Xi+2);
    Capacidad_de_red(a)=1/Tc;
    pkts_generados_por_la_Red(a)=Lambda*N(a)*I;
end
N=N'; Capacidad_de_red=Capacidad_de_red'; pkts_generados_por_la_Red=pkts_generados_por_la_Red';
T3=table(N,Capacidad_de_red,pkts_generados_por_la_Red)
Lambda
%%%%VARIANDO N [10    15    20    25    30] CON 
%%% LAMBDA FIJO [0.009]
Lambda=.009; N=10:5:30; W=N;
Capacidad_de_red=zeros(1,length(N)); pkts_generados_por_la_Red=zeros(1,length(N));
for a=1:length(N)
    T= DIFS+(Ro*W(a))+RTS+CTS+DATA+ACK+(3*SIFS);
    Tc = T*(Xi+2);
    Capacidad_de_red(a)=1/Tc;
    pkts_generados_por_la_Red(a)=Lambda*N(a)*I;
end
N=N'; Capacidad_de_red=Capacidad_de_red'; pkts_generados_por_la_Red=pkts_generados_por_la_Red';
T4=table(N,Capacidad_de_red,pkts_generados_por_la_Red)
Lambda