//
//  ViewController.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 27/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//
import Foundation
import UIKit

class ViewHome: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    //Número de columnas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaRazas.count
    }
    //Qué información va ha ir dentro de la row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //enlazar con la celda para poder entrar en todas las propiedades de tu Celda
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCells", for: indexPath)as! celdaCustom
        
        
       // myCell.nombreCell?.text = listaRazas[indexPath.row].raza
       
        
        
        
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let instanciaControllerItem = storyboard!.instantiateViewController(withIdentifier: "detail") as! ViewDetail
        instanciaControllerItem.nombreRaza?.text = listaRazas[indexPath.row].raza
        instanciaControllerItem.pesoRaza?.text = listaRazas[indexPath.row].peso
        
        
        let backItem = UIBarButtonItem()
        backItem.title = "Volver"
        navigationItem.backBarButtonItem = backItem
        
        
        self.navigationController?.pushViewController(instanciaControllerItem, animated: true)
        
    }
    
    
    
    var listaRazas:[Perro] = [
        Perro(raza: "Terranova", peso: "50-60kg"),
        Perro(raza: "Mastin", peso: "50-60kg"),
        Perro(raza: "Labrador", peso: "40-55kg"),
        Perro(raza: "Dalmata", peso: "40-50kg"),
        Perro(raza: "Braco", peso: "30-40kg"),
        Perro(raza: "Chihuaua", peso: "5-10kg"),
        Perro(raza: "Dogo Alemán", peso: "50-60kg"),
        Perro(raza: "Boxer", peso: "30-40kg"),
        Perro(raza: "Bulldog inglés", peso: "45-55kg") ]
    
    
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}

