function cargasExternasValidas = sonDatosCargasExternasValidas(CargasExternas, largoEje)

    nCasosCarga = numel(CargasExternas);
    nCasosCargasExternasValidas = 0;
    
    for i=1:nCasosCarga
        
        CargasExternas(i).informacionValida = determinarInformacionValida(CargasExternas(i), largoEje);
        
        if CargasExternas(i).informacionValida == 1
            
            nCasosCargasExternasValidas = nCasosCargasExternasValidas + 1; 
            
        end
        
    end
    
    cargasExternasValidas = (nCasosCargasExternasValidas == nCasosCarga);
    
    
end


function informacionValida = determinarInformacionValida(CargasExternas, largoEje)

    fuerzasValidas = determinarValidezDatosFuerzas(CargasExternas.cargasExternasTransmision, largoEje);
    momentosValidos = determinarValidezDatosMomentos(CargasExternas.momentosPuntuales, largoEje);
    informacionValida = fuerzasValidas && momentosValidos;

end

function fuerzasValidas = determinarValidezDatosFuerzas(cargasTransmision, largoEje)

    fuerzasValidasPlanoXY = sonFuerzasValidas(cargasTransmision.PlanoXY, largoEje);
    fuerzasValidasPlanoYZ = sonFuerzasValidas(cargasTransmision.PlanoYZ, largoEje);
    fuerzasValidas = fuerzasValidasPlanoXY && fuerzasValidasPlanoYZ;

end

function fuerzasEnPlanoValidas = sonFuerzasValidas(cargasEnPlano, largoEje)

    nFuerzasPlano = numel(cargasEnPlano.ubicacion);
    nFuerzasDentroAmbitoEje = 0;
    
    for i=1:nFuerzasPlano
        
        if cargasEnPlano.ubicacion(i) <= largoEje && cargasEnPlano.ubicacion(i) > 0 
           
            nFuerzasDentroAmbitoEje = nFuerzasDentroAmbitoEje + 1;
            
        end
                
    end
    
    fuerzasEnPlanoValidas = (nFuerzasDentroAmbitoEje == nFuerzasPlano);
    
end

function momentosValidos = determinarValidezDatosMomentos(momentosPuntuales, largoEje)

    momentosValidosEjeX = sonMomentosValidos(momentosPuntuales.EjeX, largoEje);
    momentosValidosEjeY = sonMomentosValidos(momentosPuntuales.EjeY, largoEje);
    momentosValidosEjeZ = sonMomentosValidos(momentosPuntuales.EjeZ, largoEje);
    momentosValidos = momentosValidosEjeX && momentosValidosEjeY && momentosValidosEjeZ;

end


function momentosEnPlanoValidos = sonMomentosValidos(momentosEnEje, largoEje)

    nMomentosEnEje = numel(momentosEnEje.ubicacion);
    nMomentosEnAmbitoEje = 0;
    
    for i=1:nMomentosEnEje
        
        if momentosEnEje.ubicacion(i) <= largoEje
           
            nMomentosEnAmbitoEje = nMomentosEnAmbitoEje + 1;
            
        end
                
    end
    
    momentosEnPlanoValidos = (nMomentosEnAmbitoEje == nMomentosEnEje);
    
end