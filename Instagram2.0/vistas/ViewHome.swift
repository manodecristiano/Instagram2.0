//
//  ViewController.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 27/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//
import Foundation
import UIKit


var listaRazas:[Perro] = [
    Perro(raza: "Terranova", peso: "50-60kg", isLiked:false),
    Perro(raza: "Mastin", peso: "50-60kg", isLiked:false),
    Perro(raza: "Labrador", peso: "40-55kg", isLiked:false),
    Perro(raza: "Dalmata", peso: "40-50kg", isLiked:false),
    Perro(raza: "Braco", peso: "30-40kg", isLiked:false),
    Perro(raza: "Chihuaua", peso: "5-10kg", isLiked:false),
    Perro(raza: "Dogo Alemán", peso: "50-60kg", isLiked:false),
    Perro(raza: "Boxer", peso: "30-40kg", isLiked:false),
    Perro(raza: "Bulldog inglés", peso: "45-55kg", isLiked:false) ]

var arrayFavoritos: Array <Perro> = []





class ViewHome: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var mensajeLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    

    
    //NÚMERO DE COLUMNAS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listaRazas.count
    }
    
    
    //QUE HAY DENTRO DE CADA ROW
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //enlace con la celda para poder entrar en todas las propiedades de la Celda
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCells", for: indexPath)as! TableViewCellHome
        
        // myCell.ImagenPerroCell?.text = listaRazas[indexPath.row].i
        myCell.nombrePerroCell?.text = listaRazas[indexPath.row].raza
        myCell.buttonLike.tag = indexPath.row
        
        //igualamos el identificador tag del boton al numero de la row
        myCell.buttonLike.tag = indexPath.row
        
        //que función llamamos al clickar como touchUpInside
        myCell.buttonLike.addTarget(self, action: #selector(clickHeart), for: .touchUpInside)
        
  
        
        //El buttonlike esta escondido si es liked o no
        myCell.buttonLike.isHidden = listaRazas[indexPath.row].isLiked ? false : true
        
        
   
        
        
        return myCell
    }
    
    //FUNCIÓN AL CLIKCAR EL BOTÓN
    @objc func clickHeart(sender: UIButton){

        print("Has pulsado el botón \(sender.tag)")
      
    }

    
    //TAMAÑO DE LA CELDA
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    //FUNCIÓN AL CLICKAR UNA ROW
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let instanciaControllerItem = storyboard!.instantiateViewController(withIdentifier: "detail") as! ViewDetail
        instanciaControllerItem.nombrePerro = listaRazas[indexPath.row].raza
        instanciaControllerItem.pesoRaza?.text = listaRazas[indexPath.row].peso
        
        let backItem = UIBarButtonItem()
        backItem.title = "Volver"
        navigationItem.backBarButtonItem = backItem
        
        self.navigationController?.pushViewController(instanciaControllerItem, animated: true)
        
    }

   //FUNCIÓN  SWIPE-ACTION
    
    func tableView(_ tableViewSearch: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let isLiked = liked(indexPath:indexPath)
        //Adjuntamos todas las opciones que necesitemos en modo de array
        return UISwipeActionsConfiguration(actions: [isLiked])
    }
    
    func liked(indexPath:IndexPath) -> UIContextualAction{
        
        let action = UIContextualAction(style: .normal, title: "Like") { (action, view, completion) in
            listaRazas[indexPath.row].isLiked = !listaRazas[indexPath.row].isLiked
            
            self.tableView.reloadRows(at: [indexPath], with: .none)
            action.title = "You like this!"
            completion(true)
        }
           action.title = listaRazas[indexPath.row].isLiked ? "Dislike!" : "Like"
            action.backgroundColor =  listaRazas[indexPath.row].isLiked ? UIColor.black : UIColor.red
        


        
       if let index = arrayFavoritos.index(of: listaRazas[indexPath.row]) {
            arrayFavoritos.remove(at: index)
           // mostrarAlerta(title: "BORRADO", message:"Has borrado el perro \( listaRazas[indexPath.row].raza)" )
        }else{
            arrayFavoritos.append(listaRazas[indexPath.row])
           // mostrarAlerta(title: "AÑADIDO", message:"Has agregado el perro \( listaRazas[indexPath.row].raza)" )
        }
        return action
    }
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.delegate = self
        tableView.dataSource = self
        

    }
    
    
    
    func mostrarAlerta(title: String, message: String) {
        
        let alertaGuia = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let OK = UIAlertAction(title: "OK", style: .default, handler: {(action) in
            
            self.mensajeLabel.text = ""
        })
        
        alertaGuia.addAction(OK)
        present(alertaGuia, animated: true, completion: nil)
        
    }
    
}

