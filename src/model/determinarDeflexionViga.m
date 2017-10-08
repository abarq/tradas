function deflexion = determinarDeflexionViga(pendiente, ejeDiscretizado)

    deflexion = zeros(1,numel(pendiente));
    paso = ejeDiscretizado(2) - ejeDiscretizado(1);
    nDiscretizaciones = numel(pendiente);
       
    for i=2:nDiscretizaciones-1
    
        deflexion(i) = deflexion(i-1) + pendiente(i)*paso + (pendiente(i+1) - pendiente(i))*paso/2;
            
    end
    
    deflexion(1) = deflexion(2);
    deflexion(end) = deflexion(end-1);

end
