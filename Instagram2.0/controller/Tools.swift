//
//  Tools.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 07/03/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import Foundation

class Tools{
    
    func parseCSVBreed(perro: inout [Perro]) {
        
        //Obtengo el fichero y su tipo
        let path = Bundle.main.path(forResource: "PerrosAPP", ofType: "csv")!
        
        do{
            
            //Utilizo la librería para obtener la decodificación
            let csv = try CSV(contentsOfURL: path)
            
            //Recorro el fichero por filas y lo guardo en el array
            for row in csv.rows {perro.append(Perro(raza: "nombre", pais: "pais", peso: "peso", altura: "altura", tipo: "tipo", esperanzaVida: "esperanzaVida", colores: "colores", descripcion: "descripcion", imagen: "imagen", isLiked: false)
              
            )}
            
        } catch let error as NSError {
            print("Error decodificando el CSV", error)
        }
        
    }
}