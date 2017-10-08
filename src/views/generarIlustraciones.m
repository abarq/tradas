function generarIlustraciones(Transmision, Analisis, ModeloViga, Parametros,ventanaHandle)
    
    ventana  = mostrarVentanaProcesamientoIlustraciones(ventanaHandle);
%    generarIlustracionesEscenariosDeCarga(Transmision, ejeDividido);
    generarIlustracionesDeFuerzaCortanteYMomentoFlector(ModeloViga,Transmision, Parametros);
    generarIlustracionesDeflexionYPendiente(ModeloViga, Transmision, Parametros);
    generarIlustracionesDisenoFatiga(Transmision, Analisis, ModeloViga, Parametros);
    mostrarVentanaProcesamientoCompleto(ventana, Parametros,ventanaHandle);

end

function ventana = mostrarVentanaProcesamientoIlustraciones(ventanaHandle)
    
    anchoVentanaOpciones = 200;%darFormatoGUIVentanaOpciones('ventanaPrincipal', 'ancho');
    alturaVentanaOpciones = 80;%darFormatoGUIVentanaOpciones('ventanaPrincipal', 'altura');
    ventana.handle = figure('Name','Processing','NumberTitle','off', 'Position', [10000, 10000, anchoVentanaOpciones, alturaVentanaOpciones], 'MenuBar', 'none', 'ToolBar', 'none');
    movegui(gcf, 'center');
    set(gcf, 'Resize', 'off');
    set(gcf,'color','w');
    set(gcf,'DefaultFigureWindowStyle','docked');
    enableDisableFig(ventanaHandle, 'off');
    set(ventana.handle,'CloseRequestFcn',@my_closereq);
    
    alturaTexto = 25;%darFormatoGUIVentanaOpciones('textoFactorEfectosVarios', 'altura');
    anchoTexto = 120;%darFormatoGUIVentanaOpciones('textoFactorEfectosVarios', 'ancho' );
    referenciaX = 50;%darFormatoGUIVentanaOpciones('textoFactorEfectosVarios', 'referenciaX');
    referenciaY = 20;%darFormatoGUIVentanaOpciones('textoFactorEfectosVarios','referenciaY');

    ventana.textoNombreProyectoHandle = uicontrol('style','text', 'String', 'Generating diagrams...', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(ventana.textoNombreProyectoHandle, 'HorizontalAlignment', 'left');
    set(ventana.textoNombreProyectoHandle,'BackgroundColor','white');
    set(ventana.textoNombreProyectoHandle, 'HorizontalAlignment','center');
     
end

function mostrarVentanaProcesamientoCompleto(ventana, Parametros, ventanaHandle)

    a=Parametros.nombreDefectoProyecto;
    b=Parametros.ubicacionResultados;
    c = strcat(b,'\',a);
    d = 'Analysis completed. The results are located at';
    e = [d,' ',c];%strcat(d,c);
    ancho = 330;
    alto = 155;
    set(ventana.handle, 'Position', [1000,1000, ancho, alto]);
    set(ventana.handle, 'Name', 'Analysis completed');
    movegui(ventana.handle, 'center');
    set(ventana.textoNombreProyectoHandle, 'Position',[20 60 290 45]);
    set(ventana.textoNombreProyectoHandle, 'String', e);
    
    
    anchoBoton = 50;%darFormatoGUIVentanaInicio('botonOpen', 'ancho');
    alturaBoton = 25;%darFormatoGUIVentanaInicio('botonOpen', 'altura');
    referenciaY = 25;%darFormatoGUIVentanaInicio('botonOpen', 'referenciaY');
    referenciaX = ancho/4-anchoBoton/2;%darFormatoGUIVentanaInicio('botonOpen', 'referenciaX'); 
    
    uicontrol(ventana.handle,'Style','pushbutton','Callback',{@abrirCarpetaResultados,c, ventanaHandle}, 'String', 'Yes', 'Position', [referenciaX referenciaY anchoBoton alturaBoton]);

    anchoBoton1 = 50;%darFormatoGUIVentanaInicio('botonOpen', 'ancho');
    alturaBoton1 = 25;%darFormatoGUIVentanaInicio('botonOpen', 'altura');
    referenciaY1 = 25;%darFormatoGUIVentanaInicio('botonOpen', 'referenciaY');
    referenciaX1 = 3*ancho/4-anchoBoton/2;%darFormatoGUIVentanaInicio('botonOpen', 'referenciaX'); 
    
    uicontrol(ventana.handle,'Style','pushbutton','Callback',{@salirVentana, ventanaHandle}, 'String', 'No', 'Position', [referenciaX1 referenciaY1 anchoBoton1 alturaBoton1]);

    
end

function abrirCarpetaResultados(~, ~,c, ventanaHandle)

    winopen(c);
    oldState = enableDisableFig(ventanaHandle, 'on');
    delete(gcf);

end

function salirVentana(~, ~, ventanaHandle)

oldState = enableDisableFig(ventanaHandle, 'on');    
delete(gcf);
end


function my_closereq(src, callbackdata)

end