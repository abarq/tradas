function ModeloViga = crearModelosParaAnalsis(Transmision, Parametros)

    nEscenariosDeCarga = 1;
    ejeDividido = establecerDivisiones(Transmision.Eje, Parametros);
    
    for i=1:nEscenariosDeCarga
        
         ModeloViga(i).ejeDividido = ejeDividido;
         ModeloViga(i).FuerzasCortantes = calculoFuerzasCortantes(Transmision.EscenariosDeCarga(i), ejeDividido);
         ModeloViga(i).MomentosFlectores = calcularMomentosFlectores(Transmision.EscenariosDeCarga(i), ejeDividido);
         ModeloViga(i).MomentosTorsores = calcularMomentosTorsores(Transmision.EscenariosDeCarga(i).momentosPuntuales, ejeDividido);
         ModeloViga(i).rigidezAFlexion = calcularRigidezAFlexion(Transmision.Eje, ejeDividido);
         ModeloViga(i).RazonMomentoFlectorRigidezAFlexion = calcularRazonMomentoFlectorRigidezAFlexion(ModeloViga(i).MomentosFlectores, ModeloViga(i).rigidezAFlexion);
         ModeloViga(i).PendientesSinConstantesDeIntegracion = calcularPendientesEjeSinConstantesIntegracion(ModeloViga(i).RazonMomentoFlectorRigidezAFlexion, ejeDividido);
         ModeloViga(i).DeflexionesSinConstantesDeIntegracion = calcularDeflexionesEjeSinConstantesDeIntegracion(ModeloViga(i).PendientesSinConstantesDeIntegracion, ejeDividido);
         ModeloViga(i).ConstantesIntegracion = determinarConstantesIntegracionEnPlanos(ModeloViga(i).DeflexionesSinConstantesDeIntegracion, Transmision, ejeDividido);
         ModeloViga(i).Pendiente = calcularPendientesEje(ModeloViga(i));
         ModeloViga(i).Deflexion = calcularDeflexionesEje(ModeloViga(i), ejeDividido);
         
    end
      
end

function ejeConDivisiones = establecerDivisiones(Eje, Parametros)

    ejeConDivisiones = linspace(0,Eje.largoEje,Parametros.nDivisiones);

end

function fuerzasCortantesEje = calculoFuerzasCortantes(EscenarioDeCarga, ejeConDivisiones)

    fuerzasCortantesEje.planoXY = calcularFuerzasCortantesEnViga(EscenarioDeCarga.cargasExternasYCojinetes.PlanoXY,ejeConDivisiones);
    fuerzasCortantesEje.planoYZ = calcularFuerzasCortantesEnViga(EscenarioDeCarga.cargasExternasYCojinetes.PlanoYZ,ejeConDivisiones);
    fuerzasCortantesEje.resultante = sqrt((fuerzasCortantesEje.planoXY).^2 + (fuerzasCortantesEje.planoYZ).^2);

end

function momentosFlectoresEje = calcularMomentosFlectores(EscenarioDeCarga, ejeConDivisiones)

    momentosFlectoresEje.planoXY = calcularMomentosFlectoresEnViga(EscenarioDeCarga.cargasExternasYCojinetes.PlanoXY, EscenarioDeCarga.momentosPuntuales.EjeZ, ejeConDivisiones);
    momentosFlectoresEje.planoYZ = calcularMomentosFlectoresEnViga(EscenarioDeCarga.cargasExternasYCojinetes.PlanoYZ, EscenarioDeCarga.momentosPuntuales.EjeY, ejeConDivisiones);
    momentosFlectoresEje.resultante = sqrt((momentosFlectoresEje.planoXY).^2 + (momentosFlectoresEje.planoYZ).^2);

end

function RazonMomentoRigidezFlexion = calcularRazonMomentoFlectorRigidezAFlexion(MomentosFlectores, rigidezFlexion)

    RazonMomentoRigidezFlexion.planoXY = (MomentosFlectores.planoXY)./rigidezFlexion;
    RazonMomentoRigidezFlexion.planoYZ = (MomentosFlectores.planoYZ)./rigidezFlexion;
    RazonMomentoRigidezFlexion.resultante = sqrt((RazonMomentoRigidezFlexion.planoXY).^2 + (RazonMomentoRigidezFlexion.planoYZ).^2);
    
end

function PendientesEjeSinConstantesDeIntegracion = calcularPendientesEjeSinConstantesIntegracion(RazonMomentoFlectorRigidezAFlexion, ejeDividido)

    PendientesEjeSinConstantesDeIntegracion.planoXY = determinarPendienteViga(RazonMomentoFlectorRigidezAFlexion.planoXY, ejeDividido);
    PendientesEjeSinConstantesDeIntegracion.planoYZ = determinarPendienteViga(RazonMomentoFlectorRigidezAFlexion.planoYZ, ejeDividido);
    
end

function DeflexionesEjeSinConstantesDeIntegracion = calcularDeflexionesEjeSinConstantesDeIntegracion(PendientesEjeSinConstantesDeIntegracion, ejeDividido)

    DeflexionesEjeSinConstantesDeIntegracion.planoXY = determinarDeflexionViga(PendientesEjeSinConstantesDeIntegracion.planoXY, ejeDividido);
    DeflexionesEjeSinConstantesDeIntegracion.planoYZ = determinarDeflexionViga(PendientesEjeSinConstantesDeIntegracion.planoYZ, ejeDividido);

end

function ConstantesIntegracion = determinarConstantesIntegracionEnPlanos(DeflexionesEjeSinConstantesDeIntegracion, Transmision, ejeDividido)

    ConstantesIntegracion.PlanoXY = determinarConstantesIntegracion(DeflexionesEjeSinConstantesDeIntegracion.planoXY, Transmision, ejeDividido);
    ConstantesIntegracion.PlanoYZ = determinarConstantesIntegracion(DeflexionesEjeSinConstantesDeIntegracion.planoYZ, Transmision, ejeDividido);
    
end

function Deflexion = calcularDeflexionesEje(ModeloViga, ejeDividido)

    Deflexion.planoXY = ModeloViga.DeflexionesSinConstantesDeIntegracion.planoXY + ejeDividido * ModeloViga.ConstantesIntegracion.PlanoXY.C1 + ModeloViga.ConstantesIntegracion.PlanoXY.C2;
    Deflexion.planoYZ = ModeloViga.DeflexionesSinConstantesDeIntegracion.planoYZ + ejeDividido * ModeloViga.ConstantesIntegracion.PlanoYZ.C1 + ModeloViga.ConstantesIntegracion.PlanoYZ.C2;
    Deflexion.resultante = sqrt((Deflexion.planoXY).^2 + (Deflexion.planoYZ).^2);

end

function Pendientes = calcularPendientesEje(ModeloViga)

    Pendientes.planoXY = ModeloViga.PendientesSinConstantesDeIntegracion.planoXY + ModeloViga.ConstantesIntegracion.PlanoXY.C1;
    Pendientes.planoYZ = ModeloViga.PendientesSinConstantesDeIntegracion.planoYZ + ModeloViga.ConstantesIntegracion.PlanoYZ.C1;
    Pendientes.resultante = sqrt((Pendientes.planoXY).^2 + (Pendientes.planoYZ).^2);

end