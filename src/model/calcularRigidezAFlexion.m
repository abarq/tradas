function rigidezAFlexion = calcularRigidezAFlexion(Eje,largoDiscretizado)

    rigidezAFlexion = zeros(1,numel(largoDiscretizado));
    %SegmentoLiso = Eje.Geometria.SegmentoRecto;
        
    for i=1:Eje.Geometria.SegmentoRecto.cantidad
        
        rigidezAFlexion = rigidezAFlexion +...
            (largoDiscretizado >= Eje.Geometria.SegmentoRecto.ubicacionInicial(i) & largoDiscretizado <= Eje.Geometria.SegmentoRecto.ubicacionFinal(i))*...
            Eje.PropiedadesMaterial.moduloElasticidad * Eje.Geometria.SegmentoRecto.tensorSegundoMomentoArea(1,1,i);
                    
    end
    

end