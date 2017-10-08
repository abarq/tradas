function  [listaMaterialesHandle, handle, handle2] = establecerListaMateriales(MaterialesDeEje, datosVentanaPrincipal)
    
    alturaBoton = darFormatoGUIVentanaOpciones('listaMateriales', 'altura');
    anchoBoton = darFormatoGUIVentanaOpciones('listaMateriales', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('listaMateriales', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('listaMateriales','referenciaY');
    
    a = datosVentanaPrincipal.ParametrosActuales.Parametros.Material.value;
    b = datosVentanaPrincipal.ParametrosActuales.Parametros.Material.esfuerzoUltimo/1000000;
    c = datosVentanaPrincipal.ParametrosActuales.Parametros.Material.esfuerzoFluencia/1000000;
    
    b = darFormatoValorEsfuerzo(b);
    c = darFormatoValorEsfuerzo(c);
    handle = uicontrol('style','text', 'String', c, 'Position', [120 30 110 15]);
    set(handle,'BackgroundColor','white');
    
   
    handle2 = uicontrol('style','text', 'String', b, 'Position', [120 55 100 15]);
    set(handle2,'BackgroundColor','white');
    
    listaMaterialesHandle = uicontrol('Style', 'popup', 'Position', [referenciaX referenciaY anchoBoton alturaBoton], 'String', MaterialesDeEje.descripcion, 'Callback', {@popupMenu_callback, handle, handle2});
    set(listaMaterialesHandle, 'Value', a);

%     set(datosVentanaPrincipal.texto, 'String', b);
%     set(datosVentanaPrincipal.texto, 'String', c);
%     
end

function popupMenu_callback(hObject, ~, x, y)

    data = guidata(hObject);
        
    value = get(hObject, 'Value');
    data.ParametrosActuales.Parametros.Material.esfuerzoUltimo = double(data.Material.esfuerzoUltimo(hObject.Value)*1e6);
    data.ParametrosActuales.Parametros.Material.esfuerzoFluencia = double(data.Material.esfuerzoFluencia(hObject.Value)*1e6);    
    data.ParametrosActuales.Parametros.Material.value = value;
     b = data.Material.esfuerzoUltimo(hObject.Value);
     c = data.Material.esfuerzoFluencia(hObject.Value);
%     
     b = darFormatoValorEsfuerzo(b);
     c = darFormatoValorEsfuerzo(c);
%     
%     set(data.texto, 'String', b);
%     set(data.textoDos, 'String', c);
    set(x, 'String',c);
    set(y, 'String', b);
    guidata(hObject, data);
    %guidata(data.Figura, data);
    
end