function textoEditableUbicacionProyectoHandle = establecerTextoEditableUbicacionProyecto(datosVentanaPrincipal)

    alturaTexto =darFormatoGUIVentanaOpciones('cajaUbicacionProyecto', 'altura'); 
    anchoTexto = darFormatoGUIVentanaOpciones('cajaUbicacionProyecto', 'ancho');
    referenciaX = darFormatoGUIVentanaOpciones('cajaUbicacionProyecto', 'referenciaX'); 
    referenciaY = darFormatoGUIVentanaOpciones('cajaUbicacionProyecto', 'referenciaY');
    
    textoEditableUbicacionProyectoHandle = uicontrol('Style', 'edit', 'Callback', @cajaTextoUbicacionProyecto, 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    a = datosVentanaPrincipal.ParametrosActuales.Parametros.ubicacionResultados;
    set(textoEditableUbicacionProyectoHandle, 'String', a);
    set(textoEditableUbicacionProyectoHandle, 'HorizontalAlignment', 'left');
    set(textoEditableUbicacionProyectoHandle, 'enable', 'off');


end


function cajaTextoUbicacionProyecto(hObject, eventdata)

    data = guidata(hObject);
    
    str = get(hObject, 'String');
        
    data.ParametrosActuales.Parametros.ubicacionResultados = str; 
    
    guidata(hObject,data);

end