function magnitud = convertirUnidades(magnitud, unidadesAConvertir)

    switch unidadesAConvertir

        case 'MPaToKpsi'

            magnitud = magnitud/6.89;

        case 'mmToPulg'

            magnitud = magnitud/25.4;
            
        
    end


end

