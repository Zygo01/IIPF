clear("M","Mt","Mr","Mg","Mb","My");
Mt = csvread("Data/transparent.csv");
#{
Mr = csvread("Data/red.csv");
Mg = csvread("Data/green.csv");
Mb = csvread("Data/blue.csv");
My = csvread("Data/yellow.csv");
#}
[p,s] = polyfit(Mt(1:end,2),Mt(1:end,1), 0);

plot(Mt(1:end,2),Mt(1:end,1),".r","markersize", 15)
     grid minor on
     xlabel("Thickness");
     ylabel("ABS");
print ("1.pdf")
close()