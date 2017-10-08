function GeometriaEje = pruebaObtenerGeometriaEje()

    Archivo = solicitarArchivoTexto();
    fileID = fopen(Archivo.direccion, 'r');
    C= textscan(fileID, '%f %f', 'HeaderLines', 3);
    
    GeometriaEje = asignarGeometria(C);
    

end

function Geometria = asignarGeometria(Datos)

    nSegmentos = numel(Datos{1});
    
    for i=1:nSegmentos
        
       Geometria(i).longitud = Datos{1}(i); 
       Geometria(i).diametro = Datos{2}(i); 
                
    end
    
end