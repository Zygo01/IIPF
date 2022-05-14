x=exp(1i*2*pi()*(1:60)/60);y=2+cos(2*pi()*(1:50)/20);z=y'*x;t,r] = meshgrid(linspace(0,2*pi,361),linspace(-4,4,101));[x,y] = pol2cart(t,r);P = peaks(x,y); % peaks function on a polar grid% draw 3d polar plotfigure('Color','white','NumberTitle','off','Name','PolarPlot3d v4.3');polarplot3d(P,'PlotType','surfn','PolarGrid',{4 24},'TickSpacing',8,...'AngularRange',[30 270]*pi/180,'RadialRange',[.8 4],...'RadLabels',3,'RadLabelLocation',{180 'max'},'RadLabelColor','red');% set plot attributesset(gca,'DataAspectRatio',[1 1 10],'View',[-12,38],...'Xlim',[-4.5 4.5],'Xtick',[-4 -2 0 2 4],...'Ylim',[-4.5 4.5],'Ytick',[-4 -2 0 2 4]);title('polarplot3d example');