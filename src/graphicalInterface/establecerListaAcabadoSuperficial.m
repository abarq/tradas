function listaCriteriosFallaHandle = establecerListaAcabadoSuperficial(datosVentanaPrincipal)
    
    alturaBoton = darFormatoGUIVentanaOpciones('acabadoSuperficial', 'altura');
    anchoBoton = darFormatoGUIVentanaOpciones('acabadoSuperficial', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('acabadoSuperficial', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('acabadoSuperficial','referenciaY');
    
    listaCriteriosFalla = [{'Machined'}, {'Ground'}, {'Hot-rolled'}, {'As-forged'}];
    listaCriteriosFallaHandle = uicontrol('Style','popup','Position', [referenciaX referenciaY anchoBoton alturaBoton], 'String' ,listaCriteriosFalla, 'Callback', @popupMenu_callback2);
    a = datosVentanaPrincipal.ParametrosActuales.Parametros.FatigaAltoCiclaje.acabadoSuperficialValue;
    set(listaCriteriosFallaHandle, 'Value',a);
    
end


function popupMenu_callback2(hObject, eventdata)

    data = guidata(hObject);
    switch hObject.Value
                    
        case 1
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.acabadoSuperficial = 'Machined';
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.acabadoSuperficialValue = 1;
            
        case 2
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.acabadoSuperficial = 'Ground';
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.acabadoSuperficialValue = 2;
            
        case 3
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.acabadoSuperficial = 'Hot-rolled';
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.acabadoSuperficialValue = 3;
            
        case 4
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.acabadoSuperficial = 'As-forged';
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.acabadoSuperficialValue = 4;
            
    end
    
        guidata(hObject,data);
        %guidata(data.Figura, data);

end
