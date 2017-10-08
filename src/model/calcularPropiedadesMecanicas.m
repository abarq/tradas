function Eje = calcularPropiedadesMecanicas(Eje)

    Eje.Geometria.SegmentoRecto = determinarTensorSegundoMomentoAreaSegmento(Eje.Geometria.SegmentoRecto);
    Eje.Geometria.SegmentoRecto = determinarTensorInerciaSegmento(Eje.Geometria.SegmentoRecto);
    
end

function SegmentoRecto = determinarTensorSegundoMomentoAreaSegmento(SegmentoRecto)


    for i=1:SegmentoRecto.cantidad
        
        Ixx = pi()/4*(SegmentoRecto.diametro(i)/2)^4;
        Iyy = pi()/4*(SegmentoRecto.diametro(i)/2)^4;
        Izz = Ixx + Iyy;
        SegmentoRecto.tensorSegundoMomentoArea(:,:,i) = [Ixx 0 0 ; 0 Iyy 0; 0 0 Izz];
        
    end

end


function SegmentoRecto = determinarTensorInerciaSegmento(SegmentoRecto)


    for i=1:SegmentoRecto.cantidad
        
        Ixx = pi()/4*(SegmentoRecto.diametro(i)/2)^4;
        Iyy = pi()/4*(SegmentoRecto.diametro(i)/2)^4;
        Izz = Ixx + Iyy;
        SegmentoRecto.tensorSegundoMomentoArea(:,:,i)  = [Ixx 0 0 ; 0 Iyy 0; 0 0 Izz];
        
    end

end