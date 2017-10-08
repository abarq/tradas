function SegmentoRecto = unirSegmentosRectosSeguidosIdenticos(SegmentoRecto)

    nSegmentoRecto = numel(SegmentoRecto.longitud());
    
    nCantidadSegmentos = nSegmentoRecto -1;
    n=1;
    while n <= nCantidadSegmentos
        
       if SegmentoRecto.diametro(n) == SegmentoRecto.diametro(n+1)
           
          nuevoLargo = SegmentoRecto.longitud(n) + SegmentoRecto.longitud(n+1);
          SegmentoRecto.longitud(n) = nuevoLargo;
          SegmentoRecto.longitud(n+1) = [];
          SegmentoRecto.diametro(n+1) = [];
          nCantidadSegmentos =  nCantidadSegmentos-1;
                    
       else
           
           n = n+1;
           
       end
                
    end
    
end
