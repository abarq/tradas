function coeficienteSensibilidadMuesca = calcularSensibilidadMuesca(resistenciaUltimaMaterial, radioMuesca)

    resistenciaUltimaMaterial = resistenciaUltimaMaterial/1e6;
    radioMuesca = radioMuesca*1000;
    constanteNeuber = calcularConstanteNeuber(resistenciaUltimaMaterial);
    radioMuesca = convertirUnidades(radioMuesca, 'mmToPulg');

    coeficienteSensibilidadMuesca = 1/(1 + (constanteNeuber/sqrt(radioMuesca)));

end

function constanteNeuber = calcularConstanteNeuber(resistenciaUltimaMaterial)

    resistenciaUltimaMaterial = convertirUnidades(resistenciaUltimaMaterial, 'MPaToKpsi');
    constanteNeuber = 0.245799-0.307794*10^(-2) * resistenciaUltimaMaterial+...
        0.150874*10^(-4)*resistenciaUltimaMaterial^2 - 0.266978*10^(-7)*resistenciaUltimaMaterial^3;
    
end
