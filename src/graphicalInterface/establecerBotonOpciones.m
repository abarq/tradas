function establecerBotonOpciones(ventanaPrincipalHandle)

    geometriaVentanaPrincipal = get(ventanaPrincipalHandle, 'Position');
    anchoBoton = 65;
    alturaBoton = 25;
    desfaseBordeHorizontalInferior = 20;
    desfaseBordeIzquierdo = 15;
    
    referenciaX = geometriaVentanaPrincipal(3)/2 - anchoBoton/2;
    referenciaY = desfaseBordeHorizontalInferior;

    uicontrol('Style', 'pushbutton', 'Callback', @establecerOpciones, 'String', 'Options', 'Position', [referenciaX referenciaY anchoBoton alturaBoton]);
end
