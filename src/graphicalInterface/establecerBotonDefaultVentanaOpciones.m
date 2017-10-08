function botonAceptarVentanaOpcionesHandle = establecerBotonDefaultVentanaOpciones()


    alturaBoton =darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'altura'); 
    anchoBoton = darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'ancho');
    referenciaX = darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'referenciaX'); 
    referenciaY = darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'referenciaY');
    
    botonAceptarVentanaOpcionesHandle = uicontrol('Style', 'pushbutton','Callback', @botonDefaultVentanaOpciones, 'String', 'Default', 'Position', [referenciaX-65 referenciaY anchoBoton alturaBoton]);

end

function botonDefaultVentanaOpciones(hObject, ~)

    data = guidata(hObject);
    data.Parametros = data.Default.Parametros;
    data.ParametrosActuales.Parametros = data.Default.Parametros;
    textoDefault = data.Default.Parametros.Material.esfuerzoFluencia/1000000;
    textoDefault = darFormatoValorEsfuerzo(textoDefault);
    textoString = num2str(textoDefault);
    set(data.textoDos,'String',textoString);
    textoUltimo = data.Default.Parametros.Material.esfuerzoUltimo/1000000;
    textoUltimoDos = darFormatoValorEsfuerzo(textoUltimo);
    textoUltimoDos = num2str(textoUltimoDos);
    set(data.texto,'String',textoUltimoDos);
    set(data.Manejador.criterioFalla, 'Value', 1);
    set(data.Manejador.acabadoSuperficial, 'Value', 1);
    set(data.Manejador.tipoCarga, 'Value', 1);
    set(data.Manejador.factorTemperatura, 'Value', 1);
    set(data.Manejador.factorConfiabilidad, 'Value', 1);
    set(data.Manejador.efectosVarios, 'String', 0.8);
    set(data.listaMateriales, 'Value', 1);
    
    nombreProyectoDefault = data.Default.Parametros.nombreDefectoProyecto;
    ubicacionProyectoDefault = data.ParametrosActuales.Parametros.ubicacionResultados;
    
    set(data.cajaTextoEditableNombreProyecto,'String',nombreProyectoDefault);
    set(data.cajaTextoEditable,'String',ubicacionProyectoDefault);
    guidata(hObject,data);
    guidata(data.Figura, data);

end