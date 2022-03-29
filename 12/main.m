#clear("M1","M2","M3","M4","M5");
Mt = csvread("Data/transparent.csv");
#{
Mr = csvread("Data/red.csv");
Mg = csvread("Data/green.csv");
Mb = csvread("Data/blue.csv");
My = csvread("Data/yellow.csv");
#}


[pT,s] = polyfit(Mt(1:end,2),Mt(1:end,1), 1);
PolyT = polyval(pT, linspace(Mt(1,1), Mt(end,1), 50));
#{
[pT,s] = polyfit(Mr(1:end,2),Mr(1:end,1), 1);
PolyT = polyval(pT, linspace(Mr(1,1), Mr(end,1), 50));
[pT,s] = polyfit(Mg(1:end,2),Mg(1:end,1), 1);
PolyT = polyval(pT, linspace(Mg(1,1), Mg(end,1), 50));
[pT,s] = polyfit(Mb(1:end,2),Mb(1:end,1), 1);
PolyT = polyval(pT, linspace(Mb(1,1), Mb(end,1), 50));
[pT,s] = polyfit(My(1:end,2),My(1:end,1), 1);
PolyT = polyval(pT, linspace(My(1,1), My(end,1), 50));
#}

figure(1);
plot(Mt(1:end,2),Mt(1:end,1),".r","markersize",15,
    linspace(Mt(1,1),Mt(end,1),50),PolyT,"linewidth",2);
grid minor on
xlabel("Thickness");
ylabel("ABS");
print ("Plots/Transparent.pdf")
close()
#{
figure(1);
plot(a(1:end,2),a(1:end,1),".r","markersize",15,
    linspace(a(1,1),a(end,1),50),PolyT,"linewidth",2)
grid minor on
xlabel("Thickness");
ylabel("ABS");
print (strcat("Plots/", int2str(i),".pdf"))
close()

figure(1);
plot(a(1:end,2),a(1:end,1),".r","markersize",15,
    linspace(a(1,1),a(end,1),50),PolyT,"linewidth",2)
grid minor on
xlabel("Thickness");
ylabel("ABS");
print (strcat("Plots/", int2str(i),".pdf"))
close()

figure(1);
plot(a(1:end,2),a(1:end,1),".r","markersize",15,
    linspace(a(1,1),a(end,1),50),PolyT,"linewidth",2)
grid minor on
xlabel("Thickness");
ylabel("ABS");
print (strcat("Plots/", int2str(i),".pdf"))
close()

figure(1);
plot(a(1:end,2),a(1:end,1),".r","markersize",15,
    linspace(a(1,1),a(end,1),50),PolyT,"linewidth",2)
grid minor on
xlabel("Thickness");
ylabel("ABS");
print (strcat("Plots/", int2str(i),".pdf"))
close()
#}