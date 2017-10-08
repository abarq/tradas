function establecerOpciones(hObject2,~)
    
    ventanaOpcionesHandle = establecerVentanaOpciones();
    datosVentanaPrincipal = obtenerDatosventanaPrincipal(hObject2);
    Default = datosVentanaPrincipal.Default;
    ParametrosActuales = datosVentanaPrincipal.ParametrosActuales;
    ventanaHandle2 = datosVentanaPrincipal.ventanaHandle;
    ocultarVentanaPrincipal(datosVentanaPrincipal, hObject2);

    
    MaterialesDeEje = obtenerMaterialesDeEje();
    
    
    establecerPanelInformacion(ventanaOpcionesHandle);
    establecerPanelMaterial(ventanaOpcionesHandle);
    establecerPanelAnalisis(ventanaOpcionesHandle);
    establecerTextoEnPaneles();
    establecerBotones();

    textoEditableNombreProyectoHandle = establecerTextoEditableNombreProyecto(datosVentanaPrincipal);
    textoEditableUbicacionProyectoHandle = establecerTextoEditableUbicacionProyecto(datosVentanaPrincipal);
    
    [listaMaterialesHandle, a,b] = establecerListaMateriales(MaterialesDeEje, datosVentanaPrincipal);

    M.criterioFalla = establecerListaCriteriosFalla(datosVentanaPrincipal);
    M.acabadoSuperficial = establecerListaAcabadoSuperficial(datosVentanaPrincipal);
    M.tipoCarga = establecerListaFactorTipoCarga(datosVentanaPrincipal);
    M.factorTemperatura = establecerListaFactorTemperatura(datosVentanaPrincipal);
    M.factorConfiabilidad = establecerListaFactorConfiabilidad(datosVentanaPrincipal);
    M.efectosVarios = establecerCajaFactorEfectosvarios(datosVentanaPrincipal);

    set(gcf,'CloseRequestFcn',{@my_closereq,datosVentanaPrincipal});
    
    Handles = guidata(ventanaOpcionesHandle);
    Handles.cajaTextoEditable = textoEditableUbicacionProyectoHandle;
    Handles.cajaTextoEditableNombreProyecto = textoEditableNombreProyectoHandle;
    Handles.Parametros = datosVentanaPrincipal.Parametros;
    Handles.Material = MaterialesDeEje;
    Handles.Figura = hObject2;
    Handles.datosVentanaPrincipal = datosVentanaPrincipal;
    Handles.ventanaOpciones = ventanaOpcionesHandle;
    Handles.texto = b;
    Handles.textoDos = a;
    Handles.ventanaHandle = ventanaHandle2;
    Handles.Default = Default;
    Handles.listaMateriales = listaMaterialesHandle;
    Handles.anterior = Handles;
    Handles.Manejador = M;
    Handles.ParametrosActuales = ParametrosActuales;
    guidata(ventanaOpcionesHandle, Handles)

end

function my_closereq(~, ~,x)

    ven = x.ventanaHandle;
    enableDisableFig(ven, 'on');
    delete(gcf);

end


function data = obtenerDatosventanaPrincipal(hObject2)

    data = guidata(hObject2);

end


function ocultarVentanaPrincipal(datosVentanaPrincipal, hObject2)

     ven = datosVentanaPrincipal.ventanaHandle;
     enableDisableFig(ven, 'off');
     guidata(hObject2,datosVentanaPrincipal);

end


function  establecerTextoEnPaneles()

    establecerTextoNombreProyecto();
    establecerUbicacionResultadosProyecto();
    establecerTextoMaterial();
    establecerTextoCriterioFalla();
    establecerTextoAcabadoSuperficial();
    establecerTextoFactorTipoCarga();
    establecerTextoFactorTemperatura();
    establecerTextoFactorConfiabilidad();
    establecerTextoFactorEfectosvarios();
    establecerTextoEsfuerzoFluencia();
    establecerTextoEsfuerzoUltimo();

end

function establecerBotones()

    establecerBotonBuscarCarpetaResultados();
    establecerBotonCerrarVentanaOpciones();
    establecerBotonAceptarVentanaOpciones();
    establecerBotonDefaultVentanaOpciones();

end

function ventanaOpcionesHandle = establecerVentanaOpciones()

    anchoVentanaOpciones = darFormatoGUIVentanaOpciones('ventanaPrincipal', 'ancho');
    alturaVentanaOpciones = darFormatoGUIVentanaOpciones('ventanaPrincipal', 'altura');
    ventanaOpcionesHandle = figure('Name','Options','NumberTitle','off', 'Position', [10000, 10000, anchoVentanaOpciones, alturaVentanaOpciones], 'MenuBar', 'none', 'ToolBar', 'none');
    movegui(gcf, 'center');
    set(gcf, 'Resize', 'off');
    set(gcf,'color','w');
    set(gcf,'DefaultFigureWindowStyle','docked');

    
end

function establecerPanelInformacion(ventanaOpcionesHandle)

    referenciaX = darFormatoGUIVentanaOpciones('panelInformacionGeneral', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('panelInformacionGeneral', 'referenciaY');
    anchoPanelInformacion = darFormatoGUIVentanaOpciones('panelInformacionGeneral', 'ancho');
    alturaPanelInformacion = darFormatoGUIVentanaOpciones('panelInformacionGeneral','altura');

    uipanel(ventanaOpcionesHandle,'Title','Information','FontSize',9,...
                'BackgroundColor','white',...
                'Units','pixels','Position',[referenciaX referenciaY anchoPanelInformacion alturaPanelInformacion]);
            
end

function establecerPanelMaterial(ventanaOpcionesHandle)
    
    referenciaX = darFormatoGUIVentanaOpciones('panelMaterial', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('panelMaterial', 'referenciaY');
    anchoPanelMaterial = darFormatoGUIVentanaOpciones('panelMaterial', 'ancho');
    alturaPanelMaterial = darFormatoGUIVentanaOpciones('panelMaterial','altura');

    uipanel(ventanaOpcionesHandle,'Title','Material','FontSize',9,...
                'BackgroundColor','white',...
                'Units','pixels','Position',[referenciaX referenciaY anchoPanelMaterial alturaPanelMaterial]);        
    
end

function establecerPanelAnalisis(ventanaOpcionesHandle)

    referenciaX = darFormatoGUIVentanaOpciones('panelAnalisis', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('panelAnalisis', 'referenciaY');
    anchoPanelAnalisis = darFormatoGUIVentanaOpciones('panelAnalisis', 'ancho');
    alturaPanelAnalisis = darFormatoGUIVentanaOpciones('panelAnalisis','altura');

    uipanel(ventanaOpcionesHandle,'Title','Analysis','FontSize',9,...
                'BackgroundColor','white',...
                'Units','pixels','Position',[referenciaX referenciaY anchoPanelAnalisis alturaPanelAnalisis]);        



end

function textoNombreProyetoHandle = establecerTextoNombreProyecto()

    alturaTexto = darFormatoGUIVentanaOpciones('textoNombreProyecto', 'altura');
    anchoTexto = darFormatoGUIVentanaOpciones('textoNombreProyecto', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('textoNombreProyecto', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('textoNombreProyecto','referenciaY');

    textoNombreProyetoHandle = uicontrol('style','text', 'String', 'Project name', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoNombreProyetoHandle, 'HorizontalAlignment', 'left');
    set(textoNombreProyetoHandle,'BackgroundColor','white');

    
end

function textoUbicacionProyectoHandle = establecerUbicacionResultadosProyecto()

    alturaTexto =darFormatoGUIVentanaOpciones('ubicacionProyecto', 'altura'); 
    anchoTexto = darFormatoGUIVentanaOpciones('ubicacionProyecto', 'ancho');
    referenciaX = darFormatoGUIVentanaOpciones('ubicacionProyecto', 'referenciaX'); 
    referenciaY = darFormatoGUIVentanaOpciones('ubicacionProyecto', 'referenciaY');
    
    textoUbicacionProyectoHandle = uicontrol('style','text', 'String', 'Path results', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoUbicacionProyectoHandle, 'HorizontalAlignment', 'left');
    set(textoUbicacionProyectoHandle,'BackgroundColor','white');

end

function textoMaterialHandle = establecerTextoMaterial()
    
    alturaTexto = darFormatoGUIVentanaOpciones('textoSeleccionMaterial', 'altura');
    anchoTexto = darFormatoGUIVentanaOpciones('textoSeleccionMaterial', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('textoSeleccionMaterial', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('textoSeleccionMaterial','referenciaY');

    
    textoMaterialHandle = uicontrol('style','text', 'String', 'Select material', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoMaterialHandle, 'HorizontalAlignment', 'left');
    set(textoMaterialHandle,'BackgroundColor','white')
    
end

function establecerTextoCriterioFalla()

    alturaTexto = darFormatoGUIVentanaOpciones('textoCriterioFalla', 'altura');
    anchoTexto = darFormatoGUIVentanaOpciones('textoCriterioFalla', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('textoCriterioFalla', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('textoCriterioFalla','referenciaY');

    textoNombreProyetoHandle = uicontrol('style','text', 'String', 'Failure criteria', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoNombreProyetoHandle, 'HorizontalAlignment', 'left');
    set(textoNombreProyetoHandle,'BackgroundColor','white');
   
end

function establecerTextoAcabadoSuperficial()

    alturaTexto = darFormatoGUIVentanaOpciones('textoAcabadoSuperficial', 'altura');
    anchoTexto = darFormatoGUIVentanaOpciones('textoAcabadoSuperficial', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('textoAcabadoSuperficial', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('textoAcabadoSuperficial','referenciaY');

    textoNombreProyetoHandle = uicontrol('style','text', 'String', 'Surface condition', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoNombreProyetoHandle, 'HorizontalAlignment', 'left');
    set(textoNombreProyetoHandle,'BackgroundColor','white');
    
end

function establecerTextoFactorTipoCarga()

    alturaTexto = darFormatoGUIVentanaOpciones('textoTipoCarga', 'altura');
    anchoTexto = darFormatoGUIVentanaOpciones('textoTipoCarga', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('textoTipoCarga', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('textoTipoCarga','referenciaY');

    textoNombreProyetoHandle = uicontrol('style','text', 'String', 'Load type', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoNombreProyetoHandle, 'HorizontalAlignment', 'left');
    set(textoNombreProyetoHandle,'BackgroundColor','white');
   
end

function establecerTextoFactorTemperatura()

    alturaTexto = darFormatoGUIVentanaOpciones('textoFactorTemperatura', 'altura');
    anchoTexto = darFormatoGUIVentanaOpciones('textoFactorTemperatura', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('textoFactorTemperatura', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('textoFactorTemperatura','referenciaY');

    textoNombreProyetoHandle = uicontrol('style','text', 'String', 'Temperature', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoNombreProyetoHandle, 'HorizontalAlignment', 'left');
    set(textoNombreProyetoHandle,'BackgroundColor','white');
   
end

function establecerTextoFactorConfiabilidad()

    alturaTexto = darFormatoGUIVentanaOpciones('textoFactorConfiabilidad', 'altura');
    anchoTexto = darFormatoGUIVentanaOpciones('textoFactorConfiabilidad', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('textoFactorConfiabilidad', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('textoFactorConfiabilidad','referenciaY');

    textoNombreProyetoHandle = uicontrol('style','text', 'String', 'Reliability', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoNombreProyetoHandle, 'HorizontalAlignment', 'left');
    set(textoNombreProyetoHandle,'BackgroundColor','white');
   
end

function establecerTextoFactorEfectosvarios()

    alturaTexto = darFormatoGUIVentanaOpciones('textoFactorEfectosVarios', 'altura');
    anchoTexto = darFormatoGUIVentanaOpciones('textoFactorEfectosVarios', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('textoFactorEfectosVarios', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('textoFactorEfectosVarios','referenciaY');

    textoNombreProyetoHandle = uicontrol('style','text', 'String', 'Various effects factor', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoNombreProyetoHandle, 'HorizontalAlignment', 'left');
    set(textoNombreProyetoHandle,'BackgroundColor','white');
   
end

function establecerTextoEsfuerzoFluencia()

    alturaTexto = darFormatoGUIVentanaOpciones('textoEsfuerzoFluencia', 'altura');
    anchoTexto = darFormatoGUIVentanaOpciones('textoEsfuerzoFluencia', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('textoEsfuerzoFluencia', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('textoEsfuerzoFluencia','referenciaY');

    textoNombreProyetoHandle = uicontrol('style','text', 'String', 'Yield strength', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoNombreProyetoHandle, 'HorizontalAlignment', 'left');
    set(textoNombreProyetoHandle,'BackgroundColor','white');
    
end

function establecerTextoEsfuerzoUltimo()

    alturaTexto = darFormatoGUIVentanaOpciones('textoEsfuerzoUltimo', 'altura');
    anchoTexto = darFormatoGUIVentanaOpciones('textoEsfuerzoUltimo', 'ancho' );
    referenciaX = darFormatoGUIVentanaOpciones('textoEsfuerzoUltimo', 'referenciaX');
    referenciaY = darFormatoGUIVentanaOpciones('textoEsfuerzoUltimo','referenciaY');

    textoNombreProyetoHandle = uicontrol('style','text', 'String', 'Ultimate strength', 'Position', [referenciaX referenciaY anchoTexto alturaTexto]);
    set(textoNombreProyetoHandle, 'HorizontalAlignment', 'left');
    set(textoNombreProyetoHandle,'BackgroundColor','white');


end