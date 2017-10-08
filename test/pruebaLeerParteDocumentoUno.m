function unaParte = pruebaLeerParteDocumentoUno(Archivo)

    fileID = fopen(Archivo.direccion, 'r');
    unaParte= textscan(fileID, '%f %f', 'HeaderLines', 3);    
    
end