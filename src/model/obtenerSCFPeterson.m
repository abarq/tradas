function kt = obtenerSCFPeterson(geometria, tipoCarga, Dimensiones)

    switch geometria
        
        case 'EscalonEje'
            
            kt = tipoCargaEje(tipoCarga, Dimensiones);
        
        case 'Cuna'
           
            kt = tipoCargaCunha(tipoCarga, Dimensiones);
            
        case 'ranura'
            
    end
end

function kt = tipoCargaEje(tipoCarga, Dimensiones)

    %Dimensiones.diametroMayor
    h = (Dimensiones.diametroMayor - Dimensiones.diametroMenor)/2;
    hr = h/Dimensiones.radioFilete;

    dosHD = 2 * h /Dimensiones.diametroMayor;
    
     switch tipoCarga
            
           case 'flexion'
                    
                    if (hr >= 0.1 && hr <= 2)
                    	
                        C1 = 0.947 + 1.206 * sqrt(hr) - 0.131 * hr;
                        C2 = 0.022 - 3.405 * sqrt(hr) + 0.915 * hr;
                        C3 = 0.869 + 1.777 * sqrt(hr) - 0.555 * hr;
                        C4 = -0.810 + 0.422* sqrt(hr) - 0.260 * hr;
                        
                    else if (hr > 2 && hr <= 20)
                            
                            C1 = 1.232 + 0.832 * sqrt(hr) - 0.008 * hr;
                            C2 = -3.813 + 0.968 * sqrt(hr) -0.260 * hr;
                            C3 = 7.423 - 4.868 * sqrt(hr) + 0.869 * hr;
                            C4 = -3.839 + 3.070 * sqrt(hr) - 0.600 * hr;
                            
                        else
                            
                            printf('Relación h/r fuera de ambito permitido');
                            
                        end
                        
                    end
                    
                    kt = C1 + C2 * dosHD + C3 * dosHD^2 + C4 * dosHD^3;

           case 'torsion'
                    
                    
                    if (hr >= 0.15 && hr <= 4)
                        
                        C1 = 0.905 + 0.783 * sqrt(hr) - 0.075 * hr;
                        C2 = -0.437 - 1.969 * sqrt(hr) + 0.553 * hr;
                        C3 = 1.557 + 1.073 * sqrt(hr) -0.578 * hr;
                        C4 = -1.061 + 0.171 * sqrt(hr) + .086 * hr;
                        
                    else 
                        
                        %Falta agregar mensaje de error aca.
                    end
                    
                    kt = C1 + C2 * dosHD + C3 * dosHD^2 + C4 * dosHD^3;
                    
           case 'axial'
                    
                    kt = 0.1;
                    
      end

end
