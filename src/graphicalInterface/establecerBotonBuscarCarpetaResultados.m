function botonBuscarCarpetaHandle = establecerBotonBuscarCarpetaResultados()

    alturaBoton =darFormatoGUIVentanaOpciones('botonAbrirDirectorio', 'altura'); 
    anchoBoton = darFormatoGUIVentanaOpciones('botonAbrirDirectorio', 'ancho');
    referenciaX = darFormatoGUIVentanaOpciones('botonAbrirDirectorio', 'referenciaX'); 
    referenciaY = darFormatoGUIVentanaOpciones('botonAbrirDirectorio', 'referenciaY');
    
    botonBuscarCarpetaHandle = uicontrol('Style', 'pushbutton','Callback', @botonResultados, 'String', 'Open', 'Position', [referenciaX referenciaY anchoBoton alturaBoton]);

end

function botonResultados(hObject,eventdata)

    nombreDirectorio = uigetdir('C:\', 'Select folder to save results');
    data = guidata(hObject);
    
    if nombreDirectorio ~= 0
        
        data.ParametrosActuales.Parametros.ubicacionResultados = nombreDirectorio; 
        set(data.cajaTextoEditable, 'String', nombreDirectorio);
        guidata(hObject, data);
       
    end

end
