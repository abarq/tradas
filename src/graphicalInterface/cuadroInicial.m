function cuadroInicial

    ventanaPrincipalHandle = establecerVentanaPrincipal();
    establecerElementosGUIEnVentanaPrincipal(ventanaPrincipalHandle)
            
    Materiales = obtenerMaterialesDeEje();
    
    Handles = guidata(ventanaPrincipalHandle);
    Handles.Parametros = establecerParametrosPorDefecto(Materiales);
    Handles.ventanaHandle = ventanaPrincipalHandle;
    guidata(ventanaPrincipalHandle, Handles);
    
end

function establecerElementosGUIEnVentanaPrincipal(ventanaPrincipalHandle)

    establecerInformacionPrincipal();
    establecerFigura();
    establecerBotonAbrir();
    establecerBotonOpciones(ventanaPrincipalHandle);
    establecerBotonCerrar(ventanaPrincipalHandle);

end
