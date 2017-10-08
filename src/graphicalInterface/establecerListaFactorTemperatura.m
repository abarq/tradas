function listaCriteriosFallaHandle = establecerListaFactorTemperatura(datosVentanaPrincipal)
    
    alturaBoton = darFormatoGUIVentanaOpciones('factorTemperatura', 'altura');
    anchoBoton = darFormatoGUIVentanaOpciones('factorTemperatura', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('factorTemperatura', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('factorTemperatura','referenciaY');
    
    listaCriteriosFalla = [{'20°C'}, {'50°C'}, {'100°C'}, {'150°C'},{'200°C'},{'250°C'},{'300°C'},{'350°C'},{'400°C'},{'450°C'},{'500°C'},{'550°C'},{'600°C'}];
    listaCriteriosFallaHandle = uicontrol('Style','popup','Position', [referenciaX referenciaY anchoBoton alturaBoton], 'String' ,listaCriteriosFalla, 'Callback', @popupMenu_callback2);
    a = datosVentanaPrincipal.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue;
    set(listaCriteriosFallaHandle, 'Value',a);
end


function popupMenu_callback2(hObject, eventdata)

    data = guidata(hObject);
    switch hObject.Value
                    
        case 1
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura = determinarFactorModificadorPorTemperatura(20);
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 1;
            
        case 2
            
           data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(50);
           data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 2; 
        case 3
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura = determinarFactorModificadorPorTemperatura(100);
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 3; 

        case 4
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(150);
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 4; 

        case 5
            
           data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(200);
           data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 5; 
 
        case 6
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(250);
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 6; 

        case 7
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(300);
                       data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 7; 

        case 8
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(350);
                       data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 8; 

        case 9
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(400);
                       data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 9; 

        case 10
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(450);
                       data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 10; 

        case 11
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(500);
                       data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 11; 

        case 12
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(550);
                       data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue =12; 

        case 13
            
            data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperatura =  determinarFactorModificadorPorTemperatura(600);
                       data.ParametrosActuales.Parametros.FatigaAltoCiclaje.FactorModificador.temperaturaValue = 13; 

    end
    
        guidata(hObject,data);
        %guidata(data.Figura, data);

end
