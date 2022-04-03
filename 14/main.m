pkg load miscellaneous;
M = csvread("data.csv");
Ub=M(1:end,1);Ib=M(1:end,2);Ug=M(1:21,3);Ig=M(1:21,4);Uy=M(1:14,5);Iy=M(1:14,6);
N = csvread("data2.csv");

% Najlepsze dopasowanie f. liniowej do środkowej części sygmoidu
pB = polyfit(Ub(3:length(Ub)-3), Ib(3:length(Ib)-3), 1);
polyB = (polyval(pB, Ub));

pG = polyfit(Ug(9:length(Ug)-5), Ig(9:length(Ig)-5), 1);
polyG = (polyval(pG, Ug));

pY = polyfit(Uy(6:length(Uy)-6), Iy(6:length(Iy)-6), 1);
polyY = (polyval(pY, Uy));
%-------------------------------------------------------------------------
% Krzywa dyspersji

[dysP, s] = polyfit(N(1:end,1),N(1:end,2),1);
dysp = polyval(dysP, linspace(N(1,1), N(end,1), 50));
figure(4);
plot(N(1:end,1),N(1:end,2),".k","markersize", 15,
     linspace(N(1,1), N(end,1), 50),dysp,"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print dispersion2.pdf
close();

% Krzywa dyspersji log


figure(8);
semilogy(N(1:end,2),N(1:end,1),".k","markersize", 15);
grid minor on
print dispersionLOG.pdf
close();

%-------------------------------------------------------------------------
% Napięcia Hamowania

#Uhb = roots(pB);
#Uhg = roots(pG);
#Uhy = roots(pY);
Uhb = -0.865;
Uhg = -1.304;
Uhy = -0.497;
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

h = Uhf(1,1)* physical_constant("elementary charge")
delta = sqrt (diag (sh.C)/sh.df)*sh.normr;
deltaA = delta(1,1);

%-------------------------------------------------------------------------
% Wykresy

figure(1);
plot(Ub,Ib,".k","markersize", 15,
     Uhb,0,".r","markersize",20,
     Ub, polyB
     ,"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print ("Blue.pdf");
close();

figure(2);
plot(Ug,Ig,".k","markersize", 15,
     Uhg,0,".r","markersize",20,
     Ug, polyG,"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print ("Green.pdf");
close();

figure(3);
plot(Uy,Iy,".k","markersize", 15,
     Uhy,0,".r","markersize",20,
     Uy, polyY,"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print ("Yellow.pdf");
close();

figure(4);
plot(N(1:end,1),N(1:end,2),".k","markersize", 15,
     linspace(N(1,1), N(end,1), 50),dysp,"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print dispersion.pdf
close();

figure(5);
plot(f,Uh,".k","markersize", 15,
     linspace(fb, fy, 50), h_poly,"linewidth",2);
ylim([0, 1]);
grid minor on
print Final.pdf
close();

