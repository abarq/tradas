function OpcionesAltoCiclaje = establecerParametrosAnalisisFatiga(Parametros, PropiedadesMaterial)

    OpcionesAltoCiclaje = Parametros.FatigaAltoCiclaje;

    OpcionesAltoCiclaje.criterioFalla = Parametros.FatigaAltoCiclaje.criterioFalla;
    
    OpcionesAltoCiclaje.FactorModificador.temperatura = Parametros.FatigaAltoCiclaje.FactorModificador.temperatura;
    
    OpcionesAltoCiclaje.FactorModificador.confiabilidad = Parametros.FatigaAltoCiclaje.FactorModificador.Confiabilidad;
    OpcionesAltoCiclaje.FactorModificador.efectosVarios =  Parametros.FatigaAltoCiclaje.FactorModificador.EfectosVarios;
    OpcionesAltoCiclaje.FactorModificador.resultante = OpcionesAltoCiclaje.FactorModificador.temperatura * ...
        OpcionesAltoCiclaje.FactorModificador.confiabilidad * OpcionesAltoCiclaje.FactorModificador.efectosVarios;
    
    OpcionesAltoCiclaje.resistenciaFatiga = PropiedadesMaterial.esfuerzoUltimo/2;
    OpcionesAltoCiclaje.resistenciaUltima = PropiedadesMaterial.esfuerzoUltimo;
    OpcionesAltoCiclaje.resistenciaFluencia = PropiedadesMaterial.esfuerzoFluencia;
end
