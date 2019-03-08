//
//  Perro.swift
//  TableView
//
//  Created by Cristian Carreño Navarro on 25/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//NOMBRE;PAIS;PESO;ALTURA;TIPO;ESPERANZA DE VIDA;COLORES;DESCRIPCION;IMAGEN
//


import Foundation
class Perro : Equatable{
    
    var raza: String
    var pais: String
    var peso: String
    var altura: String
    var tipo: String
    var esperanzaVida: String
    var colores: String
    var descripcion: String
    var imagen: UIImage
    
    var isLiked:Bool
    
    init(raza:String,pais: String,peso:String,altura: String,tipo: String,esperanzaVida: String,colores: String,descripcion: String,imagen: String, isLiked:Bool){
      
         self.raza = raza
         self.pais = pais
         self.peso = peso
         self.altura = altura
         self.tipo = tipo
         self.esperanzaVida = esperanzaVida
         self.colores = colores
         self.descripcion = descripcion
         self.imagen = imagen
        self.isLiked = isLiked
    }

    func devolverNombre() -> String{
        return self.raza
    }
    
//overrite de la función comparar
    static func == (lhs: Perro, rhs: Perro) -> Bool{
        return lhs.raza == rhs.raza
        }
   
}
