function  obtenerPerfilEje(GeometriaEje, largoEje, fuerzasCortantes, momentosFlectores, deflexion, pendiente)

    longitudEje = max(largoEje);
    nSegmentos = GeometriaEje.SegmentoRecto.cantidad;
   
    figure('Position', [200, 100, 400, 600]);
    subplot(4,1,1);
    for i=1:nSegmentos
        
       x3 = [GeometriaEje.SegmentoRecto.ubicacionInicial(i) GeometriaEje.SegmentoRecto.ubicacionFinal(i)];
       y3 = [GeometriaEje.SegmentoRecto.diametro(i)/2 GeometriaEje.SegmentoRecto.diametro(i)/2];
       plot(x3,y3,'k');
       ax = gca;
       ax.DataAspectRatio = [1 0.3 1];
       ax.PlotBoxAspectRatio = [3 3 3];
        ax.YLim = [-0.03 0.03];
        ax.XLim = [-0.05*longitudEje longitudEje*1.1];
       hold on; 
       
    end
    
    for i=1:nSegmentos-1
        
       x4 = [GeometriaEje.SegmentoRecto.ubicacionFinal(i) GeometriaEje.SegmentoRecto.ubicacionFinal(i)];
       y4 = [GeometriaEje.SegmentoRecto.diametro(i)/2 GeometriaEje.SegmentoRecto.diametro(i+1)/2];
       plot(x4,y4,'k'); 
       xlim([-0.05*longitudEje longitudEje*1.1]);
       hold on
       
    end
    
    for i=1:nSegmentos
        
       x3 = [GeometriaEje.SegmentoRecto.ubicacionInicial(i) GeometriaEje.SegmentoRecto.ubicacionFinal(i)];
       y3 = [-GeometriaEje.SegmentoRecto.diametro(i)/2 -GeometriaEje.SegmentoRecto.diametro(i)/2];
       plot(x3,y3,'k'); 
       xlim([-0.05*longitudEje longitudEje*1.1]);
       hold on
       
    end

    for i=1:nSegmentos-1
        
       x4 = [GeometriaEje.SegmentoRecto.ubicacionFinal(i) GeometriaEje.SegmentoRecto.ubicacionFinal(i)];
       y4 = [-GeometriaEje.SegmentoRecto.diametro(i)/2 -GeometriaEje.SegmentoRecto.diametro(i+1)/2];
       plot(x4,y4,'k'); 
       xlim([-0.05*longitudEje longitudEje*1.1]);
       hold on
       
    end
        
    x5 = [GeometriaEje.SegmentoRecto.ubicacionInicial(1) GeometriaEje.SegmentoRecto.ubicacionInicial(1)];
    y5 = [GeometriaEje.SegmentoRecto.diametro(1)/2 -GeometriaEje.SegmentoRecto.diametro(1)/2];
    plot(x5, y5,'k');
    xlim([-0.05*longitudEje longitudEje*1.1]);
    
    x6 = [GeometriaEje.SegmentoRecto.ubicacionFinal(end) GeometriaEje.SegmentoRecto.ubicacionFinal(end)];
    y6 = [GeometriaEje.SegmentoRecto.diametro(end)/2 -GeometriaEje.SegmentoRecto.diametro(end)/2];
    plot(x6, y6,'k');
    xlim([-0.05*longitudEje longitudEje*1.1]);
    
%     subplot(5,1,2)
%     plot(largoEje, fuerzasCortantes);
%     %xlabel('Largo eje');
%     ylabel('Fuerzas cortantes (N)');
    
    subplot(4,1,2)
    plot(largoEje, momentosFlectores);
    xlim([-0.05*longitudEje longitudEje*1.1]);
    %xlabel('Largo eje');
    ylabel('Momento flector (N m)');
    grid on;
    
    subplot(4,1,3)
    plot(largoEje, pendiente);
    xlim([-0.05*longitudEje longitudEje*1.1]);
    %xlabel('Largo eje');
    ylabel('Pendiente (rad)');
    grid on;
    
    subplot(4,1,4)
    plot(largoEje, deflexion);
    xlim([-0.05*longitudEje longitudEje*1.1]);
    xlabel('Largo eje');
    ylabel('Deflexion (m)');
    grid on;
    
end 