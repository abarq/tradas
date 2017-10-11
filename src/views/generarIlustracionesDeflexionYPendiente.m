function generarIlustracionesDeflexionYPendiente(ModeloViga, Transmision, Parametros)
    
    nCasos = numel(Transmision.EscenariosDeCarga);
     
    for i=1:nCasos
    
        ejeDividido = ModeloViga(i).ejeDividido;
        longitudEje = max(ejeDividido);
        figure('Position', [10000, 10000, 450, 600], 'visible', 'off');
        movegui(gcf, 'center');
        set(gcf,'color','w');
        bosquejoEjeCojinetes(Transmision,ejeDividido);
      
        subplot(3,1,3);
        deflexion = ModeloViga(i).Deflexion.resultante;
        plot(ejeDividido, deflexion);
        title('Shaft deflection');
        xlabel('Length (m)');
        ylabel('Deflection (m)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);

        subplot(3,1,2);
        pendiente = ModeloViga(i).Pendiente.resultante;
        plot(ejeDividido, pendiente);
        title('Shaft slope');
        xlabel('Length (m)');
        ylabel('Slope (rad)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        nombre = 'DeflexionesYPendientes';
        terminal = '.png';

        nombreUbicacion = Parametros.ubicacionResultados;
        nombreDirectorio = Parametros.nombreDefectoProyecto;

        mkdir([nombreUbicacion,'\',nombreDirectorio]); 
        nombreArchivo = strcat(nombreUbicacion,'\',nombreDirectorio,'\',nombre,terminal);
          
        h = gcf;
        h.PaperUnits = 'inches';
        h.PaperPosition = [0 0 4 6];
        print(h,nombreArchivo,'-dpng','-r0');
    
%         figure()
%         x = ModeloViga(i).MomentosFlectores.resultante; 
%         plot(ejeDividido, x);
%         grid on;
        
    end

end
