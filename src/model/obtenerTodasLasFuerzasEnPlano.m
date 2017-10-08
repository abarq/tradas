function FuerzasPlanoTotales = obtenerTodasLasFuerzasEnPlano(CargasPlanoPuntuales, CargasPlanoCojinetes)

    FuerzasPlanoTotales.magnitud = [CargasPlanoCojinetes.magnitud(1) CargasPlanoPuntuales.magnitud(:)' CargasPlanoCojinetes.magnitud(2)];
	FuerzasPlanoTotales.ubicacion = [CargasPlanoCojinetes.ubicacion(1) CargasPlanoPuntuales.ubicacion(:)' CargasPlanoCojinetes.ubicacion(2)];

    FuerzasPlanoTotales = ordenarFuerzasPorUbicacion(FuerzasPlanoTotales);
	
end

function FuerzasPlanoTotales = ordenarFuerzasPorUbicacion(FuerzasPlanoTotales)

    numeroTotalFuerzas = numel(FuerzasPlanoTotales.magnitud);
    
    for i=1:numeroTotalFuerzas-1
       
        for j=i+1:numeroTotalFuerzas
            
           if  FuerzasPlanoTotales.ubicacion(j) < FuerzasPlanoTotales.ubicacion(i)
            
              variableTemporal =  FuerzasPlanoTotales.magnitud(i);
              FuerzasPlanoTotales.magnitud(i) = FuerzasPlanoTotales.magnitud(j);
              FuerzasPlanoTotales.magnitud(j) = variableTemporal;
              
              variableTemporal =  FuerzasPlanoTotales.ubicacion(i);
              FuerzasPlanoTotales.ubicacion(i) = FuerzasPlanoTotales.ubicacion(j);
              FuerzasPlanoTotales.ubicacion(j) = variableTemporal;
               
           end
            
        end
        
        
    end

end
