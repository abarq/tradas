function datoSolicitado = darFormatoGUIVentanaInicio(varargin)

    goldenRatio = 1.618;
    anchoVentana = 350;
    alturaVentana = anchoVentana/goldenRatio;
    anchoBoton = 65;
    alturaBoton = 25;
    separacionBordeHorizontal = 20;
    anchoCajaTextoTitulo = 275;
    alturaCajaTextoTitulo = 25;
    ubicacionVerticalCajaTextoTitulo =alturaVentana/2 + 2.5*alturaCajaTextoTitulo;
    ubicacionHorizontalCajaTextoTitulo = anchoVentana/2 - anchoCajaTextoTitulo/2;
    
    
    elementoADarFormato = varargin{1};
    propiedad = varargin{2};

    
    switch elementoADarFormato
        
        case 'ventanaPrincipal'
            
            
            switch propiedad
                
                
                case 'ancho'
                    
                    datoSolicitado = anchoVentana;
                    
                case 'altura'
                    
                    datoSolicitado = alturaVentana;
                    
            end
            
        case 'botonOpen'
            
           
            switch propiedad
                
                
                case 'referenciaX'
                    
                    datoSolicitado = separacionBordeHorizontal;
                                  
                case 'referenciaY'
                    
                    datoSolicitado = separacionBordeHorizontal;
                                    
                    
                case 'ancho'
                    
                    datoSolicitado = anchoBoton;
                    
                case 'altura'
                    
                    datoSolicitado = alturaBoton;
                    
            end
                
                
                
            
            
        case 'botonClose'
            
            
            
        case 'botonOptions'
            
            
        case 'titulo'
            
            switch propiedad
                
                
                case 'referenciaX'
                    
                    datoSolicitado = ubicacionHorizontalCajaTextoTitulo;
                                  
                case 'referenciaY'
                    
                    datoSolicitado = ubicacionVerticalCajaTextoTitulo;
                                    
                    
                case 'ancho'
                    
                    datoSolicitado = anchoCajaTextoTitulo;
                    
                case 'altura'
                    
                    datoSolicitado = alturaCajaTextoTitulo;
                    
            end
            
        case 'textoDescripcionUno'
            
            
        case 'textoDescripcionDos'
            
            
    end 



end