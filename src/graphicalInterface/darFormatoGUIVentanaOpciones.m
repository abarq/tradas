function datoSolicitado = darFormatoGUIVentanaOpciones(varargin)

    goldenRatio = 1.618;
    anchoVentanaOpciones = 450;
    alturaVentanaOpciones = anchoVentanaOpciones/goldenRatio;

    separacionBordeVerticalVentana = 10;
    separacionBordeHorizontalVentana = 10;
    
    separacionEntrePaneles = 15;
    
    anchoPanelInformacionGeneral = 230;
    alturaPanelInformacionGeneral = 120;
    referenciaXPanelInformacionGeneral = separacionBordeVerticalVentana;
    referenciaYPanelInformacionGeneral = alturaVentanaOpciones - separacionBordeHorizontalVentana - alturaPanelInformacionGeneral;
    
    separacionBordeVerticalPanel = 10;
    separacionBordeHorizontalPanel = 20;
    
    anchoPanelMaterial = anchoPanelInformacionGeneral;
    alturaPanelMaterial = alturaVentanaOpciones - alturaPanelInformacionGeneral - 2 *separacionBordeHorizontalVentana - separacionEntrePaneles;
    referenciaXPanelMaterial = separacionBordeVerticalPanel;
    referenciaYPanelMaterial = separacionBordeHorizontalPanel;
%     
    
    anchoTextoNombreProyecto = 100;
    alturaTextoNombreProyecto = 10;
    referenciaXTextoNombreProyecto = separacionBordeVerticalVentana + separacionBordeVerticalPanel;
    referenciaYTextoNombreProyecto = alturaVentanaOpciones - separacionBordeHorizontalVentana - separacionBordeHorizontalPanel -alturaTextoNombreProyecto;

    
    separacionVerticalTextoYCajaNombreProyecto = 10; 
    anchoCajaNombreProyecto = anchoPanelInformacionGeneral -2*separacionVerticalTextoYCajaNombreProyecto;
    alturaCajaNombreProyecto = 20;
    
    referenciaYCajaTextoNombreProyecto = referenciaYTextoNombreProyecto - separacionVerticalTextoYCajaNombreProyecto -alturaCajaNombreProyecto;
    referenciaXCajaTextoNombreProyecto = referenciaXTextoNombreProyecto;
    
    anchoTextoUbicacionProyeto = 120;
    alturaTextoUbicacionProyecto = 15;
    separacionEntreCajaNombreProyectoYTextoUbicacion = 10;
    referenciaYTextoUbicacionProyecto = referenciaYCajaTextoNombreProyecto - separacionEntreCajaNombreProyectoYTextoUbicacion- alturaTextoUbicacionProyecto;
    referenciaXTextoUbicacionProyecto = referenciaXTextoNombreProyecto;
    
    anchoCajaUbicacionProyeto = 175;
    alturaCajaUbicacionProyecto = 20;
    separacionEntreTextoUbicacionYCajaUbicacion = 5;
    referenciaYCajaUbicacionProyecto = referenciaYTextoUbicacionProyecto - separacionEntreTextoUbicacionYCajaUbicacion- alturaCajaUbicacionProyecto;
    referenciaXCajaUbicacionProyecto = referenciaXTextoNombreProyecto;
    
    
    anchoBotonCambiarDirectorioUbicacion = 30;
    alturaBotonCambiarDirectorioUbicacion = 20;
    separacionEntreBotonYCajaUbicacion = 10;%%%
    referenciaYBotonCambiarDirectorio = referenciaYCajaUbicacionProyecto;
    referenciaXBotonCambiarDirectorio = separacionBordeVerticalPanel + anchoPanelInformacionGeneral - anchoBotonCambiarDirectorioUbicacion - separacionBordeVerticalPanel;
    
    anchoBotonCerrarVentanaOpciones = 55;
    alturaBotonCerrarVentanaOpciones = 25;
    referenciaYBotonCerrarVentanaOpciones = separacionBordeHorizontalVentana;
    referenciaXBotonCerrarVentanaOpciones = anchoVentanaOpciones - anchoBotonCerrarVentanaOpciones - separacionBordeVerticalVentana; 
   
    separacionHorizontalEntreBotones = 10;
    anchoBotonAceptarVentanaOpciones = 55;
    alturaBotonAceptarVentanaOpciones = 25;
    referenciaYBotonAceptarVentanaOpciones = separacionBordeHorizontalVentana;
    referenciaXBotonAceptarVentanaOpciones = anchoVentanaOpciones - anchoBotonCerrarVentanaOpciones - separacionBordeVerticalVentana - anchoBotonCerrarVentanaOpciones -separacionHorizontalEntreBotones; 
       
    anchoTextoSeleccionMaterial = 125;
    alturaTextoSeleccionMaterial = 15;
    separacionTextoPanel = 35;
    referenciaYTextoSeleccionMaterial = alturaPanelMaterial + separacionBordeHorizontalPanel-separacionTextoPanel;
    referenciaXTextoSeleccionMaterial = separacionVerticalTextoYCajaNombreProyecto + separacionBordeVerticalPanel; 
   
    anchoListaMateriales =anchoPanelInformacionGeneral - 2*separacionVerticalTextoYCajaNombreProyecto;
    alturaListaMateriales = 15;
    separacionTextoListaEditable = 20;
    referenciaXListaMateriales = referenciaXTextoSeleccionMaterial;
    referenciaYListaMateriales = alturaPanelMaterial + separacionBordeHorizontalPanel-separacionTextoPanel-separacionTextoListaEditable;
        
    anchoPanelAnalisis = anchoVentanaOpciones - anchoPanelInformacionGeneral - 2*separacionBordeVerticalVentana - separacionEntrePaneles;
    alturaPanelAnalisis = alturaVentanaOpciones - alturaBotonCerrarVentanaOpciones - 3*separacionBordeHorizontalVentana; 
    referenciaXPanelAnalisis = anchoPanelInformacionGeneral + separacionBordeVerticalVentana + separacionEntrePaneles;
    referenciaYPanelAnalisis = alturaBotonCerrarVentanaOpciones + 2*separacionBordeHorizontalVentana;

      
    anchoTextoEsfuerzoFluencia = 80 ;
    alturaTextoEsfuerzoFluencia = 15;
    referenciaXTextoEsfuerzoFluencia = separacionBordeVerticalVentana + separacionBordeVerticalPanel;
    referenciaYTextoEsfuerzoFluencia = referenciaYPanelMaterial + separacionBordeVerticalPanel;
    
    anchoTextoEsfuerzoUltimo = 100 ;
    alturaTextoEsfuerzoUltimo= 15;
    referenciaXTextoEsfuerzoUltimo = separacionBordeVerticalVentana + separacionBordeVerticalPanel;
    referenciaYTextoEsfuerzoUltimo = referenciaYPanelMaterial + 2*separacionBordeVerticalPanel+alturaTextoEsfuerzoFluencia;
  
    anchoTextoCriterioFalla = 80;
    alturaTextoCriterioFalla = alturaTextoUbicacionProyecto;
    referenciaXTextoCriterioFalla = separacionBordeVerticalPanel +referenciaXPanelAnalisis;
    referenciaYTextoCriterioFalla = referenciaYPanelAnalisis + alturaPanelAnalisis  - separacionBordeHorizontalPanel - alturaTextoCriterioFalla; 
    
    anchoListaCriterioFalla = 75;
    alturaListaCriterioFalla = 15;
    referenciaXListaCriterioFalla = referenciaXPanelAnalisis + anchoPanelAnalisis - separacionBordeVerticalPanel - anchoListaCriterioFalla;
    referenciaYListaCriterioFalla = referenciaYTextoCriterioFalla+5; 
    
    anchoTextoAcabadoSuperficial = 70;
    alturaTextoAcabadoSuperficial = 15;
    referenciaXTextoAcabadoSuperficial = referenciaXTextoCriterioFalla;
    referenciaYTextoAcabadoSuperficial = referenciaYTextoCriterioFalla - alturaTextoAcabadoSuperficial - separacionBordeHorizontalVentana-10; 
    
    anchoListaAcabadoSuperficial = 75;
    alturaListaAcabadoSuperficial = 15;
    referenciaXListaAcabadoSuperficial = referenciaXPanelAnalisis + anchoPanelAnalisis - separacionBordeVerticalPanel - anchoListaAcabadoSuperficial;
    referenciaYListaAcabadoSuperficial = referenciaYTextoAcabadoSuperficial+5; 
    
    anchoTextoFactorTipoCarga = 100;
    alturaTextoFactorTipoCarga = 15;
    referenciaXTextoFactorTipoCarga = referenciaXTextoCriterioFalla;
    referenciaYTextoFactorTipoCarga = referenciaYTextoAcabadoSuperficial - alturaTextoFactorTipoCarga - separacionBordeHorizontalVentana-10;
    
    anchoListaFactorTipoCarga = 70;
    alturaListaFactorTipoCarga = 15;
    referenciaXListaFactorTipoCarga = referenciaXPanelAnalisis + anchoPanelAnalisis - separacionBordeVerticalPanel - anchoListaFactorTipoCarga;
    referenciaYListaFactorTipoCarga = referenciaYTextoFactorTipoCarga+5;
    
    anchoTextoFactorTemperatura = 100;
    alturaTextoFactorTemperatura = 15;
    referenciaXTextoFactorTemperatura = referenciaXTextoCriterioFalla;
    referenciaYTextoFactorTemperatura = referenciaYTextoFactorTipoCarga - alturaTextoFactorTemperatura - separacionBordeHorizontalVentana-10; 
    
    anchoListaFactorTemperatura = 60;
    alturaListaFactorTemperatura = 15;
    referenciaXListaFactorTemperatura = referenciaXPanelAnalisis + anchoPanelAnalisis - separacionBordeVerticalPanel - anchoListaFactorTemperatura;
    referenciaYListaFactorTemperatura = referenciaYTextoFactorTemperatura +5;
    
    
    anchoTextoFactorConfiabilidad = 100;
    alturaTextoFactorConfiabilidad = 15;
    referenciaXTextoFactorConfiabilidad = referenciaXTextoCriterioFalla;
    referenciaYTextoFactorConfiabilidad = referenciaYListaFactorTemperatura - alturaTextoFactorConfiabilidad - separacionBordeHorizontalVentana-5-10;
    
    anchoListaFactorConfiabilidad = 65;
    alturaListaFactorConfiabilidad =15;
    referenciaXListaFactorConfiabilidad = referenciaXPanelAnalisis + anchoPanelAnalisis - separacionBordeVerticalPanel - anchoListaFactorConfiabilidad;
    referenciaYListaFactorConfiabilidad = referenciaYTextoFactorConfiabilidad + 5;
   
    anchoTextoFactorEfectosVarios = 100;
    alturaTextoFactorEfectosVarios = 15;
    referenciaXTextoFactorEfectosVarios = referenciaXTextoCriterioFalla;
    referenciaYTextoFactorEfectosVarios = referenciaYListaFactorConfiabilidad - alturaTextoFactorConfiabilidad - separacionBordeHorizontalVentana-5-10;
    
    anchoListaFactorEfectosVarios = 40;
    alturaListaFactorEfectosVarios = 20;
    referenciaXListaFactorEfectosVarios = referenciaXPanelAnalisis + anchoPanelAnalisis - separacionBordeVerticalPanel - anchoListaFactorEfectosVarios;
    referenciaYListaFactorEfectosVarios = referenciaYTextoFactorEfectosVarios;
    
    
    elementoADarFormato = varargin{1};
    propiedad = varargin{2};
    
    switch elementoADarFormato
        
        case 'ventanaPrincipal'
            
            
            switch propiedad
                
                
                case 'ancho'
                    
                    datoSolicitado = anchoVentanaOpciones;
                    
                case 'altura'
                    
                    datoSolicitado = alturaVentanaOpciones;
                    
            end
            
        case 'panelInformacionGeneral'
            
           
            switch propiedad
                
                
                case 'referenciaX'
                    
                    datoSolicitado = referenciaXPanelInformacionGeneral;
                                  
                case 'referenciaY'
                    
                    datoSolicitado = referenciaYPanelInformacionGeneral;
                                    
                    
                case 'ancho'
                    
                    datoSolicitado = anchoPanelInformacionGeneral;
                    
                case 'altura'
                    
                    datoSolicitado = alturaPanelInformacionGeneral;
                    
            end
                
        case 'textoNombreProyecto'
            
            switch propiedad
            
                case 'referenciaX'
                    
                    datoSolicitado = referenciaXTextoNombreProyecto;
                                  
                case 'referenciaY'
                    
                    datoSolicitado = referenciaYTextoNombreProyecto;
                                    
                    
                case 'ancho'
                    
                    datoSolicitado = anchoTextoNombreProyecto;
                    
                case 'altura'
                    
                    datoSolicitado = alturaTextoNombreProyecto;
                    
            end
            
        case 'cajaTextoNombreProyecto'
            
            switch propiedad
            
                case 'referenciaX'
                    
                    datoSolicitado = referenciaXCajaTextoNombreProyecto;
                                  
                case 'referenciaY'
                    
                    datoSolicitado = referenciaYCajaTextoNombreProyecto;
                                    
                    
                case 'ancho'
                    
                    datoSolicitado = anchoCajaNombreProyecto;
                    
                case 'altura'
                    
                    datoSolicitado = alturaCajaNombreProyecto;
                    
            end
            
            
        case 'ubicacionProyecto'
            
            switch propiedad
                
                
                case 'referenciaX'
                    
                    datoSolicitado = referenciaXTextoUbicacionProyecto;
                                  
                case 'referenciaY'
                    
                    datoSolicitado = referenciaYTextoUbicacionProyecto;
                                    
                    
                case 'ancho'
                    
                    datoSolicitado = anchoTextoUbicacionProyeto;
                    
                case 'altura'
                    
                    datoSolicitado = alturaTextoUbicacionProyecto;
                    
            end
            
        case 'cajaUbicacionProyecto'
            
            switch propiedad
                                
                case 'referenciaX'
                    
                    datoSolicitado = referenciaXCajaUbicacionProyecto;
                                  
                case 'referenciaY'
                    
                    datoSolicitado = referenciaYCajaUbicacionProyecto;
                                    
                    
                case 'ancho'
                    
                    datoSolicitado = anchoCajaUbicacionProyeto;
                    
                case 'altura'
                    
                    datoSolicitado = alturaCajaUbicacionProyecto;
                    
            end
            
        case 'botonAbrirDirectorio'
            
            switch propiedad
                                
                case 'referenciaX'
                    
                    datoSolicitado = referenciaXBotonCambiarDirectorio;
                                  
                case 'referenciaY'
                    
                    datoSolicitado = referenciaYBotonCambiarDirectorio;
                                    
                    
                case 'ancho'
                    
                    datoSolicitado = anchoBotonCambiarDirectorioUbicacion;
                    
                case 'altura'
                    
                    datoSolicitado = alturaBotonCambiarDirectorioUbicacion;
                    
            end
            
        case 'botonCerrarVentanaOpciones'
            
            switch propiedad
                                
                case 'referenciaX'
                    
                    datoSolicitado = referenciaXBotonCerrarVentanaOpciones;
                                  
                case 'referenciaY'
                    
                    datoSolicitado = referenciaYBotonCerrarVentanaOpciones;
                                    
                    
                case 'ancho'
                    
                    datoSolicitado = anchoBotonCerrarVentanaOpciones;
                    
                case 'altura'
                    
                    datoSolicitado = alturaBotonCerrarVentanaOpciones;
                    
            end
            

    
             case 'botonAceptarVentanaOpciones'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXBotonAceptarVentanaOpciones;

                        case 'referenciaY'

                            datoSolicitado = referenciaYBotonAceptarVentanaOpciones;


                        case 'ancho'

                            datoSolicitado = anchoBotonAceptarVentanaOpciones;

                        case 'altura'

                            datoSolicitado = alturaBotonAceptarVentanaOpciones;

                    end
                    
              case 'panelMaterial'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXPanelMaterial;

                        case 'referenciaY'

                            datoSolicitado = referenciaYPanelMaterial;


                        case 'ancho'

                            datoSolicitado = anchoPanelMaterial;

                        case 'altura'

                            datoSolicitado = alturaPanelMaterial;

                    end
                    
                case 'textoSeleccionMaterial'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXTextoSeleccionMaterial;

                        case 'referenciaY'

                            datoSolicitado = referenciaYTextoSeleccionMaterial;


                        case 'ancho'

                            datoSolicitado = anchoTextoSeleccionMaterial;

                        case 'altura'

                            datoSolicitado = alturaTextoSeleccionMaterial;

                    end
                    
                case 'listaMateriales'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXListaMateriales;

                        case 'referenciaY'

                            datoSolicitado = referenciaYListaMateriales;


                        case 'ancho'

                            datoSolicitado = anchoListaMateriales;

                        case 'altura'

                            datoSolicitado = alturaListaMateriales;

                    end
                    
                case 'panelAnalisis'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXPanelAnalisis;

                        case 'referenciaY'

                            datoSolicitado = referenciaYPanelAnalisis;


                        case 'ancho'

                            datoSolicitado = anchoPanelAnalisis;

                        case 'altura'

                            datoSolicitado = alturaPanelAnalisis;

                    end
                    
                case 'textoCriterioFalla'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXTextoCriterioFalla;

                        case 'referenciaY'

                            datoSolicitado = referenciaYTextoCriterioFalla;


                        case 'ancho'

                            datoSolicitado = anchoTextoCriterioFalla;

                        case 'altura'

                            datoSolicitado = alturaTextoCriterioFalla;

                    end
                    
                case 'listaCriterioFalla'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXListaCriterioFalla;

                        case 'referenciaY'

                            datoSolicitado = referenciaYListaCriterioFalla;


                        case 'ancho'

                            datoSolicitado = anchoListaCriterioFalla;

                        case 'altura'

                            datoSolicitado = alturaListaCriterioFalla;

                    end
                    
                case 'textoEsfuerzoFluencia'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXTextoEsfuerzoFluencia;

                        case 'referenciaY'

                            datoSolicitado = referenciaYTextoEsfuerzoFluencia;


                        case 'ancho'

                            datoSolicitado = anchoTextoEsfuerzoFluencia;

                        case 'altura'

                            datoSolicitado = alturaTextoEsfuerzoFluencia;

                    end
                    
             case 'textoEsfuerzoUltimo'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXTextoEsfuerzoUltimo;

                        case 'referenciaY'

                            datoSolicitado = referenciaYTextoEsfuerzoUltimo;


                        case 'ancho'

                            datoSolicitado = anchoTextoEsfuerzoUltimo;

                        case 'altura'

                            datoSolicitado = alturaTextoEsfuerzoUltimo;

                    end
                    
                    
                case 'textoAcabadoSuperficial'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXTextoAcabadoSuperficial;

                        case 'referenciaY'

                            datoSolicitado = referenciaYTextoAcabadoSuperficial;


                        case 'ancho'

                            datoSolicitado = anchoTextoAcabadoSuperficial;

                        case 'altura'

                            datoSolicitado = alturaTextoAcabadoSuperficial;

                    end
                    
                    
                case 'acabadoSuperficial'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXListaAcabadoSuperficial;

                        case 'referenciaY'

                            datoSolicitado = referenciaYListaAcabadoSuperficial;


                        case 'ancho'

                            datoSolicitado = anchoListaAcabadoSuperficial;

                        case 'altura'

                            datoSolicitado = alturaListaAcabadoSuperficial;

                    end
                    
                case 'textoTipoCarga'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXTextoFactorTipoCarga;

                        case 'referenciaY'

                            datoSolicitado = referenciaYTextoFactorTipoCarga;


                        case 'ancho'

                            datoSolicitado = anchoTextoFactorTipoCarga;

                        case 'altura'

                            datoSolicitado = alturaTextoFactorTipoCarga;

                    end
                    
                case 'textoFactorTemperatura'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXTextoFactorTemperatura;

                        case 'referenciaY'

                            datoSolicitado = referenciaYTextoFactorTemperatura;


                        case 'ancho'

                            datoSolicitado = anchoTextoFactorTemperatura;

                        case 'altura'

                            datoSolicitado = alturaTextoFactorTemperatura;

                    end
                    
                 case 'tipoCarga'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXListaFactorTipoCarga;

                        case 'referenciaY'

                            datoSolicitado = referenciaYListaFactorTipoCarga;


                        case 'ancho'

                            datoSolicitado = anchoListaFactorTipoCarga;

                        case 'altura'

                            datoSolicitado = alturaListaFactorTipoCarga;

                    end
                    
                 case 'factorTemperatura'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXListaFactorTemperatura;

                        case 'referenciaY'

                            datoSolicitado = referenciaYListaFactorTemperatura;


                        case 'ancho'

                            datoSolicitado = anchoListaFactorTemperatura;

                        case 'altura'

                            datoSolicitado = alturaListaFactorTemperatura;

                    end
                    
                case 'textoFactorConfiabilidad'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXTextoFactorConfiabilidad;

                        case 'referenciaY'

                            datoSolicitado = referenciaYTextoFactorConfiabilidad;

                        case 'ancho'

                            datoSolicitado = anchoTextoFactorConfiabilidad;

                        case 'altura'

                            datoSolicitado = alturaTextoFactorConfiabilidad;

                    end
                    
                case 'factorConfiabilidad'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXListaFactorConfiabilidad;

                        case 'referenciaY'

                            datoSolicitado = referenciaYListaFactorConfiabilidad;

                        case 'ancho'

                            datoSolicitado = anchoListaFactorConfiabilidad;

                        case 'altura'

                            datoSolicitado = alturaListaFactorConfiabilidad;

                    end
                    
                case 'textoFactorEfectosVarios'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXTextoFactorEfectosVarios;

                        case 'referenciaY'

                            datoSolicitado = referenciaYTextoFactorEfectosVarios;

                        case 'ancho'

                            datoSolicitado = anchoTextoFactorEfectosVarios;

                        case 'altura'

                            datoSolicitado = alturaTextoFactorEfectosVarios;

                    end
                    
                case 'factorEfectosVarios'

                    switch propiedad

                        case 'referenciaX'

                            datoSolicitado = referenciaXListaFactorEfectosVarios;

                        case 'referenciaY'

                            datoSolicitado = referenciaYListaFactorEfectosVarios;

                        case 'ancho'

                            datoSolicitado = anchoListaFactorEfectosVarios;

                        case 'altura'

                            datoSolicitado = alturaListaFactorEfectosVarios;

                    end
    end

end