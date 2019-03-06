//
//  ViewAbout.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 27/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved. programador,monitor de volei,camarero,tatuador
//

import Foundation

import UIKit

var listaPersona:[Persona] = [
    Persona(descripcion: "LLevo casi 2 años aprendiendo a programar desde 0 y me gusta, en parte por la gran familia que hemos creado en clase también, me gustaria acabar trabajando  de desarrollador de IOS  aprender cada día algo nuevo, esta aplicación es un tributo a la maravillosa raza de animal  el Perro, y en especial a Nuca.", imagen: "clase.png"),
    Persona(descripcion: "Tatuador, en mi tiempo libre me gusta aprender cosas nuevas y que esten relaizonadas con el diseño, por eso aprendi por mi cuenta a tatuar.Llevo desde el 2015.", imagen: "tatuador"),
    Persona(descripcion: "Monitor de voleibol, como gran aficionado que soy a este deporte un dia me ofrecieron trabajar de monitor y ya llevo 4 años haciendo que el volei sea más sencillo de aprender", imagen: "monitorVolei2.png"),
    Persona(descripcion: "Camarero, por desgracia en este mundo no se puede vivir sin dinero y llevo más de 15 años trabajando en la hosteleria, ahora estoy en el Casino, peró quien sabe donde estaré mañana.", imagen: "camarero.png"),
    Persona(descripcion: "Nuca, he tenido varios perros a lo largo de mi vida, peró ninguno me hizo sentir como un padre, la perdida de ella fue algo amargo,nunca habia pasado más de 5 dias sin verla, creo y me gusta creerlo que se fué cuando vio que ya iba por buen camino.Se fue el 5 de abril de 2018", imagen: "nukaANDyo.png")]

class ViewAbout : UIViewController , UITableViewDelegate,UITableViewDataSource{
    

    @IBOutlet weak var tableViewAbout: UITableView!
    
    
    
    func tableView(_ tableViewAbout: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPersona.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 300
    }
    func tableView(_ tableViewAbout: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let myCell = tableViewAbout.dequeueReusableCell(withIdentifier: "cellAbout", for: indexPath)as! TableViewCellAbout
        
        
        
        myCell.imagenAbout.image = UIImage(named:listaPersona[indexPath.row].imagen)
        myCell.labelAbout.text = listaPersona[indexPath.row].descripcion
        
        return myCell
    }
    
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAbout.delegate = self
        tableViewAbout.dataSource = self
    }
    
}
