function EscenariosDeCarga = establecerEscenariosDeCarga(Transmision)

%     EscenariosDeCarga = zeros(1,1); %TO-DO : Modificarlo para que reconozca varios escenarios de carga.
%     EscenariosDeCarga.cantidad = numel(EscenariosDeCarga);
      CargasExternas = Transmision.CargasExternas;
    for i=1:1%EscenariosDeCarga.cantidad
        
%         Fuerzas= textscan(InformacionArchivoTexto.id, '%f %f %f', 'HeaderLines', 2);
%         EscenariosDeCarga(i).cargasExternasTransmision =  asignarCargasPuntuales(Fuerzas);
%         MomentosPuntuales = textscan(InformacionArchivoTexto.id, '%f %f %f %f %f %f','HeaderLines',2);
        EscenariosDeCarga(i).momentosPuntuales = CargasExternas(i).momentosPuntuales;
        EscenariosDeCarga(i).cargasCojinetes.PlanoXY = obtenerCargasCojinetes(CargasExternas(i).cargasExternasTransmision.PlanoXY, CargasExternas(i).momentosPuntuales.EjeZ, Transmision.Cojinetes.PlanoXY);
        EscenariosDeCarga(i).cargasCojinetes.PlanoYZ = obtenerCargasCojinetes(CargasExternas(i).cargasExternasTransmision.PlanoYZ, CargasExternas(i).momentosPuntuales.EjeY, Transmision.Cojinetes.PlanoYZ);
        EscenariosDeCarga(i).cargasExternasYCojinetes.PlanoXY = obtenerTodasLasFuerzasEnPlano(CargasExternas(i).cargasExternasTransmision.PlanoXY, EscenariosDeCarga(i).cargasCojinetes.PlanoXY);
        EscenariosDeCarga(i).cargasExternasYCojinetes.PlanoYZ = obtenerTodasLasFuerzasEnPlano(CargasExternas(i).cargasExternasTransmision.PlanoYZ, EscenariosDeCarga(i).cargasCojinetes.PlanoYZ);
        EscenariosDeCarga(i).momentoTorsorMaximo = max(CargasExternas(i).momentosPuntuales.EjeY.magnitud); 
        
    end
    
    
end
