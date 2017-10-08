function largoEje = determinarLargoEje(Geometria)

    largoEje = 0;
    
    for i=1:Geometria.SegmentoRecto.cantidad;
       
        largoEje = largoEje + Geometria.SegmentoRecto.longitud(i);
                    
    end
    
end