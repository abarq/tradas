function Eje = complementarInformacionEje(Eje)

    Eje.Geometria = obtenerUbicacionDeSegmentos(Eje.Geometria);
    Eje.largoEje = determinarLargoEje(Eje.Geometria.SegmentoRecto); 
    Eje.Geometria.Escalon = establecerEscalones(Eje.Geometria);
    
       
end

function largoEje = determinarLargoEje(SegmentoRecto)

    largoEje = 0;
    
    for i=1:SegmentoRecto.cantidad;
       
        largoEje = largoEje + SegmentoRecto.longitud(i);
                    
    end
    
end

function Geometria = obtenerUbicacionDeSegmentos(Geometria)

    largoDos = 0;
    nSegmentos = Geometria.SegmentoRecto.cantidad;
    
    for i=1:nSegmentos

        largoDos = largoDos + Geometria.SegmentoRecto.longitud(i);
        largoUno = largoDos - Geometria.SegmentoRecto.longitud(i);
        Geometria.SegmentoRecto.ubicacionInicial(i) = largoUno;
        Geometria.SegmentoRecto.ubicacionFinal(i) = largoDos;

    end

end


function Escalon = establecerEscalones(Geometria)

     SegmentoRecto = Geometria.SegmentoRecto;
     nSegmentosRectos = SegmentoRecto.cantidad;
     
     for i=1:nSegmentosRectos-1
     
        if SegmentoRecto.diametro(i) > SegmentoRecto.diametro(i+1)

            Escalon(i).diametroMayor = SegmentoRecto.diametro(i);
            Escalon(i).diametroMenor = SegmentoRecto.diametro(i+1);
            Escalon(i).ubicacion = SegmentoRecto.ubicacionFinal(i);
        else

            Escalon(i).diametroMayor = SegmentoRecto.diametro(i+1);
            Escalon(i).diametroMenor = SegmentoRecto.diametro(i);
            Escalon(i).ubicacion = SegmentoRecto.ubicacionFinal(i);

        end
        
        Escalon(i).radioFilete = Geometria.RadiosFiletes(i);
     end

end