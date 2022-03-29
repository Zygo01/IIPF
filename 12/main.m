Mt = csvread("Data/transparent.csv");
Mr = csvread("Data/red.csv");
Mg = csvread("Data/green.csv");
Mb = csvread("Data/blue.csv");
My = csvread("Data/yellow.csv");

Y2 = linspace(Mb(1,2),Mb(end,2),50);

pT= polyfit(Mt(1:end,2),Mt(1:end,1), 1);
PolyT = polyval(pT, linspace(Mt(1,2), Mt(end,2), 50));
figure(1);
plot(Mt(1:end,2),Mt(1:end,1),".r","markersize",15,
    linspace(Mt(1,2),Mt(end,2),50),PolyT,"linewidth",2);
grid minor on
xlabel("Thickness");
ylabel("ABS");
print ("Plots/Transparent.pdf")
close()

pT= polyfit(Mr(1:end,2),Mr(1:end,1), 1);
PolyT = polyval(pT, Y2);
figure(2);
plot(Mr(1:end,2),Mr(1:end,1),".r","markersize",15,
    Y2,PolyT,"linewidth",2);
grid minor on
xlabel("Thickness");
ylabel("ABS");
print (strcat("Plots/Red.pdf"))
close()

[pT,s] = polyfit(Mg(1:end,2),Mg(1:end,1), 1);
PolyT = polyval(pT, Y2);
figure(3);
plot(Mg(1:end,2),Mg(1:end,1),".r","markersize",15,
    Y2,PolyT,"linewidth",2);
grid minor on
xlabel("Thickness");
ylabel("ABS");
print (strcat("Plots/Green.pdf"))
close()

[pT,s] = polyfit(Mb(1:end,2),Mb(1:end,1), 1);
PolyT = polyval(pT, Y2, 50);
figure(4);
plot(Mb(1:end,2),Mb(1:end,1),".r","markersize",15,
    Y2,PolyT,"linewidth",2);
grid minor on
xlabel("Thickness");
ylabel("ABS");
print (strcat("Plots/Blue.pdf"))
close()

[pT,s] = polyfit(My(1:end,2),My(1:end,1), 1);
PolyT = polyval(pT, Y2);
figure(5);
plot(My(1:end,2),My(1:end,1),".r","markersize",15,
    Y2,PolyT,"linewidth",2);
grid minor on
xlabel("Thickness");
ylabel("ABS");
print (strcat("Plots/Yellow.pdf"))
close()
