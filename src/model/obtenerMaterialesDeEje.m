function MaterialesDeEje = obtenerMaterialesDeEje()

    ubicacionCarpetaTrabajo = pwd;
    ubicacionRelativa = '\Data\Materials.txt';
    ubicacionFicheroPropiedadesMaterial = [ubicacionCarpetaTrabajo ubicacionRelativa];
    id = abrirArchivoTexto(ubicacionFicheroPropiedadesMaterial);
    
    DatosSegmentos = textscan(id, '%q %d %d','HeaderLines', 1);
    nMateriales = numel(DatosSegmentos{1});
    fclose(id);
 
    for i=1:nMateriales
        
        tipoMaterial = DatosSegmentos{1}(i);
        resistenciaUltima = num2str(DatosSegmentos{2}(i));
        resistenciaFluencia = num2str(DatosSegmentos{3}(i));
        string = strcat(tipoMaterial,{' '});

        MaterialesDeEje.descripcion(i) = string;
        MaterialesDeEje.esfuerzoUltimo(i) = DatosSegmentos{2}(i);
        MaterialesDeEje.esfuerzoFluencia(i) = DatosSegmentos{3}(i);
        
    end
    
    MaterialesDeEje.value = 1;
end