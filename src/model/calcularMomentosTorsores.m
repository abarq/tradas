function momentosTorsoresEnViga = calcularMomentosTorsores(MomentosTorsores, vigaDiscretizada)

    momentosTorsoresEnViga = zeros(1,numel(vigaDiscretizada));
    numeroCargasExternas = numel(MomentosTorsores.EjeX.magnitud);
    
    for i=1:numeroCargasExternas
    
        momentosTorsoresEnViga = momentosTorsoresEnViga + (vigaDiscretizada > MomentosTorsores.EjeX.ubicacion(i))*MomentosTorsores.EjeX.magnitud(i);

    end
    
end