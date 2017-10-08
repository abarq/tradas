function datoSolicitado = darFormatoInterfazGrafica(varargin)

    vista = varargin{1};
   
    switch vista
        
        case 'Inicio'
            
            
            
        case 'Opciones'
            
            subVista = varargin{2};
            
            switch subVista
                
                case 'ventanaPrincipal'
                    
                    dato = varargin{3};
                    
                    switch dato
                        
                        case 'ancho'
                            
                            datoSolicitado = 400;
                            
                        case 'alto'
                    
                            datoSolicitado = 300;
                            
                    end
                    
            end
            
            
            
    end
        


end