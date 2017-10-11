function iniciarPrograma

    ventanaPrincipalHandle = establecerVentanaPrincipal();
    establecerElementosGUIEnVentanaPrincipal(ventanaPrincipalHandle)
  
    A.Parametros = establecerParametrosPorDefecto();
    A.ventanaHandle = ventanaPrincipalHandle;
    
    Handles = guidata(ventanaPrincipalHandle);
    Handles.Parametros = establecerParametrosPorDefecto();
    Handles.ParametrosActuales = A;
    Handles.ventanaHandle = ventanaPrincipalHandle;
    Handles.Default = A;
    guidata(ventanaPrincipalHandle, Handles);
    
end

function establecerElementosGUIEnVentanaPrincipal(ventanaPrincipalHandle)

    establecerInformacionPrincipal();
    establecerFigura();
    establecerBotonAbrir();
    establecerBotonOpciones(ventanaPrincipalHandle);
    establecerBotonCerrar(ventanaPrincipalHandle);

end

function establecerInformacionPrincipal()

    mensajeCentral = uicontrol('style','text','String', 'Press Open to select the shaft description text file','FontSize', 8);
    s1 = char(169);
    s2 = 'Denis Abarca-Quesada. 2017';
    s = strcat(s1,s2);
    copyright = uicontrol('style','text','String', s, 'FontSize', 7,'ForegroundColor',[0.5 0.5 0.5]);
    set(copyright, 'Position', [170 0 230 15]);
    set(copyright,'BackgroundColor','white');
    anchoCajaTexto = darFormatoGUIVentanaInicio('titulo', 'ancho');
    altoCajaTexto = darFormatoGUIVentanaInicio('titulo', 'altura');
    posicionEnX = darFormatoGUIVentanaInicio('titulo','referenciaX');
    posicionEnY = darFormatoGUIVentanaInicio('titulo', 'referenciaY');
    set(mensajeCentral, 'Position', [45, 60 ,260,15]);
    set(mensajeCentral,'BackgroundColor','white');

end

function establecerFigura()

    
    directorioActual = pwd;
    directorioData  = '\data';
    archivoLogo = '\logo.png';
    direccionArchivoCompleto = [directorioActual directorioData archivoLogo];
    imshow(direccionArchivoCompleto);
%     imshow('logo.png');
    set(gca, 'Position', [0.13 0.35 0.80 0.45]);
  
end

function ventanaPrincipalHandle =  establecerVentanaPrincipal()

    ancho = darFormatoGUIVentanaInicio('ventanaPrincipal', 'ancho');
    altura = darFormatoGUIVentanaInicio('ventanaPrincipal', 'altura');
    ventanaPrincipalHandle = figure('Name','Tradas | Transmission Design Assistant','NumberTitle','off', 'Position', [10000 10000 ancho altura], 'MenuBar', 'none', 'ToolBar', 'none');
    movegui(gcf, 'center');
    set(gcf,'color','w');
    set(gcf,'Resize','off');

end