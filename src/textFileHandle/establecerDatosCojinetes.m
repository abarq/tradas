function Cojinetes = establecerDatosCojinetes(ArchivoTexto)

    Datos = textscan(ArchivoTexto.id, '%f %f', 'HeaderLines', 2);

    Cojinetes = asignarCargasCojinetes(Datos);

end

function CargasCojinetes = asignarCargasCojinetes(Datos)

    nCojinetes = numel(Datos{1});
    
    for i=1:nCojinetes
        
       CargasCojinetes.PlanoXY.magnitud(i) = 0;
       CargasCojinetes.PlanoXY.ubicacion(i) = Datos{2}(i);
       CargasCojinetes.PlanoYZ.magnitud(i) = 0;
       CargasCojinetes.PlanoYZ.ubicacion(i) = Datos{2}(i);
                
    end
    
end