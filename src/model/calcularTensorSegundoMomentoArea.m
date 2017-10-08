function tensorSegundoMomentoArea = calcularTensorSegundoMomentoArea(figuraGeometrica, Dimensiones)

    switch figuraGeometrica
        
        case 'circulo'
           
            Ixx = pi/4*Dimensiones.radioExterno^4;
            Iyy = Ixx;
            Izz = Iyy + Ixx;
            tensorSegundoMomentoArea = [Ixx 0 0; 0 Iyy 0; 0 0 Izz];
            
        case 'circuloHueco'
            
            tensorSegundoMomentoArea = pi/4*(Dimensiones.radioExterno^4 - Dimensiones.radioInterno^4); 
            
        case 'cuadrado'
            
            tensorSegundoMomentoArea = 1/12 * Dimensiones.lado^4;
    end
    
end

