function mostrarMensajeAdvertencia(windowHandle, message)

    anchoVentanaOpciones = 350;%darFormatoGUIVentanaOpciones('ventanaPrincipal', 'ancho');
    alturaVentanaOpciones = 130;%darFormatoGUIVentanaOpciones('ventanaPrincipal', 'altura');
    warningHandle = figure('Name','Warning','NumberTitle','off', 'Position', [10000, 10000, anchoVentanaOpciones, alturaVentanaOpciones], 'MenuBar', 'none', 'ToolBar', 'none');
    movegui(gcf, 'center');
    set(gcf, 'Resize', 'off');
    set(gcf,'color','w');
    set(gcf,'DefaultFigureWindowStyle','docked');
    
    alturaTexto = 35;%darFormatoGUIVentanaOpciones('textoFactorEfectosVarios', 'altura');
    anchoTexto = 250;%darFormatoGUIVentanaOpciones('textoFactorEfectosVarios', 'ancho' );
    referenciaX = 100;%darFormatoGUIVentanaOpciones('textoFactorEfectosVarios', 'referenciaX');
    referenciaY = 60;%darFormatoGUIVentanaOpciones('textoFactorEfectosVarios','referenciaY');

    textoNombreProyetoHandle = uicontrol('style','text', 'String', message, 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoNombreProyetoHandle, 'HorizontalAlignment', 'left');
    set(textoNombreProyetoHandle,'BackgroundColor','white');
    set(textoNombreProyetoHandle, 'HorizontalAlignment','center');
     
     
     %ven = datosVentanaPrincipal.ventanaHandle;
     oldState = enableDisableFig(windowHandle, 'off');
     set(gcf,'CloseRequestFcn',{@my_closereq,windowHandle});
     imshow('warningLogo.png');
     set(gca, 'Position', [0.06 0.18 0.2 0.65]);
     
    alturaBoton = 25;%darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'altura'); 
    anchoBoton = 80;%darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'ancho');
    referenciaX = anchoVentanaOpciones/2 + anchoBoton/4;%darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'referenciaX'); 
    referenciaY = 20;darFormatoGUIVentanaOpciones('botonAceptarVentanaOpciones', 'referenciaY');
    
    botonAceptarVentanaOpcionesHandle = uicontrol('Style', 'pushbutton','Callback', {@cerrarVentanaDialogo,windowHandle}, 'String', 'OK', 'Position', [referenciaX referenciaY anchoBoton alturaBoton]);
         

end

function cerrarVentanaDialogo(hObject, eventdata,x)

    enableDisableFig(x, 'on');
    delete(gcf);

end


function my_closereq(src, callbackdata,x)

    enableDisableFig(x, 'on');
    delete(gcf);

end