pkg load miscellaneous;
M = csvread("data.csv");
for i = 1:180
  M(i) = K(i)*(rand(1,1).*(1.04-0.96)+0.95); 
endfor
for i = 1:500
  g(i) = g(i)*(rand(1,1).*(1.04-0.96)+0.95); 
endfor
Ub=M(1:end,1);Ib=M(1:end,2);Ug=M(1:21,3);Ig=M(1:21,4);Uy=M(1:14,5);Iy=M(1:14,6);
N = csvread("data2.csv");

% Najlepsze dopasowanie f. liniowej do środkowej części sygmoidu
function [c] = fitness (a,b)
    for i = 1:length(a)/2
    [p, s] = polyfit(a(0+i:(length(a)+1)-i), b(0+i:(length(a)+1)-i), 1);
    f(i,1:2) = p;
    y(i,1:length(a)) = (polyval(p, a));
    e(i,1) = sum(sqrt (diag (s.C)/s.df)*s.normr);
  endfor
[k iw] = min(e);
  plot(a,b,".k","markersize",15, a,y(iw,1:end))
  c = f(iw,:);
endfunction

%-------------------------------------------------------------------------
% Krzywa dyspersji
#{
[dysP, s] = polyfit(N(1:end,1),N(1:end,2),2);
dysp = polyval(dysP, linspace(N(1,1), N(end,1), 50));
figure(4);
plot(N(1:end,1),N(1:end,2),".k","markersize", 15,
     N(1:end,1),N(1:end,2),"linewidth",2,
     linspace(N(1,1), N(end,1), 50),dysp,"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print dispersion2.pdf

% Krzywa dyspersji log


figure(8);
y = loglog(N(1:end,2),N(1:end,1));
[dysPLOG, s] = polyfit(N(1:end,1),y,2);
dyspLOG = polyval(dysPLOG, linspace(N(1,1), N(end,1), 50));
plot(linspace(N(1,1), N(end,1), 50),dyspLOG,"linewidth",2);
axis("tight");

print dispersionLOG.pdf
#}
%-------------------------------------------------------------------------
% Napięcia Hamowania

Uhb = roots(fitness(Ub, Ib));
Uhg = roots(fitness(Ug, Ig));
Uhy = roots(fitness(Uy, Iy));
Uh = [abs(Uhb), abs(Uhg), abs(Uhy)];

%-------------------------------------------------------------------------
% Napięcia hamowania od częstotliwości

fb = (physical_constant("speed of light in vacuum") / 435e-9);
fg = (physical_constant("speed of light in vacuum") / 545e-9);
fy = (physical_constant("speed of light in vacuum") / 578e-9);
f = [fb, fg, fy];

[Uhf, sh] = polyfit(f,Uh,1);
h_poly = polyval(Uhf, linspace(fb, fy, 50));

%-------------------------------------------------------------------------
% Wyznaczanie stałej Plancka i błędów pomiarowych

h = Uhf(1,1)* physical_constant("elementary charge");
delta = sqrt (diag (sh.C)/sh.df)*sh.normr;
deltaA = delta(1,1);

%-------------------------------------------------------------------------
% Wykresy

figure(1);
plot(Ub,Ib,".k","markersize", 15,
     Ub,Ib,"linewidth",2,
     Uhb,0,".r","markersize",20,
     Ub, polyval(fitness(Ub, Ib),Ub),"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print Blue.pdf
close();

figure(2);
plot(Ug,Ig,".k","markersize", 15,
     Ug,Ig,"linewidth",2,
     Uhg,0,".r","markersize",20,
     Ug, polyval(fitness(Ug, Ig),Ug),"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print Green.pdf
close();

figure(3);
plot(Uy,Iy,".k","markersize", 15,
     Uy,Iy,"linewidth",2,
     Uhy,0,".r","markersize",20,
     Uy, polyval(fitness(Uy, Iy),Uy),"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print Yellow.pdf
close();

figure(4);
plot(N(1:end,1),N(1:end,2),".k","markersize", 15,
     N(1:end,1),N(1:end,2),"linewidth",2,
     linspace(N(1,1), N(end,1), 50),dysp,"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print dispersion.pdf
close();

figure(5);
plot(f,Uh,".k","markersize", 15,
     linspace(fb, fy, 50), h_poly,"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print Final.pdf
close();
