pkg load miscellaneous;
M = csvread("Data/1.csv");
Ub=M(1:end,1);Ib=M(1:end,2);Ug=M(1:17,3);Ig=M(1:17,4);Uy=M(1:12,5);Iy=M(1:12,6);
N = csvread("Data/2.csv");

%-------------------------------------------------------------------------
% Krzywa dyspersji

[dysP, s] = polyfit(N(1:end,1),N(1:end,2),1);
dysp = polyval(dysP, linspace(N(1,1), N(end,1), 50));
figure(1);
plot(N(1:end,1),N(1:end,2),".k","markersize", 15,
     linspace(N(1,1), N(end,1), 50),dysp,"linewidth",2)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print ("Plots/dispersion.pdf");
close();

%-------------------------------------------------------------------------
% Napięcia Hamowania

Uhb = -0.865;
Uhg = -0.615;
Uhy = -0.38;
Uh = [abs(Uhb), abs(Uhg), abs(Uhy)];

%-------------------------------------------------------------------------
% Napięcia hamowania od częstotliwości

fb = (physical_constant("speed of light in vacuum") / 435e-9);
fg = (physical_constant("speed of light in vacuum") / 545e-9);
fy = (physical_constant("speed of light in vacuum") / 578e-9);
f = [fb, fg, fy];

[Uhf, sh] = polyfit(f,Uh,1);
Uhf
h_poly = polyval(Uhf, linspace(fb, fy, 50));

%-------------------------------------------------------------------------
% Wyznaczanie stałej Plancka i błędów pomiarowych

h = Uhf(1,1)* physical_constant("elementary charge")
delta = sqrt (diag (sh.C)/sh.df)*sh.normr;
deltaA = delta(1,1)

%-------------------------------------------------------------------------
% Wykresy

figure(2);
plot(Ub,Ib,".k","markersize", 15,
     Uhb,0,".r","markersize",20)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print ("Plots/Blue.pdf");
close();

figure(3);
plot(Ug,Ig,".k","markersize", 15,
     Uhg,0,".r","markersize",20)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print ("Plots/Green.pdf");
close();

figure(4);
plot(Uy,Iy,".k","markersize", 15,
     Uhy,0,".r","markersize",20)
     grid minor on
set (gca, "xaxislocation","origin", "yaxislocation", "origin", "box","off")
print ("Plots/Yellow.pdf");
close();

figure(5);
plot(f,Uh,".k","markersize", 15,
     linspace(fb, fy, 50), h_poly,"linewidth",2);
ylim([0, 2]);
xlim([0 7e+14]);
grid minor on
print ("Plots/Final.pdf");
close();

