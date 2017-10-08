function controlador()

    %msgbox(desplegarMensaje('MensajeInicial
    h = msgbox(sprintf('\t\t\tUniversidad de Costa Rica\n\n\t\tPrograma para la asistencia de diseño de ejes de transmision de potencia\n\n\t\t\tEscuela de ingeniería mecánica\n\n\t\t\tIng. Denis Abarca Quesada'));
    th = findall(0, 'Tag','MessageBox' );

    boxPosition = get(h,'position');
    textPosition = get(th, 'position'); 

    set(th, 'position', [boxPosition(3)/2 textPosition(2) textPosition(3)]);
    set(th, 'HorizontalAlignment', 'center');
    uiwait(h);


    warning('off', 'all');
    
    finalizarPrograma = 0;
    %Parametros = establecerParametrosPorDefecto();
    
    while(~finalizarPrograma())
        
        opcion = obtenerOpcion();
        
        finalizarPrograma = ejecutarAccionAPartirdeOpcion(opcion);
                              
    end

end
