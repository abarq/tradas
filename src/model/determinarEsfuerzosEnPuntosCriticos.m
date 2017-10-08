function Fatiga = determinarEsfuerzosEnPuntosCriticos(Modelo, Eje)

    nEscenariosDeCarga = numel(Modelo);
    nPuntosCriticos = Eje.FactorConcentracionEsfuerzo.cantidad;
    
    for i=1:nEscenariosDeCarga
                
        for j=1:nPuntosCriticos
        
            esfuerzoFlexion = calcularEsfuerzoFlexion(Modelo(i), Eje.Geometria.Escalon(j));
            esfuerzoTorsion = calcularEsfuerzoTorsion(Modelo(i), Eje.Geometria.Escalon(j));
            SensibilidadAMuesca.normal = calcularSensibilidadMuesca(Eje.PropiedadesMaterial.esfuerzoUltimo, Eje.Geometria.Escalon(j).radioFilete);
            esfuerzoUltimoSensibilidadMuescaCortante = Eje.PropiedadesMaterial.esfuerzoUltimo + 137.8;
            SensibilidadAMuesca.cortante = calcularSensibilidadMuesca(esfuerzoUltimoSensibilidadMuescaCortante, Eje.Geometria.Escalon(j).radioFilete);
            FactorConcentracionEsfuerzoFatiga.normal = obtenerFatigaConcentracionEsfuerzo(Eje.FactorConcentracionEsfuerzo.Escalon(j).flexion, SensibilidadAMuesca.normal);
            FactorConcentracionEsfuerzoFatiga.cortante = obtenerFatigaConcentracionEsfuerzo(Eje.FactorConcentracionEsfuerzo.Escalon(j).torsion, SensibilidadAMuesca.cortante); 
            Fatiga.CasoCarga(i).PuntoCritico(j).esfuerzoVonMisesAlternante = FactorConcentracionEsfuerzoFatiga.normal * esfuerzoFlexion;
            Fatiga.CasoCarga(i).PuntoCritico(j).esfuerzoVonMisesMedio = sqrt((abs(3*FactorConcentracionEsfuerzoFatiga.cortante * esfuerzoTorsion)^2));

        end
                
    end
        
end

function esfuerzoFlexion = calcularEsfuerzoFlexion(Modelo, Escalon)
    
    momentoFlector = Modelo.MomentosFlectores.resultante;
    ejeDividido = Modelo.ejeDividido;
    indice= encontrarValorEnArreglo(ejeDividido, Escalon.ubicacion);
    momentoFlectorEnUbicacion = momentoFlector(indice);
    momentoInercia = pi()/4*(Escalon.diametroMenor/2)^4;
    esfuerzoFlexion = (momentoFlectorEnUbicacion * Escalon.diametroMenor/2) / momentoInercia;
        
end

function esfuerzoTorsion = calcularEsfuerzoTorsion(Modelo, Escalon)
     
    momentoTorsor = Modelo.MomentosTorsores;
    ejeDividido = Modelo.ejeDividido;
    indice= encontrarValorEnArreglo(ejeDividido, Escalon.ubicacion);
    momentoTorsorEnUbicacion = momentoTorsor(indice);
    momentoPolarInercia = pi()/2*(Escalon.diametroMenor/2)^4;
    esfuerzoTorsion = (momentoTorsorEnUbicacion * Escalon.diametroMenor/2) / momentoPolarInercia;
        
end
