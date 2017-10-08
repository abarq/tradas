function panelInformacionProyectoHandle = establecerPanelInformacionProyecto(ventanaOpcionesHandle)

    desfase = 5;
    
%     geometriaTextoNombreProyecto = get(textoNombreProyectoHandle, 'Position');
%     geometriaBotonBuscarCarpeta = get(botonBuscarCarpetaHandle, 'Position');
%     
%     referenciaX = geometriaTextoNombreProyecto(1);% - desfase;
%     referenciaY = geometriaBotonBuscarCarpeta(2);% - desfase;
%     anchoPanel = geometriaBotonBuscarCarpeta(1) + geometriaBotonBuscarCarpeta(3);% + 2*desfase;
%     altoPanel = geometriaTextoNombreProyecto(2) + geometriaTextoNombreProyecto(4);% + 2*desfase;

    panelInformacionProyectoHandle = uipanel(ventanaOpcionesHandle, 'Title','Informacion Proyecto','Position',[30 39 120 100]);

end