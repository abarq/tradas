function kf = obtenerFatigaConcentracionEsfuerzo(factorConcentracionEsfuerzo, sensibilidadMuesca)
    
    kf = 1 + sensibilidadMuesca*(factorConcentracionEsfuerzo-1);

end

