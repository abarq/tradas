function listaCriteriosFallaHandle = establecerListaCriteriosFalla(datosVentanaPrincipal)
    
    alturaBoton = darFormatoGUIVentanaOpciones('listaCriterioFalla', 'altura');
    anchoBoton = darFormatoGUIVentanaOpciones('listaCriterioFalla', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('listaCriterioFalla', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('listaCriterioFalla','referenciaY');
    
    %listaCriteriosFalla = [{'Goodman'}, {'Soderberg'}, {'Asme'}, {'Gerber'}];
    listaCriteriosFalla = [{'Goodman'}, {'Soderberg'}];

    listaCriteriosFallaHandle = uicontrol('Style','popup','Position', [referenciaX referenciaY anchoBoton alturaBoton], 'String' ,listaCriteriosFalla, 'Callback', @popupMenu_callback2);
    a = datosVentanaPrincipal.ParametrosActuales.Parametros.FatigaAltoCiclaje.criterioFallaValue;
    set(listaCriteriosFallaHandle, 'Value',a);
    
end


function popupMenu_callback2(hObject, eventdata)

    data = guidata(hObject);
    switch hObject.Value
                    
        case 1
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.criterioFalla = 'Goodman';
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.criterioFallaValue = 1;
        case 2
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.criterioFalla = 'Soderberg';
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.criterioFallaValue = 2;
            
        case 3
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.criterioFalla = 'Asme';
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.criterioFallaValue = 3;
            
    end
    
        guidata(hObject,data);
        %guidata(data.Figura, data);

end
