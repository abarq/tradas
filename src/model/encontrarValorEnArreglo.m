function valorFuncionEncontrado = encontrarValorEnArreglo(arreglo, valorAEncontrar)

    valorFuncionEncontrado = find(arreglo <= valorAEncontrar*1.01 & arreglo >= valorAEncontrar*0.999,1);
    
end