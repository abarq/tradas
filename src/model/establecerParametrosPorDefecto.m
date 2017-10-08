function Parametros = establecerParametrosPorDefecto()

    ubicacionCarpetaTrabajo = pwd;
    ubicacionRelativa = '\src\defaultParameters.txt';
    ubicacionRelativaResultados = '\results';
    ubicacionFicheroParametrosDefecto = [ubicacionCarpetaTrabajo ubicacionRelativa];
    
    id = abrirArchivoTexto(ubicacionFicheroParametrosDefecto);
    DatosSegmentados = textscan(id, '%q %s','HeaderLines',1);
    fclose(id);
    Materiales = obtenerMaterialesDeEje();
    
    Parametros.nombreDefectoProyecto = DatosSegmentados{2}{1};
    Parametros.ubicacionResultados = [ubicacionCarpetaTrabajo ubicacionRelativaResultados];
    Parametros.nDivisiones = str2double(DatosSegmentados{2}{2}); 
    Parametros.Material.tipo = 'acero';
    Parametros.Material.esfuerzoFluencia = double(Materiales.esfuerzoFluencia(1)*1e6);
    Parametros.Material.esfuerzoUltimo = double(Materiales.esfuerzoUltimo(1)*1e6);
    Parametros.Material.value = 1;
    Parametros.Material.moduloElasticidad = 210e9;
    Parametros.Material.coeficientePoisson = 0.3;
    
    Parametros.FatigaAltoCiclaje.criterioFalla = DatosSegmentados{2}{3};
    Parametros.FatigaAltoCiclaje.criterioFallaValue = 1;
    Parametros.FatigaAltoCiclaje.acabadoSuperficial = DatosSegmentados{2}{4};
    Parametros.FatigaAltoCiclaje.acabadoSuperficialValue = 1;
    Parametros.FatigaAltoCiclaje.tipoCarga = DatosSegmentados{2}{5};
    Parametros.FatigaAltoCiclaje.tipoCargaValue = 1;
    Parametros.FatigaAltoCiclaje.FactorModificador.temperatura = str2double(DatosSegmentados{2}{6});
    Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue =1;
    Parametros.FatigaAltoCiclaje.FactorModificador.Confiabilidad = str2double(DatosSegmentados{2}{7});
    Parametros.FatigaAltoCiclaje.FactorModificador.ConfiabilidadValue = 1;
    Parametros.FatigaAltoCiclaje.FactorModificador.EfectosVarios = str2double(DatosSegmentados{2}{8});
end