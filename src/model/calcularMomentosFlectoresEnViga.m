function momentosFlectores = calcularMomentosFlectoresEnViga(CargasPuntualesExternas, MomentosPuntuales , vigaDiscretizada)

    momentosFlectores = zeros(1,numel(vigaDiscretizada));
    nCargasExternas = numel(CargasPuntualesExternas.magnitud);
    
    for i=1:nCargasExternas
    
        momentosFlectores = momentosFlectores + (vigaDiscretizada > CargasPuntualesExternas.ubicacion(i)) *CargasPuntualesExternas.magnitud(i).*(vigaDiscretizada-CargasPuntualesExternas.ubicacion(i));

    end
    
    
    nMomentosPuntuales = numel(MomentosPuntuales.magnitud);
    
    for i=1:nMomentosPuntuales 
        
        momentosFlectores = momentosFlectores + (vigaDiscretizada > MomentosPuntuales.ubicacion(i)) * MomentosPuntuales.magnitud(i);
                
    end
    
end