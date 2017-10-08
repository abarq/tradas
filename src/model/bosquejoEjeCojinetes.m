function bosquejoEjeCojinetes(Transmision,ejeDividido)

        subplot(3,1,1);
        generarBosquejoEje(Transmision.Eje.Geometria, ejeDividido);
        hold on;
        x1 = Transmision.Cojinetes.PlanoXY.ubicacion(1);
        indice = encontrarValorEnArreglo(ejeDividido, x1);
        diametro = encontrarDiametro(ejeDividido(indice), Transmision.Eje.Geometria);
        y1 = diametro/2 + diametro*0.2;
        
        plot(x1,y1, 'ko');
        hold on;
        plot(x1, -y1, 'ko');
        hold on;
        x2 = Transmision.Cojinetes.PlanoXY.ubicacion(2);
        diametro = encontrarDiametro(x2, Transmision.Eje.Geometria);
        y2 = diametro/2 + diametro*0.2;
        plot(x2,y2, 'ko');
        hold on;
        plot(x2, -y2, 'ko');  
        title('Bosquejo del eje');

end

function diametro = encontrarDiametro(distanciaEje, Geometria)

    nSegmentos = Geometria.SegmentoRecto.cantidad;
    valorCentinela = 1; 
    
    for i=1:nSegmentos
        
        if distanciaEje <= Geometria.SegmentoRecto.ubicacionFinal(i) && distanciaEje > Geometria.SegmentoRecto.ubicacionInicial(i) && valorCentinela == 1
            
           diametro = Geometria.SegmentoRecto.diametro(i); 
           valorCentinela = 0; 
            
        end
            
    end
    
end
