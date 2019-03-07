//
//  Tools.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 07/03/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import Foundation

class Tools{
    
    func parseCSVBreed(breeds: inout [Perro]) {
        
        //Obtengo el fichero y su tipo
        let path = Bundle.main.path(forResource: "fci-breeds", ofType: "csv")!
        
        do{
            
            //Utilizo la librería para obtener la decodificación
            let csv = try CSV(contentsOfURL: path)
            
            //Recorro el fichero por filas y lo guardo en el array
            for row in csv.rows {
                breeds.append(Breed(id: row["id"]!, name: row["name"]!, section: row["section"]!, country: row["country"]!, image: row["image"]! != "" ? row["image"]! : "null"))
            }
            
        } catch let error as NSError {
            print("Error decodificando el CSV", error)
        }
        
    }
}
