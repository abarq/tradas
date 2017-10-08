function textoEditableUbicacionProyectoHandle = establecerCajaFactorEfectosvarios(data)

    alturaTexto =darFormatoGUIVentanaOpciones('factorEfectosVarios', 'altura'); 
    anchoTexto = darFormatoGUIVentanaOpciones('factorEfectosVarios', 'ancho');
    referenciaX = darFormatoGUIVentanaOpciones('factorEfectosVarios', 'referenciaX'); 
    referenciaY = darFormatoGUIVentanaOpciones('factorEfectosVarios', 'referenciaY');
    
    textoEditableUbicacionProyectoHandle = uicontrol('Style', 'edit', 'Callback', @cajaTextoUbicacionProyecto, 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoEditableUbicacionProyectoHandle, 'HorizontalAlignment', 'right');
    a = data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.EfectosVarios;
    set(textoEditableUbicacionProyectoHandle, 'String', a);

end

function cajaTextoUbicacionProyecto(hObject, ~)

    data2 = guidata(hObject);
    
    str = get(hObject, 'String');
    numero = str2double(str);
    
    data2.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.EfectosVarios = numero; 
    data2.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.EfectosVarios = numero; 
        guidata(hObject,data2);
        %guidata(data2.Figura, data2);


end
