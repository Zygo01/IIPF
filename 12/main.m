pkg load miscellaneous;
x = [0.18 0.36 0.54 0.72 0.9 1.08 1.26 1.44 1.62 1.8 1.98 2.16];
y = [0.199 0.394 0.519 0.764 0.9 1.12 1.347 1.505 1.657 1.889 1.995 2.107];

plot(x,y,".r","markersize", 15, x,y,"linewidth",2)
     grid minor on
     xlabel("Thickness");
     ylabel("ABS");
print ("1.pdf")
close()