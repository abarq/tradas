function ConstantesIntegracion = determinarConstantesIntegracion(deflexion,Transmision, ejeDividido)

    largoEjeDiscretizado = ejeDividido;
    ubicacionCojinetes = Transmision.Cojinetes.PlanoXY.ubicacion;
    
    indiceUbicacionCojineteUno = encontrarValorEnArreglo(largoEjeDiscretizado,ubicacionCojinetes(1));
    indiceUbicacionCojineteDos = encontrarValorEnArreglo(largoEjeDiscretizado,ubicacionCojinetes(2));

    valorDeflexionCojineteUno = deflexion(indiceUbicacionCojineteUno);
    valorDeflexionCojineteDos = deflexion(indiceUbicacionCojineteDos);
    
    C1 = (valorDeflexionCojineteDos - valorDeflexionCojineteUno)/(ubicacionCojinetes(1) - ubicacionCojinetes(2));
    C2 = -valorDeflexionCojineteDos - ubicacionCojinetes(2) * C1;
    
    ConstantesIntegracion.C1 = C1;
    ConstantesIntegracion.C2 = C2;

end