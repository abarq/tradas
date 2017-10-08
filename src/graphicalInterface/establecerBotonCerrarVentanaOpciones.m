function botonCerrarVentanaOpcionesHandle = establecerBotonCerrarVentanaOpciones()

    alturaBoton =darFormatoGUIVentanaOpciones('botonCerrarVentanaOpciones', 'altura'); 
    anchoBoton = darFormatoGUIVentanaOpciones('botonCerrarVentanaOpciones', 'ancho');
    referenciaX = darFormatoGUIVentanaOpciones('botonCerrarVentanaOpciones', 'referenciaX'); 
    referenciaY = darFormatoGUIVentanaOpciones('botonCerrarVentanaOpciones', 'referenciaY');
    
    botonCerrarVentanaOpcionesHandle = uicontrol('Style', 'pushbutton','Callback', @cerrarVentanaOpciones, 'String', 'Close', 'Position', [referenciaX referenciaY anchoBoton alturaBoton]);

end

function cerrarVentanaOpciones(hObject, eventdata)

    
    data = guidata(hObject);
    set(data.datosVentanaPrincipal.ventanaHandle, 'Visible','on');
    
    close(data.ventanaOpciones);

end