function Fatiga = ejecutarAnalisis(Eje, Fatiga)

    nCasosCarga = numel(Fatiga);
    nPuntosCriticos = numel(Fatiga.CasoCarga.PuntoCritico);

    for i=1:nCasosCarga
        
        for j=1:nPuntosCriticos
        
            Fatiga.CasoCarga(i).PuntoCritico(j).resistenciaFatigaReal = determinarResistenciaFatigaReal(Eje.FactorConcentracionEsfuerzo.Escalon(j), Fatiga.Parametros, Eje, Fatiga);
            resistenciaFatigaReal =  Fatiga.CasoCarga(i).PuntoCritico(j).resistenciaFatigaReal;
            Fatiga.CasoCarga(i).PuntoCritico(j).factorSeguridad = calcularFactorDeSeguridad(resistenciaFatigaReal,Fatiga.CasoCarga(i).PuntoCritico(j), Fatiga.Parametros);
            
        end

    end

end

function resistenciaFatigaReal = determinarResistenciaFatigaReal(Escalon, Parametros, Eje, Fatiga)

    factorDimensionEje = determinarFactorDimensionEje(Escalon);
    factorAcabadoSuperficial = determinarFactorAcabadoSuperficial(Eje, Fatiga);
    resistenciaFatigaReal = Parametros.resistenciaFatiga * Parametros.FactorModificador.resultante * factorDimensionEje*factorAcabadoSuperficial;

end


function factorDimensionEje = determinarFactorDimensionEje(Escalon)

    diametro = Escalon.Dimensiones.diametroMenor;
    diametro = diametro*1000;


    if(diametro >= 2.79 && diametro <= 51)
        
        factorDimensionEje = 1.24*diametro^(-0.107);
        
    else
       
        factorDimensionEje = 1.51*diametro^(-0.157);
        
    end

end


function factorAcabadoSuperficial = determinarFactorAcabadoSuperficial(Eje, Fatiga)

    switch Fatiga.Parametros.acabadoSuperficial
        
        
        case 'Machined'
                            
                factorAcabadoSuperficial = 4.51 * (Eje.PropiedadesMaterial.esfuerzoUltimo/1000000)^-0.265;

            
        case 'Ground'
            
                factorAcabadoSuperficial = 1.58 * (Eje.PropiedadesMaterial.esfuerzoUltimo/1000000)^-0.085;

        case 'Hot-rolled'
            
                factorAcabadoSuperficial = 57.7 * (Eje.PropiedadesMaterial.esfuerzoUltimo/1000000)^-0.718;
            
            
        case 'As-forged'
            
                factorAcabadoSuperficial = 272 * (Eje.PropiedadesMaterial.esfuerzoUltimo/1000000)^-0.995;

            
    end


end

function factorDeSeguridad = calcularFactorDeSeguridad(resistenciaFatigaReal, PuntoCritico, FatigaParametros)

    switch FatigaParametros.criterioFalla
        
        case 'Goodman'
            
            relacionEsfuerzoVonMisesAlternanteResistenciaFatigaReal = PuntoCritico.esfuerzoVonMisesAlternante /resistenciaFatigaReal;
            relacionEsfuerzoVonMisesMedioResistenciaUltimaMaterial = PuntoCritico.esfuerzoVonMisesMedio / FatigaParametros.resistenciaUltima;
            factorDeSeguridad = 1/(relacionEsfuerzoVonMisesAlternanteResistenciaFatigaReal + relacionEsfuerzoVonMisesMedioResistenciaUltimaMaterial);
        
        case 'Soderberg'
            
            relacionEsfuerzoVonMisesAlternanteResistenciaFatigaReal = PuntoCritico.esfuerzoVonMisesAlternante /resistenciaFatigaReal;
            relacionEsfuerzoVonMisesMedioResistenciaFluencia = PuntoCritico.esfuerzoVonMisesMedio / FatigaParametros.resistenciaFluencia;
            factorDeSeguridad = 1/(relacionEsfuerzoVonMisesAlternanteResistenciaFatigaReal + relacionEsfuerzoVonMisesMedioResistenciaFluencia);
        
        case 'Asme'
            
            relacionEsfuerzoVonMisesAlternanteResistenciaFatigaReal = PuntoCritico.esfuerzoVonMisesAlternante /resistenciaFatigaReal;
            relacionEsfuerzoVonMisesMedioResistenciaFluencia = PuntoCritico.esfuerzoVonMisesMedio / FatigaParametros.resistenciaFluencia;
            factorDeSeguridad = sqrt(1/(relacionEsfuerzoVonMisesAlternanteResistenciaFatigaReal^2 + relacionEsfuerzoVonMisesMedioResistenciaFluencia^2));
           
    end
end