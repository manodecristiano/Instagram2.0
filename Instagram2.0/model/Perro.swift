//
//  Perro.swift
//  TableView
//
//  Created by Cristian Carreño Navarro on 25/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//


import Foundation
class Perro{
    
    
    var raza: String
    var peso: String
     var isLiked:Bool
    
    init(raza:String,peso:String, isLiked:Bool){
        self.raza = raza
        self.peso = peso
        self.isLiked = isLiked
    }

    func devolverNombre() -> String{
        return self.raza
    }
}
