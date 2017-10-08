function kt = obtenerSCFNoda(geometria, tipoCarga, Dimensiones)

    switch geometria
                
        case 'EscalonEje'
            
            kt = tipoCargaEje(tipoCarga, Dimensiones);
            
        case 'Cuna'
    
            kt = tipoCargaCuna();
    end
        
end


function kt = tipoCargaEje(tipoCarga, Dimensiones)

    D = Dimensiones.diametroMayor;
    d = Dimensiones.diametroMenor;
    a = d/2;
    r = Dimensiones.radioFilete;
    h = (D - d)/2;
    epsilon = 2 * r/D;
    lambda = 2 * h/D;
    chi = sqrt(h/r);
    nu = sqrt(r/h);
    
    switch tipoCarga
            
        case 'torsion'
            
            kts = 1 + 0.5*sqrt(a/r);
            num_ktd = 3*(1+sqrt(a/r +1))^2;
            den_ktd = 4*(1+2*sqrt(a/r+1));
            ktd = num_ktd/den_ktd;
            
            m=1.8;
            num_ktN = (kts-1)*(ktd-1);
            den_ktN = ((kts-1)^m + (ktd-1)^m)^(1/m);
            ktN = num_ktN/den_ktN + 1;
            
            if epsilon >= 0.03 && epsilon <= 0.1
                
                relacion = (1.0116 - 0.31986*epsilon + 2.1857*epsilon^2)+...
                    (1.3774 - 16.133*epsilon + 52.691*epsilon^2)*lambda+...
                    (-9.6183 + 125.25*epsilon - 536.40*epsilon^2)*lambda^2+...
                    (23.119 - 332.18*epsilon + 1592.8*epsilon^2)*lambda^3+...
                    (-24.537 + 375.26*epsilon - 1901.9*epsilon^2)*lambda^4+...
                    (9.6501 - 152*epsilon + 791.59*epsilon^2)*lambda^5;
                
                kt = relacion * ktN;
                
            else
                
                relacion = (1.0017-0.00513*epsilon + 0.00310*epsilon^2)+...
                (0.40276 - 1.492*epsilon + 0.09565*epsilon^2)*lambda+...
                (-3.1788 + 8.8826*epsilon - 5.1412*epsilon^2)*lambda^2+...
                (7.3878 - 17.503*epsilon + 9.6479*epsilon^2)*lambda^3+...
                (-7.5126 + 16.014*epsilon - 8.2227*epsilon^2)*lambda^4+...
                (2.8986 - 5.6953*epsilon + 2.7554*epsilon^2)*lambda^5;
            
                kt = relacion * ktN;
            
            end
            
           
            
        case 'flexion'
            
            ktH = 1 + sqrt(h/r);
            
            if (chi < 1 && chi >= 0)
                
               ktF = (1 + 0.159*chi-0.127*chi^2+0.05*chi^3)*ktH; 
                
            else
                
               ktF = (1.106 + 0.016*nu -0.059*nu^2 + 0.019*nu^3)*ktH;
                
            end
                        
            kts  = ktF;
            v = 0.3;
            N = 3*(a/r +1) +(1 + 4*v) * sqrt(a/r +1) + (1+v)/(1 + sqrt(a/r +1));
            ktd = (3/4)*(1/N)* (sqrt(a/r+1) +1) * (3*a/r -(1-2*v)*sqrt(a/(2*r) + 1) + 4 +v);
            
            m=1.6;
            num_ktN = (kts-1)*(ktd-1);
            den_ktN = ((kts-1)^m + (ktd-1)^m)^(1/m);
            ktN = num_ktN/den_ktN + 1;
           % ktN = 1.849;
             if epsilon >= 0.03 && epsilon <= 1
                
                relacion = (0.9967-0.0163*epsilon + 0.5525*epsilon^2)+...
                    (0.9609 - 13.6340*epsilon + 45.055*epsilon^2)*lambda+...
                    (-3.7358 + 42.650*epsilon + 85.371*epsilon^2)*lambda^2+...
                    (7.2784 - 114.5*epsilon - 145.86*epsilon^2)*lambda^3+...
                    (-8.7448 + 191.360*epsilon - 374.99*epsilon^2)*lambda^4+...
                    (4.2394 - 105.730*epsilon + 389.04*epsilon^2)*lambda^5;
                
                kt = relacion * ktN;
                
            else
                
                relacion = (1.0016-0.0101*epsilon+0.0096*epsilon^2)+...
                (0.0486 + 0.2309*epsilon - 0.0889*epsilon^2)*lambda+...
                (1.4471 - 5.7807*epsilon + 2.7451*epsilon^2)*lambda^2+...
                (-5.5762 + 15.338*epsilon - 5.7006*epsilon^2)*lambda^3+...
                (6.1852 - 12.6180*epsilon + 2.2278*epsilon^2)*lambda^4+...
                (-2.1060 + 2.8386*epsilon + 0.8079*epsilon^2)*lambda^5;
            
                kt = relacion * ktN;
            
            end
            
    end
            
end