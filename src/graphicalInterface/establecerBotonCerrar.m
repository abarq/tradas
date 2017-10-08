function establecerBotonCerrar(ventanaPrincipalHandle)

    geometriaVentanaPrincipal = get(ventanaPrincipalHandle, 'Position');
    anchoBoton = 65;
    alturaBoton = 25;
    desfaseBordeHorizontalInferior = 20;
    desfaseBordeIzquierdo = 15;
    
    referenciaX = geometriaVentanaPrincipal(3) - desfaseBordeIzquierdo - anchoBoton;
    referenciaY = desfaseBordeHorizontalInferior;
    
    
    uicontrol('Style', 'pushbutton', 'Callback', @pushbutton_callback6, 'String', 'Close', 'Position', [referenciaX referenciaY anchoBoton alturaBoton]);

end

function pushbutton_callback6(hObject, ~)

    data = guidata(hObject);

        close(gcf);

  
end