function nuevoArchivoTextoCompactado = compactarArchivoTexto(direccion)

    filecontent = fileread(direccion);
    newcontent = regexprep(filecontent, {'\s*\r', '\n\n+', '\n'}, {'', '\n', '\r\n'});
    fid = fopen('archivoCompactadoTemporal.txt', 'w');
    fwrite(fid, newcontent);
    fclose(fid);
    nuevoArchivoTextoCompactado = 'archivoCompactadoTemporal.txt';
    
end