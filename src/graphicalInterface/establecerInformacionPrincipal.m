function establecerInformacionPrincipal()

   mensajeCentral = uicontrol('style','text','String', 'Press Open to select the shaft description text file','FontSize', 8);
     s1 = char(169);
     s2 = 'Denis Abarca-Quesada. 2017';
     s = strcat(s1,s2);
     copyright = uicontrol('style','text','String', s, 'FontSize', 7,'ForegroundColor',[0.5 0.5 0.5]);
%    dimensionesVentanaPrincipal = get(ventanaPrincipalHandle, 'Position');
    set(copyright, 'Position', [170 0 230 15]);
    set(copyright,'BackgroundColor','white');
    anchoCajaTexto = darFormatoGUIVentanaInicio('titulo', 'ancho');
    altoCajaTexto = darFormatoGUIVentanaInicio('titulo', 'altura');
    posicionEnX = darFormatoGUIVentanaInicio('titulo','referenciaX');
    posicionEnY = darFormatoGUIVentanaInicio('titulo', 'referenciaY');
    set(mensajeCentral, 'Position', [45, 60 ,260,15]);
    set(mensajeCentral,'BackgroundColor','white');

end
