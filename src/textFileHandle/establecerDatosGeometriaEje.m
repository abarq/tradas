function Geometria = establecerDatosGeometriaEje(InformacionArchivoTexto)

    DatosSegmentos = textscan(InformacionArchivoTexto.id, '%f %f %f', 'HeaderLines', 2);
    
    Geometria.SegmentoRecto = establecerSegmentos(DatosSegmentos);
    
    Geometria.SegmentoRecto = unirSegmentosRectosSeguidosIdenticos(Geometria.SegmentoRecto);
    
    Geometria.RadiosFiletes = establecerRadiosFiletes(DatosSegmentos);
    %RadiosFiletes = textscan(InformacionArchivoTexto.id, '%f', 'HeaderLines',2);
    
    %Geometria.RadiosFiletes = cell2mat(RadiosFiletes);
    Geometria.informacionValida = verificarInformacionArchivoTexto(Geometria);
    
end

function SegmentoRecto = establecerSegmentos(Datos)

    nSegmentos = numel(Datos{1});
    SegmentoRecto.cantidad = nSegmentos;

    for i=1:nSegmentos
        
       SegmentoRecto.longitud(i) = Datos{1}(i); 
       SegmentoRecto.diametro(i) = Datos{2}(i); 
                
    end
        
end

function informacionValida = verificarInformacionArchivoTexto(Geometria)

    sonValoresSegmentosMayoresACero = ~any(Geometria.SegmentoRecto.longitud <= 0);
    sonValoresLongitudesMayoresACero = ~any(Geometria.SegmentoRecto.diametro <= 0);
    sonValoresRadiosFiletesMayoresACero = ~any(Geometria.RadiosFiletes <= 0);    
    
    sonCantidadRadiosFiletesAdecuados = (numel(Geometria.RadiosFiletes) == numel(Geometria.SegmentoRecto.longitud)-1);
    informacionValida = sonValoresSegmentosMayoresACero && sonValoresLongitudesMayoresACero && sonValoresRadiosFiletesMayoresACero && sonCantidadRadiosFiletesAdecuados;
end

function SegmentoRecto = unirSegmentosRectosSeguidosIdenticos(SegmentoRecto)

    nSegmentoRecto = numel(SegmentoRecto.longitud());
    
    nCantidadSegmentos = nSegmentoRecto -1;
    n=1;
    while n <= nCantidadSegmentos
        
       if SegmentoRecto.diametro(n) == SegmentoRecto.diametro(n+1)
           
          nuevoLargo = SegmentoRecto.longitud(n) + SegmentoRecto.longitud(n+1);
          SegmentoRecto.longitud(n) = nuevoLargo;
          SegmentoRecto.longitud(n+1) = [];
          SegmentoRecto.diametro(n+1) = [];
          nCantidadSegmentos =  nCantidadSegmentos-1;
                    
       else
           
           n = n+1;
           
       end
                
    end
    SegmentoRecto.cantidad = numel(SegmentoRecto.longitud);
    
end


function RadiosFiletes = establecerRadiosFiletes(Datos)

    nRadios = numel(Datos{1})-1;
    RadiosFiletes = zeros(1,nRadios);
    
    for i=1:nRadios
        
       RadiosFiletes(i) = Datos{3}(i);
                
    end

end