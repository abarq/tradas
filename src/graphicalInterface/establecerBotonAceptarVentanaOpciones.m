function botonAceptarVentanaOpcionesHandle = establecerBotonAceptarVentanaOpciones()


    alturaBoton =darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'altura'); 
    anchoBoton = darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'ancho');
    referenciaX = darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'referenciaX'); 
    referenciaY = darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'referenciaY');
    
    botonAceptarVentanaOpcionesHandle = uicontrol('Style', 'pushbutton','Callback', @botonAceptarVentanaOpciones, 'String', 'Accept', 'Position', [referenciaX referenciaY anchoBoton alturaBoton]);

    
end


function botonAceptarVentanaOpciones(hObject, eventdata)

    data = guidata(hObject);
    windowHandle =data.ventanaOpciones;
    nombreProyecto = data.cajaTextoEditableNombreProyecto;
    nombreProyecto = get(nombreProyecto, 'String');
    a = data.Manejador.efectosVarios;
    f = get(a, 'String');
    f = str2double(f);
    
    if f >= 0.1 && f <=1
        
        if isvarname(nombreProyecto)
         
            data.Parametros = data.ParametrosActuales.Parametros;
            set(data.datosVentanaPrincipal.ventanaHandle, 'Visible','on');
            guidata(hObject, data);

            close(data.ventanaOpciones);
            guidata(data.Figura, data);
            
        else 
           
             menssage = 'The name of the project is invalid';
             mostrarMensajeAdvertencia(windowHandle,menssage);
            
        end
        
    else
        
        menssage = 'The miscellaneous effect factor must take values greater than 0.1 and less or equal than 1.';
        mostrarMensajeAdvertencia(windowHandle,menssage);
        
    end
end