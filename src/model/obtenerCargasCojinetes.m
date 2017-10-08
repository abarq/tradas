function CargasPlanoCojinetes = obtenerCargasCojinetes(CargasPlanoPuntuales, momentosPuntuales,CargasPlanoCojinetes)

    CargasPlanoCojinetes.magnitud(2) = obtenerCargaCojineteDerecho(CargasPlanoPuntuales, momentosPuntuales,CargasPlanoCojinetes);
    CargasPlanoCojinetes.magnitud(1) = obtenerCargaCojineteIzquierdo(CargasPlanoPuntuales, CargasPlanoCojinetes);
%     CargasPlanoCojinetes.magnitud(2)
%     CargasPlanoCojinetes.magnitud(1)
end

function magnitudCarga = obtenerCargaCojineteDerecho(CargasPlanoPuntuales, momentosPuntuales, CargasPlanoCojinetes)

    cantidadCargas = numel(CargasPlanoPuntuales.magnitud);
        
    momentosDeCargasTransmision = 0;
    
    for i = 1 : cantidadCargas

        if (CargasPlanoPuntuales.ubicacion(i) < CargasPlanoCojinetes.ubicacion(1))

            momentosDeCargasTransmision = momentosDeCargasTransmision + CargasPlanoPuntuales.magnitud(i) * (CargasPlanoCojinetes.ubicacion(1) - CargasPlanoPuntuales.ubicacion(i));

        else if (CargasPlanoPuntuales.ubicacion(i) > CargasPlanoCojinetes.ubicacion(1))

            momentosDeCargasTransmision = momentosDeCargasTransmision - CargasPlanoPuntuales.magnitud(i) * (CargasPlanoPuntuales.ubicacion(i) - CargasPlanoCojinetes.ubicacion(1));

             end

         end
        
    end
    
    nMomentosPuntuales = numel(momentosPuntuales.magnitud);
    
    for i=1:nMomentosPuntuales
        
        momentosDeCargasTransmision = momentosDeCargasTransmision + momentosPuntuales.magnitud(i);
        
    end
    
    magnitudCarga = momentosDeCargasTransmision/(CargasPlanoCojinetes.ubicacion(2) - CargasPlanoCojinetes.ubicacion(1));
    
end

function magnitudCarga = obtenerCargaCojineteIzquierdo(CargasPlanoPuntuales, CargasPlanoCojinetes)

    cantidadCargas = numel(CargasPlanoPuntuales.magnitud);
    magnitudCarga = 0;
    
    for i=1:cantidadCargas
        
        magnitudCarga = magnitudCarga + CargasPlanoPuntuales.magnitud(i);
       
    end

     magnitudCarga = -magnitudCarga - CargasPlanoCojinetes.magnitud(2);
     
end
