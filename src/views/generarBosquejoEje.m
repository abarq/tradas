function generarBosquejoEje(GeometriaEje, largoEje)

    longitudEje = max(largoEje);
    nSegmentos = GeometriaEje.SegmentoRecto.cantidad;

    for i=1:nSegmentos
        
       x3 = [GeometriaEje.SegmentoRecto.ubicacionInicial(i) GeometriaEje.SegmentoRecto.ubicacionFinal(i)];
       y3 = [GeometriaEje.SegmentoRecto.diametro(i)/2 GeometriaEje.SegmentoRecto.diametro(i)/2];
       plot(x3,y3,'k');
       ax = gca;
       ax.DataAspectRatio = [1 0.2 1];
      % ax.PlotBoxAspectRatio = [3 3 3];
        ax.YLim = [-0.035 0.035];
        ax.XLim = [-0.05*longitudEje longitudEje*1.05];
       hold on; 
       
    end
    
    for i=1:nSegmentos-1
        
       x4 = [GeometriaEje.SegmentoRecto.ubicacionFinal(i) GeometriaEje.SegmentoRecto.ubicacionFinal(i)];
       y45 = [GeometriaEje.SegmentoRecto.diametro(i)/2 GeometriaEje.SegmentoRecto.diametro(i+1)/2];
       y4 = [0 GeometriaEje.SegmentoRecto.diametro(i+1)/2];

       plot(x4,y4,'k'); hold on;
       plot(x4,y45,'k');
       xlim([-0.05*longitudEje longitudEje*1.05]);
       hold on
       
    end
    
    for i=1:nSegmentos
        
       x3 = [GeometriaEje.SegmentoRecto.ubicacionInicial(i) GeometriaEje.SegmentoRecto.ubicacionFinal(i)];
       y3 = [-GeometriaEje.SegmentoRecto.diametro(i)/2 -GeometriaEje.SegmentoRecto.diametro(i)/2];
       plot(x3,y3,'k'); 
       xlim([-0.05*longitudEje longitudEje*1.05]);
       hold on
       
    end

    for i=1:nSegmentos-1
        
       x4 = [GeometriaEje.SegmentoRecto.ubicacionFinal(i) GeometriaEje.SegmentoRecto.ubicacionFinal(i)];
       y45 = [-GeometriaEje.SegmentoRecto.diametro(i)/2 -GeometriaEje.SegmentoRecto.diametro(i+1)/2];
       y4 = [0 -GeometriaEje.SegmentoRecto.diametro(i+1)/2];

       plot(x4,y4,'k'); hold on;
       plot(x4,y45,'k');
       xlim([-0.05*longitudEje longitudEje*1.05]);
       hold on
       
    end
        
    x5 = [GeometriaEje.SegmentoRecto.ubicacionInicial(1) GeometriaEje.SegmentoRecto.ubicacionInicial(1)];
    y5 = [GeometriaEje.SegmentoRecto.diametro(1)/2 -GeometriaEje.SegmentoRecto.diametro(1)/2];
    plot(x5, y5,'k');
    xlim([-0.05*longitudEje longitudEje*1.05]);
    
    x6 = [GeometriaEje.SegmentoRecto.ubicacionFinal(end) GeometriaEje.SegmentoRecto.ubicacionFinal(end)];
    y6 = [GeometriaEje.SegmentoRecto.diametro(end)/2 -GeometriaEje.SegmentoRecto.diametro(end)/2];
    plot(x6, y6,'k');
    xlim([-0.05*longitudEje longitudEje*1.05]);


end