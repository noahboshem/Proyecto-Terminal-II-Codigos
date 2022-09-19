function [out1] = actualiza_tiempos(buffer,tsim,dedline)
tam=length(buffer);
% impresion=[,num2str(tam)];
% disp(impresion);
for a=1:tam
buffer(a).T_red=tsim-buffer(a).T_arribo; 
end

b=1;
while(b<tam)
if (buffer(b).T_red>dedline)
    imp=[num2str(dedline),'<',num2str(buffer(b).T_red)];
    disp(imp);
    buffer(b)=[];
    tam=tam-1;
end
b=b+1;
end
out1=buffer;
end