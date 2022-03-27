M = csvread("data.csv");



Ub=M(1:end,1);Ib=M(1:end,2);Ug=M(1:end,3);Ig=M(1:end,4);Up=M(1:end,5);Ip=M(1:end,6);Uy=M(1:end,7);Iy=M(1:end,8);

figure(2);
plot(Ug,Ig,".k","markersize", 15,
     Ug,Ig,"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print Green.pdf