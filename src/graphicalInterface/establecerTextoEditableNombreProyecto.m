function textoEditableNombreProyectoHandle = establecerTextoEditableNombreProyecto(data)

    alturaCajaTexto = darFormatoGUIVentanaOpciones('cajaTextoNombreProyecto', 'altura');
    anchoCajaTexto = darFormatoGUIVentanaOpciones('cajaTextoNombreProyecto', 'ancho');

    referenciaX = darFormatoGUIVentanaOpciones('cajaTextoNombreProyecto','referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('cajaTextoNombreProyecto','referenciaY');
    textoEditableNombreProyectoHandle = uicontrol('Style', 'edit', 'Callback', @cajaTextoNombreProyecto, 'Position', [referenciaX referenciaY anchoCajaTexto alturaCajaTexto]);
    set(textoEditableNombreProyectoHandle, 'String', data.ParametrosActuales.Parametros.nombreDefectoProyecto);
    set(textoEditableNombreProyectoHandle, 'HorizontalAlignment', 'left');

end


function cajaTextoNombreProyecto(hObject, eventdata)

    data = guidata(hObject);
    
    str = get(hObject, 'String');
    
    
    data.ParametrosActuales.Parametros.nombreDefectoProyecto = str; 
    
    guidata(hObject,data);

end