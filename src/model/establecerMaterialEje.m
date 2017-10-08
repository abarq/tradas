function PropiedadesMaterial = establecerMaterialEje(Parametros)

    PropiedadesMaterial.tipo = Parametros.Material.tipo;
    PropiedadesMaterial.esfuerzoFluencia =  Parametros.Material.esfuerzoFluencia;
    PropiedadesMaterial.esfuerzoUltimo = Parametros.Material.esfuerzoUltimo;
    PropiedadesMaterial.moduloElasticidad = Parametros.Material.moduloElasticidad;
    PropiedadesMaterial.coeficientePoisson = Parametros.Material.coeficientePoisson;
    
end