function ArchivoTexto = solicitarArchivoTextoAUsuario()

    [nombreArchivoTexto, ruta, indiceCancel] = uigetfile([pwd '\examples\*.txt'], 'Seleccione un archivo texto');
    direccionArchivoTexto = strcat(ruta,nombreArchivoTexto);
           
    ArchivoTexto.direccion = direccionArchivoTexto;
    ArchivoTexto.indiceCancel = indiceCancel;
    
end


