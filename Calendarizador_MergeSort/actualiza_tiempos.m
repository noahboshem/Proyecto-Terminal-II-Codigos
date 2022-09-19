function [out1] = actualiza_tiempos(buffer,tsim)
tam=length(buffer);
% impresion=[,num2str(tam)];
% disp(impresion);
for a=1:tam
buffer(a).T_red=tsim-buffer(a).T_arribo; 
end
out1=buffer;
end