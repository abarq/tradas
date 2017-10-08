function finalizarPrograma = ejecutarAccionAPartirdeOpcion(opcion)

    switch opcion
        
        case 1
            
            finalizarPrograma = iniciarAnalisis();
            
        case 2
            
            establecerParametros();
            
        case 3

            finalizarPrograma = 1;
    end
%     
%     
%         if(esOpcionValida(opcion))
%                        
%             archivoTextoValido = 1;
%             
%             while(archivoTextoValido)
%             
%                ArchivoTexto = solicitarArchivoTexto(); 
%                
%                if(verificarArchivoTextoCompleto(ArchivoTexto.direccion) && dioClickAceptar(ArchivoTexto.indiceCancel))
%                                                        
%                      %ejecutarAnalisis();
%                      %mostrarResultados();
%                      
%                      disp('\n\nEJECUTANDO ANALISIS\n\n');
%                      
%                      finalizarPrograma = 1;
%                      archivoTextoValido = 0;
%                                             
%                                      
%                else if ~dioClickAceptar(ArchivoTexto.indiceCancel)
%                        
%                        archivoTextoValido = 0;
%                        
%                    end
%                    
%                end
%                    
%             end
%             
%         else
%             
%            finalizarPrograma = 1; 
%                         
%         end
%     
% end
% 
% 
% 
% function click = dioClickAceptar(indice)
% 
%     click = 0;
%     if indice == 1
%        
%         click = 1;
%         
%     end
% 
% end
% 
% 
% function opcionValida = esOpcionValida(opcion)
% 
%     opcionValida = 0;
%     
%     if opcion == 1
%         
%        opcionValida = 1; 
%                 
%     end
% 
% end
% 
% function archivoCompleto = verificarArchivoTextoCompleto(direccion)
% 
%     archivoCompleto = 0;
%     
%     if ~isempty(direccion)
%         
%         archivoCompleto = 1;
%         
%     end
% 
% end
