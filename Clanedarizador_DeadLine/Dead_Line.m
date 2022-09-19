function [output1] = Dead_Line(buffer,deadline)
buffer.T_arribos
old_pkts=[buffer.T_arribo] > deadline;
buffer(old_pkts)=[];
output1=buffer;
end