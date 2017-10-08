function factorModificacionTemperatura = determinarFactorModificadorPorTemperatura(temperaturaCelsius)

    temperaturaFarenheit = convertirGradosCelciusAFarenheit(temperaturaCelsius);
    
    factorModificacionTemperatura = 0.975 + 0.432 * 1e-3 *temperaturaFarenheit - 0.115 * 1e-5 * temperaturaFarenheit^2 + 0.104* 1e-8 * temperaturaFarenheit^3 - 0.595 * 1e-12 * temperaturaFarenheit^4;
    
end


function temperaturaFarenheit = convertirGradosCelciusAFarenheit(temperaturaCelsius)

    temperaturaFarenheit = 9/5*temperaturaCelsius + 32;
end