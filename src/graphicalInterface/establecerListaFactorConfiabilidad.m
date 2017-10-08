function listaCriteriosFallaHandle = establecerListaFactorConfiabilidad(datosVentanaPrincipal)
    
    alturaBoton = darFormatoGUIVentanaOpciones('factorConfiabilidad', 'altura');
    anchoBoton = darFormatoGUIVentanaOpciones('factorConfiabilidad', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('factorConfiabilidad', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('factorConfiabilidad','referenciaY');
    
    listaCriteriosFalla = [{'50%'}, {'90%'}, {'95%'}, {'99%'},{'99.9%'},{'99.99%'},{'99.999%'},{'99.9999%'}];
    listaCriteriosFallaHandle = uicontrol('Style','popup','Position', [referenciaX referenciaY anchoBoton alturaBoton], 'String' ,listaCriteriosFalla, 'Callback', @popupMenu_callback2);
    a = datosVentanaPrincipal.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.ConfiabilidadValue;
    set(listaCriteriosFallaHandle, 'Value',a);
end


function popupMenu_callback2(hObject, ~)

    data = guidata(hObject);
    switch hObject.Value
                    
        case 1
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.Confiabilidad = 1;
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.ConfiabilidadValue = 1;
            
        case 2
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.Confiabilidad  = 0.897;
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.ConfiabilidadValue = 2;

            
        case 3
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.Confiabilidad  = 0.868;
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.ConfiabilidadValue = 3;

            
        case 4
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.Confiabilidad  = 0.814;
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.ConfiabilidadValue = 4;

        case 5
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.Confiabilidad  = 0.753;
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.ConfiabilidadValue = 5;

        case 6
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.Confiabilidad  = 0.702;
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.ConfiabilidadValue =6;

        case 7
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.Confiabilidad  = 0.659;
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.ConfiabilidadValue = 7;

        case 8
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.Confiabilidad  = 0.620;
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.ConfiabilidadValue = 8;

    end
    
        guidata(hObject,data);
        %guidata(data.Figura, data);

end
