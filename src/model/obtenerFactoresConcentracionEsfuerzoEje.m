function FactoresConcentracionEsfuerzo = obtenerFactoresConcentracionEsfuerzoEje(Geometria)

    FactoresConcentracionEsfuerzo.Escalon = calcularFactorConcentracionEsfuerzoPorEscalon(Geometria);
    %FactoresConcentracionEsfuerzo.Cuna = calcularFactorConcentracionEsfuerzoCuna(Geometria);
    FactoresConcentracionEsfuerzo.cantidad = numel(FactoresConcentracionEsfuerzo.Escalon);   
end


function Escalon = calcularFactorConcentracionEsfuerzoPorEscalon(Geometria)

     nSegmentosRectos = Geometria.SegmentoRecto.cantidad;
     for i=1:nSegmentosRectos-1;
    
        %En este programa se emplean las ecuaciones paramétricas obtenidos por Noda para el cálculo del 
        %factor de concentración de esfuerzo. El artículo original es:
        %
         
        Escalon(i).Dimensiones = Geometria.Escalon(i);
        
        Escalon(i).flexion = obtenerSCFNoda('EscalonEje','flexion', Escalon(i).Dimensiones);    
        Escalon(i).torsion = obtenerSCFNoda('EscalonEje', 'torsion', Escalon(i).Dimensiones);
        
        %obtenerSCFSegunNoda()
        
        %Si se desea emplear las ecuaciones paramétricas obtenidas por
        %Peterson, solo se debe desactivar los últimos dos rengloes y
        %activar los siguientes dos.
        
        
        %Escalon(i).flexion = obtenerSCFPeterson('EscalonEje','flexion', Escalon(i).Dimensiones);    
        %Escalon(i).torsion = obtenerSCFPeterson('EscalonEje', 'torsion', Escalon(i).Dimensiones);
    end
    
end
