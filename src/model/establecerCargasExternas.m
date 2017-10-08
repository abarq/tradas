function CargasExternas=  establecerCargasExternas(InformacionArchivoTexto)

    for i=1:1%EscenariosDeCarga.cantidad

        Fuerzas= textscan(InformacionArchivoTexto.id, '%f %f %f', 'HeaderLines', 2);
        CargasExternas(i).cargasExternasTransmision =  asignarCargasPuntuales(Fuerzas);
       % MomentosPuntuales = textscan(InformacionArchivoTexto.id, '%f %f %f %f %f %f','HeaderLines',2);
        MomentosPuntuales = textscan(InformacionArchivoTexto.id, '%f %f','HeaderLines',2);
        CargasExternas(i).momentosPuntuales.EjeX = asignarMomentosPuntuales(MomentosPuntuales);
        MomentosPuntuales = textscan(InformacionArchivoTexto.id, '%f %f','HeaderLines',1);
        CargasExternas(i).momentosPuntuales.EjeY = asignarMomentosPuntuales(MomentosPuntuales);
        MomentosPuntuales = textscan(InformacionArchivoTexto.id, '%f %f','HeaderLines',1);
        CargasExternas(i).momentosPuntuales.EjeZ = asignarMomentosPuntuales(MomentosPuntuales);


    end
    

end


function CargasPuntuales = asignarCargasPuntuales(Datos)

    nCargas = numel(Datos{1});
    
    for i=1:nCargas
        
       CargasPuntuales.PlanoXY.magnitud(i) = Datos{1}(i);
       CargasPuntuales.PlanoXY.ubicacion(i) = Datos{3}(i);
       CargasPuntuales.PlanoYZ.magnitud(i) = Datos{2}(i);
       CargasPuntuales.PlanoYZ.ubicacion(i) = Datos{3}(i);
%          PlanoXY.CargasPuntuales.magnitud(i) = Datos{1}(i);
%          PlanoXY.CargasPuntuales.ubicacion(i) = Datos{3}(i);
%          PlanoZX.CargasPuntuales.magnitud(i) = Datos{2}(i);
%          PlanoZX.CargasPuntuales.ubicacion(i) = Datos{3}(i);
%          EjeZ.CargasPuntuales.magnitud(i) = 0;
%          EjeZ.CargasPuntuales.ubicacion(i) = 0;
    
    end
    
end

function MomentosPuntuales = asignarMomentosPuntuales(Datos)

    nMomentos = numel(Datos{1});
    
    for i=1:nMomentos
        
%        MomentosPuntuales.EjeX.magnitud(i) = Datos{1}(i); 
%        MomentosPuntuales.EjeX.ubicacion(i) = Datos{2}(i); 
%        MomentosPuntuales.EjeY.magnitud(i) = Datos{3}(i);  
%        MomentosPuntuales.EjeY.ubicacion(i) = Datos{4}(i);
%        MomentosPuntuales.EjeZ.magnitud(i) = Datos{5}(i); 
%        MomentosPuntuales.EjeZ.ubicacion(i) = Datos{6}(i);
         MomentosPuntuales.magnitud(i) = Datos{1}(i); 
         MomentosPuntuales.ubicacion(i) = Datos{2}(i); 

       
    end
    
end
