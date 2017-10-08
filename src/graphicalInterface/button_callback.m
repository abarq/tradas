function button_callback(hObject,eventdata)
	
    [nombreArchivoTexto, ruta, indiceCancel] = uigetfile('*.txt', 'Seleccione un archivo texto');
    direccionArchivoTexto = strcat(ruta,nombreArchivoTexto);
    if indiceCancel == 1
        data = guidata(hObject);
        data.direccion = direccionArchivoTexto;
        display('Direccion guardada (Y)');
        guidata(hObject, data);
        
    else
        display('Apreto Cancel');
    end
end