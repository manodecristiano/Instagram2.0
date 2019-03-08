//
//  Tools.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 07/03/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import Foundation
import UIKit

class Tools{
    
    func parseCSVBreed(perro: inout [Perro]) {
        
        //Obtengo el fichero y su tipo
        let path = Bundle.main.path(forResource: "csvPerros", ofType: "csv")!
        
        do{
            
            //Utilizo la librería para obtener la decodificación
            let csv = try CSV(contentsOfURL: path)
            
            //Recorro el fichero por filas y lo guardo en el array
            for row in csv.rows {perro.append(Perro(raza: row["nombre"]!,
                                                    pais: row["pais"]!,
                                                    peso: row["peso"]!,
                                                    altura: row["altura"]!,
                                                    tipo: row["tipo"]!,
                                                    esperanzaVida: row["esperanzaVida"]!,
                                                    colores: row["colores"]!,
                                                    descripcion: row["descripcion"]!,
                                                    imagen: ((row["imagen"]! != "" ? UIImage(data: try Data(contentsOf: URL(string: row["imagen"]!)!)) : UIImage(named: "dognotFound"))!),
                                                    isLiked: false)
              
            )}
            perro.append(Perro(raza: "humana", pais: "Stonia", peso: "200kg", altura: "1,90", tipo: "estratosferico", esperanzaVida: "1año", colores: "magenta", descripcion: "ninguna", imagen: UIImage(named: "nukaANDyo2")!, isLiked: false))
            
        } catch let error as NSError {
            print("Error decodificando el CSV", error)
        }
        
    }
}
