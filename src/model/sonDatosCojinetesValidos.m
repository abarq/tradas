function datosValidos = sonDatosCojinetesValidos(Cojinetes, largoEje)
    
    nCojinetesTotal = numel(Cojinetes.PlanoXY.ubicacion);
    nCojinetesDentroAmbitoEje = 0;
    
    esNumeroCorrectoCojinetes = (nCojinetesTotal == 2);
    
    for i=1:nCojinetesTotal
        
        if Cojinetes.PlanoXY.ubicacion(i) <= largoEje && Cojinetes.PlanoXY.ubicacion(i) > 0
            
            nCojinetesDentroAmbitoEje = nCojinetesDentroAmbitoEje + 1;
            
        end
        
    end
    
    estanLosCojinetesDentroAmbitoEje = (nCojinetesDentroAmbitoEje == nCojinetesTotal);
    
    datosValidos = esNumeroCorrectoCojinetes && estanLosCojinetesDentroAmbitoEje;
        
end