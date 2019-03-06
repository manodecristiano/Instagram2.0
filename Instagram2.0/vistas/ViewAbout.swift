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
    Persona(descripcion: "Developer", imagen: "clase.png"),
    Persona(descripcion: "Tatuador", imagen: "tatuador"),
    Persona(descripcion: "Monitor de voleibol", imagen: "monitordeVolei2.png"),
    Persona(descripcion: "Camarero", imagen: "camarero.png"),
    Persona(descripcion: "Nuca", imagen: "nukaANDyo.png")]

class ViewAbout : UIViewController , UITableViewDelegate,UITableViewDataSource{
    

    @IBOutlet weak var tableViewAbout: UITableView!
    
    
    
    func tableView(_ tableViewAbout: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaPersona.count
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
