function [out1] = actualiza_tiempos1(buffer,tsim,dedline)
tam=length(buffer);
impresion=['tamaño del buffer:',num2str(tam)];
disp(impresion);
for a=1:tam
a
buffer(a).T_red=tsim-buffer(a).T_arribo; 
end
for a=1:tam
 if (buffer(a).T_red>=dedline)
    buffer(a)=[];
 end    
end
out1=buffer;
end