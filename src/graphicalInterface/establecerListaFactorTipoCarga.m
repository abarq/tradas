function listaCriteriosFallaHandle = establecerListaFactorTipoCarga(datosVentanaPrincipal)
    
    alturaBoton = darFormatoGUIVentanaOpciones('tipoCarga', 'altura');
    anchoBoton = darFormatoGUIVentanaOpciones('tipoCarga', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('tipoCarga', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('tipoCarga','referenciaY');
    
    listaCriteriosFalla = [{'Bending'}, {'Axial'} , {'Torsion'}];
    listaCriteriosFallaHandle = uicontrol('Style','popup','Position', [referenciaX referenciaY anchoBoton alturaBoton], 'String' ,listaCriteriosFalla, 'Callback', @popupMenu_callback2);
    a = datosVentanaPrincipal.ParametrosActuales.Parametros.FatigaAltoCiclaje.tipoCargaValue;
    set(listaCriteriosFallaHandle, 'Value',a);
    
end


function popupMenu_callback2(hObject, eventdata)

    data = guidata(hObject);
    switch hObject.Value
                    
        case 1
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.tipoCarga = 'Bending';
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.tipoCargaValue =1;
        case 2
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.tipoCarga = 'Axial';
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.tipoCargaValue =2;
        case 3
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.tipoCarga = 'Torsion';
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.tipoCargaValue =3;
    end
    
        guidata(hObject,data);
        %guidata(data.Figura, data);

end
