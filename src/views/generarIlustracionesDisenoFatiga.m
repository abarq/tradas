function generarIlustracionesDisenoFatiga(Transmision, Analisis, ModeloViga, Parametros)

     nCasos = numel(Transmision.EscenariosDeCarga);

    for i=1:nCasos

       ejeDividido = ModeloViga(i).ejeDividido; 
       nPuntosCriticos = numel(Analisis.Fatiga.CasoCarga(i).PuntoCritico); 

       for j=1:nPuntosCriticos
          
          figure('Position', [10000, 10000, 500, 400], 'visible', 'off');
          movegui(gcf, 'center');
          a = subplot(2,1,1);
          get(a, 'Position');
          
          generarBosquejoEje(Transmision.Eje.Geometria, ejeDividido);
          hold on;
          x = Transmision.Eje.Geometria.SegmentoRecto.ubicacionFinal(j);
          y = Transmision.Eje.Geometria.SegmentoRecto.diametro(j)/2;
          
          plot(x,y,'xr')%'Color', color);
          title('Critical point location');

          b = subplot(2,1,2);
          get(b, 'Position');
          
          obtenerDiagramaEsfuerzoAlternanteYMedio(Analisis.Fatiga.CasoCarga(i).PuntoCritico(j), Analisis.Fatiga.Parametros); 
          title('Failure criteria');
          a = num2str(j);
          b = 'Figura';
          nombre = [b a];
          terminal = '.png';

          nombreUbicacion = Parametros.ubicacionResultados;
          nombreDirectorio = Parametros.nombreDefectoProyecto;
          
          mkdir([nombreUbicacion,'\',nombreDirectorio]); 
          nombreArchivo = strcat(nombreUbicacion,'\',nombreDirectorio,'\',nombre,terminal);
 
        h = gcf;
        h.PaperUnits = 'inches';
        h.PaperPosition = [0 0 5 6];
      
       
                print(h,nombreArchivo,'-dpng','-r0');
          
       end

    end

end

function obtenerDiagramaEsfuerzoAlternanteYMedio(PuntoCritico, Parametros)

    
    PuntoCritico.resistenciaFatigaReal = PuntoCritico.resistenciaFatigaReal/1e6;
    Parametros.resistenciaUltima = Parametros.resistenciaUltima/1e6;
    Parametros.resistenciaFluencia = Parametros.resistenciaFluencia/1e6;

    switch Parametros.criterioFalla

        case 'Goodman'

            puntosX = [0 Parametros.resistenciaUltima];
            puntosY = [PuntoCritico.resistenciaFatigaReal 0];

            
            plot(puntosX, puntosY, 'DisplayName', Parametros.criterioFalla);
            hold on;

        case 'Soderberg'

                        

            puntosX = [0 Parametros.resistenciaFluencia];
            puntosY = [PuntoCritico.resistenciaFatigaReal 0];  

            plot(puntosX, puntosY, 'DisplayName', Parametros.criterioFalla);
            hold on;

        case 'Asme'
            
            
            

    end
    
%         sigmaMedio = linspace(0,Parametros.resistenciaUltima,100);
%         sigmaAlterno = PuntoCritico.resistenciaFatigaReal*(1-(sigmaMedio/Parametros.resistenciaUltima).^2);
%         plot(sigmaMedio,sigmaAlterno,'b', 'DisplayName', 'Gerber');
          legend('show')
%         
        esfuerzoAlternante = PuntoCritico.esfuerzoVonMisesAlternante/1e6;
        esfuerzoMedio = PuntoCritico.esfuerzoVonMisesMedio/1e6;
% 

        hold on;

        lineaPunteadaParalelaYPuntosY = [esfuerzoAlternante 0];
        lineaPunteadaParalelaYPuntosX = [esfuerzoMedio  esfuerzoMedio];

        %color = [0.88 0.88 0.88];
        plot(lineaPunteadaParalelaYPuntosX,lineaPunteadaParalelaYPuntosY,'-k','DisplayName', 'off');

        hold on;

        lineaPunteadaParalelaXPuntosY = [esfuerzoAlternante esfuerzoAlternante];
        lineaPunteadaParalelaXPuntosX = [esfuerzoMedio 0];

        plot(lineaPunteadaParalelaXPuntosX,lineaPunteadaParalelaXPuntosY,'-k','DisplayName', 'off');

        grid on;
        xlabel('$\sigma_{m}$ (MPa)', 'Interpreter', 'latex', 'FontSize', 15);
        ylabel('$\sigma_{a}$ (MPa)', 'Interpreter', 'latex', 'FontSize', 15);
        
        hold on;
        
%         colorbar('southoutside');
%         a = colormap(jet(256));
%         caxis([0 10]);
%         
%      b = PuntoCritico.factorSeguridad;
%      x = b * 256/10;
%      x = round(x);
%      coloor = a(x,:);
     plot(esfuerzoMedio, esfuerzoAlternante, 'ok','DisplayName', 'off');
        
end
    
    
    
    
    
    
    



