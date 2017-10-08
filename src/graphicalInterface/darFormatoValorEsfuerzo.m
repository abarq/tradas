function valorEsfuerzoConFormato =  darFormatoValorEsfuerzo(textoEsfuerzoUltimo)

     a = textoEsfuerzoUltimo*0.145;

    textoEsfuerzoUltimo = num2str(textoEsfuerzoUltimo);
    a = num2str(a);
    
    valorEsfuerzoConFormato = [textoEsfuerzoUltimo ' ' 'MPa' ' ' '(' a ' ' 'ksi' ')']; 


end