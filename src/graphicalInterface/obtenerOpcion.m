function valorNumerico = obtenerOpcion()

    esOpcionValida = 0;
    
    while(~esOpcionValida)

        Opcion = solicitarOpcionAUsuario();
        esOpcionValida = Opcion.esNumerico;
        
    end
    
    valorNumerico = Opcion.valor;
    clc;
        
end

function Opcion = solicitarOpcionAUsuario()

        Opcion.valor = input('Ingresa alguna de las dos opciones:\n1) RealizarAnalisis\n2) Salir\n\n', 's');
        Opcion.valor = str2double(Opcion.valor);
        Opcion.esNumerico = esNumericoOpcion(Opcion.valor);
        
end

% function variableCentinela = verificarOpcion(opcion)
% 
%     if((opcion == 1 || opcion == 2))
% 
%         variableCentinela = 1;
% 
%     else
% 
%         disp('Opcion incorrecta, digite de nuevo un valor de entrada');
%         variableCentinela = 0;
% 
%     end
% 
% end

function esNumerico = esNumericoOpcion(valor)

    if isnan(valor)
        
        esNumerico = 0;
        
    else
        esNumerico = 1;
        
    end

end
