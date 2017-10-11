function generarIlustracionesDeFuerzaCortanteYMomentoFlector(ModeloViga,Transmision, Parametros)
    
    nCasos = numel(Transmision.EscenariosDeCarga);
    ejeDividido = ModeloViga(1).ejeDividido;
    longitudEje = max(ejeDividido);
    color = [0.68 0.85 0.9];
    
    for i=1:nCasos

        figure('visible', 'off');
        subplot(3,1,1);
        pendiente = ModeloViga(i).FuerzasCortantes.planoXY;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('XY plane shear force');
        xlabel('Length (m)');
        ylabel('Force (N)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        subplot(3,1,2);
        pendiente = ModeloViga(i).FuerzasCortantes.planoYZ;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('YZ plane shear force');
        xlabel('Length (m)');
        ylabel('Force (N)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        
        subplot(3,1,3);
        pendiente = ModeloViga(i).FuerzasCortantes.resultante;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('Resultant shear force');
        xlabel('Length (m)');
        ylabel('Force (N)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        nombre = 'FuerzasCortantes';
        terminal = '.png';

        nombreUbicacion = Parametros.ubicacionResultados;
        nombreDirectorio = Parametros.nombreDefectoProyecto;

        mkdir([nombreUbicacion,'\',nombreDirectorio]); 
        nombreArchivo = strcat(nombreUbicacion,'\',nombreDirectorio,'\',nombre,terminal);
          
        h = gcf;
        h.PaperUnits = 'inches';
        h.PaperPosition = [0 0 4 6];
        print(h,nombreArchivo,'-dpng','-r0');
        
        %MomentosFlectores
        
        figure('visible', 'off');
        subplot(3,1,1);
        pendiente = ModeloViga(i).MomentosFlectores.planoXY;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('XY plane bending moment');
        xlabel('Length (m)');
        ylabel('Moment (Nm)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        subplot(3,1,2);
        pendiente = ModeloViga(i).MomentosFlectores.planoYZ;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('YZ plane bending moment');
        xlabel('Length (m)');
        ylabel('Moment (Nm)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        
        subplot(3,1,3);
        pendiente = ModeloViga(i).MomentosFlectores.resultante;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('Resultant bending moment');
        xlabel('Length (m)');
        ylabel('Moment (Nm)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        nombre = 'MomentosFlectores';
        terminal = '.png';

        nombreUbicacion = Parametros.ubicacionResultados;
        nombreDirectorio = Parametros.nombreDefectoProyecto;

        mkdir([nombreUbicacion,'\',nombreDirectorio]); 
        nombreArchivo = strcat(nombreUbicacion,'\',nombreDirectorio,'\',nombre,terminal);
          
        h = gcf;
        h.PaperUnits = 'inches';
        h.PaperPosition = [0 0 4 6];
        print(h,nombreArchivo,'-dpng','-r0');
        
        
        %Pendientes
        
        figure('visible', 'off');
        subplot(3,1,1);
        pendiente = ModeloViga(i).Pendiente.planoXY;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('XY plane slope');
        xlabel('Length (m)');
        ylabel('Slope (rad)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        subplot(3,1,2);
        pendiente = ModeloViga(i).Pendiente.planoYZ;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('YZ plane slope');
        xlabel('Length (m)');
        ylabel('Slope (rad)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        
        subplot(3,1,3);
        pendiente = ModeloViga(i).Pendiente.resultante;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('Resultant slope');
        xlabel('Length (m)');
        ylabel('Slope (rad)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        nombre = 'Pendientes';
        terminal = '.png';

        nombreUbicacion = Parametros.ubicacionResultados;
        nombreDirectorio = Parametros.nombreDefectoProyecto;

        mkdir([nombreUbicacion,'\',nombreDirectorio]); 
        nombreArchivo = strcat(nombreUbicacion,'\',nombreDirectorio,'\',nombre,terminal);
          
        h = gcf;
        h.PaperUnits = 'inches';
        h.PaperPosition = [0 0 4 6];
        print(h,nombreArchivo,'-dpng','-r0');
        
        
         %Deflexiones
        
        figure('visible', 'off');
        subplot(3,1,1);
        pendiente = ModeloViga(i).Deflexion.planoXY;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('XY plane deflection');
        xlabel('Length (m)');
        ylabel('Deflection (m)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        subplot(3,1,2);
        pendiente = ModeloViga(i).Deflexion.planoYZ;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('YZ plane deflection');
        xlabel('Length (m)');
        ylabel('Deflection (m)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        
        subplot(3,1,3);
        pendiente = ModeloViga(i).Deflexion.resultante;
        area(ejeDividido, pendiente,'FaceColor', color,'EdgeColor',color);
        title('Resultant deflection');
        xlabel('Length (m)');
        ylabel('Deflection (m)');
        grid on;
        xlim([-0.05*longitudEje longitudEje*1.05]);
        
        nombre = 'Deflexiones';
        terminal = '.png';

        nombreUbicacion = Parametros.ubicacionResultados;
        nombreDirectorio = Parametros.nombreDefectoProyecto;

        mkdir([nombreUbicacion,'\',nombreDirectorio]); 
        nombreArchivo = strcat(nombreUbicacion,'\',nombreDirectorio,'\',nombre,terminal);
          
        h = gcf;
        h.PaperUnits = 'inches';
        h.PaperPosition = [0 0 4 6];
        print(h,nombreArchivo,'-dpng','-r0');
    end
    
    
end