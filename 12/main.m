Mt = csvread("Data/transparent.csv");
Mr = csvread("Data/red.csv");
Mg = csvread("Data/green.csv");
Mb = csvread("Data/blue.csv");
My = csvread("Data/yellow.csv");

Y1 = linspace(Mt(1,2),Mt(end,2),50);
Y2 = linspace(Mb(1,2),Mb(end,2),50);
#{
Output linear coefficient A of specific color
next is delta A of specific color
last is Alfa of specific color
#}
#-------------------------------------------------------------

[pT, s]= polyfit(Mt(1:end,2),Mt(1:end,1), 1);
PolyT = polyval(pT, Y1, 50);
At = pT
DeltaAt = sqrt (diag (s.C)/s.df)*s.normr
AlfaT = At(1)/0.434294
figure(1);
plot(Mt(1:end,2),Mt(1:end,1),".r","markersize",15,
    Y1 ,PolyT,"linewidth",2);
grid minor on
xlabel("Thickness [mm]");
ylabel("ABS");
print ("Plots/Transparent.pdf")
close()

#-------------------------------------------------------------

[pT, s]= polyfit(Mr(1:end,2),Mr(1:end,1), 1);
PolyT = polyval(pT, Y2);
Ar = pT
DeltaAr = sqrt (diag (s.C)/s.df)*s.normr
AlfaR = Ar(1)/0.434294

figure(2);
plot(Mr(1:end,2),Mr(1:end,1),".r","markersize",15,
    Y2,PolyT,"linewidth",2);
grid minor on
xlabel("Thickness [mm]");
ylabel("ABS");
print (strcat("Plots/Red.pdf"))
close()

#-------------------------------------------------------------

[pT,s] = polyfit(Mg(1:end,2),Mg(1:end,1), 1);
PolyT = polyval(pT, Y2);
Ag = pT
DeltaAg = sqrt (diag (s.C)/s.df)*s.normr
AlfaG = Ag(1)/0.434294

figure(3);
plot(Mg(1:end,2),Mg(1:end,1),".r","markersize",15,
    Y2,PolyT,"linewidth",2);
grid minor on
xlabel("Thickness [mm]");
ylabel("ABS");
print (strcat("Plots/Green.pdf"))
close()

#-------------------------------------------------------------

[pT,s] = polyfit(Mb(1:end,2),Mb(1:end,1), 1);
PolyT = polyval(pT, Y2, 50);
Ab = pT
DeltaAb = sqrt (diag (s.C)/s.df)*s.normr
AlfaB = Ab(1)/0.434294

figure(4);
plot(Mb(1:end,2),Mb(1:end,1),".r","markersize",15,
    Y2,PolyT,"linewidth",2);
grid minor on
xlabel("Thickness [mm]");
ylabel("ABS");
print (strcat("Plots/Blue.pdf"))
close()

#-------------------------------------------------------------

[pT,s] = polyfit(My(1:end,2),My(1:end,1), 1);
PolyT = polyval(pT, Y2);
Ay = pT
DeltaAy = sqrt (diag (s.C)/s.df)*s.normr
AlfaY = Ay(1)/0.434294

figure(5);
plot(My(1:end,2),My(1:end,1),".r","markersize",15,
    Y2,PolyT,"linewidth",2);
grid minor on
xlabel("Thickness [mm]");
ylabel("ABS");
print (strcat("Plots/Yellow.pdf"))
close()
