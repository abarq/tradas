function fuerzasCortantesEnViga = calcularFuerzasCortantesEnViga(CargasPuntualesExternas, vigaDiscretizada)

    fuerzasCortantesEnViga = zeros(1,numel(vigaDiscretizada));
    numeroCargasExternas = numel(CargasPuntualesExternas.magnitud);
    
    for i=1:numeroCargasExternas
    
        fuerzasCortantesEnViga = fuerzasCortantesEnViga + (vigaDiscretizada > CargasPuntualesExternas.ubicacion(i))*CargasPuntualesExternas.magnitud(i);

    end
    
end