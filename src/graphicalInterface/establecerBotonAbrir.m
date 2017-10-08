function establecerBotonAbrir()

    anchoBoton = darFormatoGUIVentanaInicio('botonOpen', 'ancho');
    alturaBoton = darFormatoGUIVentanaInicio('botonOpen', 'altura');
    desfaseBordeHorizontalInferior = darFormatoGUIVentanaInicio('botonOpen', 'referenciaY');
    desfaseBordeIzquierdo =darFormatoGUIVentanaInicio('botonOpen', 'referenciaX'); 
    
    uicontrol('Style','pushbutton','Callback',@iniciarAnalisis, 'String', 'Open...', 'Position', [desfaseBordeIzquierdo desfaseBordeHorizontalInferior anchoBoton alturaBoton]);

end

function iniciarAnalisis(hObject, ~)

    data = guidata(hObject);
    ventanaHandle = data.ventanaHandle;
    Parametros = data.Parametros;
    
    InformacionArchivoTexto = solicitarArchivoTextoAUsuario();

    if InformacionArchivoTexto.indiceCancel == 1
    
        InformacionArchivoTexto.nombreArchivoTemporal = compactarArchivoTexto(InformacionArchivoTexto.direccion);
        InformacionArchivoTexto.id = abrirArchivoTexto(InformacionArchivoTexto.nombreArchivoTemporal);
        
        try
            
            Transmision.Eje.Geometria = establecerDatosGeometriaEje(InformacionArchivoTexto);
        
        catch 
            
            warndlg('El formato del archivo de texto no es correcto');
            fclose(InformacionArchivoTexto.id);
            delete 'archivoCompactadoTemporal.txt';

            return
            
        end
        Transmision.Eje.PropiedadesMaterial = establecerMaterialEje(Parametros);

        if Transmision.Eje.Geometria.informacionValida == 1 

            Transmision.Eje = complementarInformacionEje(Transmision.Eje);
            Transmision.Eje = calcularPropiedadesMecanicas(Transmision.Eje);
            Transmision.Cojinetes = establecerDatosCojinetes(InformacionArchivoTexto);
            datosCojinetesValidos = sonDatosCojinetesValidos(Transmision.Cojinetes, Transmision.Eje.largoEje);
            Transmision.CargasExternas = establecerCargasExternas(InformacionArchivoTexto);
            datosCargasValidos = sonDatosCargasExternasValidas(Transmision.CargasExternas, Transmision.Eje.largoEje);
            cerrarArchivoTexto(InformacionArchivoTexto);

            
            if (datosCojinetesValidos == 1 && datosCargasValidos == 1)
                
                Transmision.EscenariosDeCarga = establecerEscenariosDeCarga(Transmision);
                Transmision.Eje.FactorConcentracionEsfuerzo = obtenerFactoresConcentracionEsfuerzoEje(Transmision.Eje.Geometria);

                ModeloViga = crearModelosParaAnalsis(Transmision, Parametros);

                Analisis.Fatiga = determinarEsfuerzosEnPuntosCriticos(ModeloViga, Transmision.Eje);
                Analisis.Fatiga.Parametros = establecerParametrosAnalisisFatiga(Parametros, Transmision.Eje.PropiedadesMaterial);
                Analisis.Fatiga = ejecutarAnalisis(Transmision.Eje, Analisis.Fatiga);

                generarIlustraciones(Transmision, Analisis, ModeloViga, Parametros,ventanaHandle);
                
            else
               
               menssage = 'The information of loads or bearings are not correct';
               windowHandle = data.ventanaPrincipal;
               mostrarMensajeAdvertencia(windowHandle,menssage);
 
            end

        else

           warndlg('Los datos de la geometria del eje son inválidos','Error');
           uiwait();
           cerrarArchivoTexto(InformacionArchivoTexto);

        end

    end
    
    delete 'archivoCompactadoTemporal.txt';

end

