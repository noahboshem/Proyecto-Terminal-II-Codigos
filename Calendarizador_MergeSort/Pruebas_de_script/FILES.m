%%PRUEBA PARA GUARDAR DATOS EN FILE%%%%%%%%%%%%
%%
Colores=["#746AB0","#FFCE30","#288BA8","#E389B9","#FF7F50","#556B2F","#ADFF2F"];
A=zeros(1,10);
for i=1:length(A)
    i
    A(i)=i;
end
B=(0:25)';
color=Colores(1);
p=plot(A,'linewidth',2); p.Color=Colores(1);

