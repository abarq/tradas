function FactoresConcentracionEsfuerzo = obtenerFactoresConcentracionEsfuerzoEje(Geometria)

    FactoresConcentracionEsfuerzo.Escalon = calcularFactorConcentracionEsfuerzoPorEscalon(Geometria);
    %FactoresConcentracionEsfuerzo.Cuna = calcularFactorConcentracionEsfuerzoCuna(Geometria);
    FactoresConcentracionEsfuerzo.cantidad = numel(FactoresConcentracionEsfuerzo.Escalon);   
end


function Escalon = calcularFactorConcentracionEsfuerzoPorEscalon(Geometria)

     nSegmentosRectos = Geometria.SegmentoRecto.cantidad;
     for i=1:nSegmentosRectos-1;
    
        %En este programa se emplean las ecuaciones param�tricas obtenidos por Noda para el c�lculo del 
        %factor de concentraci�n de esfuerzo. El art�culo original es:
        %
         
        Escalon(i).Dimensiones = Geometria.Escalon(i);
        
        Escalon(i).flexion = obtenerSCFNoda('EscalonEje','flexion', Escalon(i).Dimensiones);    
        Escalon(i).torsion = obtenerSCFNoda('EscalonEje', 'torsion', Escalon(i).Dimensiones);
        
        %obtenerSCFSegunNoda()
        
        %Si se desea emplear las ecuaciones param�tricas obtenidas por
        %Peterson, solo se debe desactivar los �ltimos dos rengloes y
        %activar los siguientes dos.
        
        
        %Escalon(i).flexion = obtenerSCFPeterson('EscalonEje','flexion', Escalon(i).Dimensiones);    
        %Escalon(i).torsion = obtenerSCFPeterson('EscalonEje', 'torsion', Escalon(i).Dimensiones);
    end
    
end
