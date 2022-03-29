pkg load miscellaneous;
clear("M","X","Y","Y2","Y3","Y4");
M = csvread("Data/1.csv");
X = M(750:end,1);
for i = 1:13
  M = csvread(strcat("Data/", int2str(i),".csv"));
  Y(1:length(M)-749,i) = M(750:end, 2);
  Y2(1:length(M)-749,i) = Y(1:length(M)-749,i).+(i*0.04);
  plot(X, M(750:end, 2))
     grid minor on
     axis("tight", "tic");
     xlabel("Liczba Falowa cm^-1");
     ylabel("Absorbancja");
     set (gca (), "xdir", "reverse", "ytick", [0], "xtick", 700:100:4000)
     set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
print (strcat("PlotsMadzia/", int2str(i),".pdf"))
close()
endfor

M = csvread("Data/3.csv");Y3(1:length(M)-749,1) = M(750:end, 2).+ 0.02;
M = csvread("Data/6.csv");Y3(1:length(M)-749,2) = M(750:end, 2).+ 0.04;
M = csvread("Data/10.csv");Y3(1:length(M)-749,3) = M(750:end, 2).+ 0.065;
M = csvread("Data/12.csv");Y3(1:length(M)-749,4) = M(750:end, 2).+ 0.08;
M = csvread("Data/2.csv");Y4(1:length(M)-749,1) = M(750:end, 2);
M = csvread("Data/4.csv");Y4(1:length(M)-749,2) = M(750:end, 2).+ 0.04;
M = csvread("Data/5.csv");Y4(1:length(M)-749,3) = M(750:end, 2).+ 0.1;
M = csvread("Data/9.csv");Y4(1:length(M)-749,4) = M(750:end, 2).+ 0.14;
M = csvread("Data/11.csv");Y4(1:length(M)-749,5) = M(750:end, 2).+ 0.18;
M = csvread("Data/13.csv");Y4(1:length(M)-749,6) = M(750:end, 2).+ 0.22;
M = csvread("Data/8.csv");Y4(1:length(M)-749,7) = M(750:end, 2).+ 0.24;
M = csvread("Data/1.csv");Y5(1:length(M)-749,1) = M(750:end, 2);
M = csvread("Data/7.csv");Y5(1:length(M)-749,2) = M(750:end, 2).+ 0.15;

plot(X, Y)
     grid minor on
     axis("tight", "tic");
     xlabel("Liczba Falowa cm^-1");
     ylabel("Absorbancja");
     legend("1","2","3","4","5","6","7","8","9","10","11","12","13");
     set (gca (), "xdir", "reverse", "ytick", [], "xtick", 700:100:4000)
     set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
print ("PlotsMadzia/Final1.pdf")
close()
#{
plot(X, Y2)
     grid minor on
     axis("tight", "tic");
     xlabel("Liczba Falowa cm^-1");
     ylabel("Absorbancja");
     legend("1","2","3","4","5","6","7","8","9","10","11","12","13");
     set (gca (), "xdir", "reverse", "ytick", [], "xtick", 700:100:4000)
     set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
print ("PlotsMadzia/Final2.pdf")
close()
plot(X, Y3)
     grid minor on
     axis("tight", "tic");
     xlabel("Liczba Falowa cm^-1");
     ylabel("Absorbancja");
     legend("3","6","10","12");
     set (gca (), "xdir", "reverse", "ytick", [], "xtick", 700:100:4000)
     set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
print ("PlotsMadzia/Final3.pdf")
close()
plot(X, Y4)
     grid minor on
     axis("tight", "tic");
     xlabel("Liczba Falowa cm^-1");
     ylabel("Absorbancja");
     legend("2","4","5","8","9","11","13");
     set (gca (), "xdir", "reverse", "ytick", [], "xtick", 700:100:4000)
     set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
print ("PlotsMadzia/Final4.pdf")
close()
plot(X, Y5)
     grid minor on
     axis("tight", "tic");
     xlabel("Liczba Falowa cm^-1");
     ylabel("Absorbancja");
     legend("1","7");
     set (gca (), "xdir", "reverse", "ytick", [], "xtick", 700:100:4000)
     set(gcf, 'PaperSize', [23.2 8.2], 'PaperPosition', [0 0 23.2 8.2])
print ("PlotsMadzia/Final5.pdf")
close()
#}