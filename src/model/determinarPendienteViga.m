function deflexion = determinarPendienteViga(relacionMomentoFlectorRigidezAFlexion, ejeDiscretizado)

    deflexion = zeros(1,numel(relacionMomentoFlectorRigidezAFlexion));
    paso = ejeDiscretizado(2) - ejeDiscretizado(1);
    nDiscretizaciones = numel(relacionMomentoFlectorRigidezAFlexion);
    MEntreEI = relacionMomentoFlectorRigidezAFlexion;
    
    for i=2:nDiscretizaciones-1
    
        deflexion(i) = deflexion(i-1) + MEntreEI(i)*paso + (MEntreEI(i+1) - MEntreEI(i))*paso/2;
            
    end
    deflexion(1) = deflexion(2);
    deflexion(end) = deflexion(end-1);

end
