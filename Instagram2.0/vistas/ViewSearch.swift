//
//  ViewSearch.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 27/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import Foundation
import UIKit

class ViewSearch : UIViewController,UITableViewDelegate,UITableViewDataSource {
    
var listaFiltrada = [String]()
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filterMovies:[Perro] = [Perro]()
    var isSearching:Bool = false
    
    
    @IBOutlet weak var tableViewSearch: UITableView!
    
    
        //Número de columnas
        func tableView(_ tableViewSearch: UITableView, numberOfRowsInSection section: Int) -> Int {
           
            return !isSearching ? listaRazas.count : filterMovies.count

            //return arrayFavoritos.count
        }
    
    
        //Qué información va ha ir dentro de la row
        func tableView(_ tableViewSearch: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //enlazar con la celda para poder entrar en todas las propiedades de tu Celda
            let myCell = tableViewSearch.dequeueReusableCell(withIdentifier: "myCellsSearch", for: indexPath)as! TableViewCellSearch
            // myCell.ImagenPerroCell?.text = listaRazas[indexPath.row].i
            myCell.nombreSearch.text = arrayFavoritos[indexPath.row].raza
            
            
            if isSearching {
                myCell.imgMovie.image = filterMovies[indexPath.row].img
                myCell.lblTitleMovie.text = filterMovies[indexPath.row].title
            }else{
                myCell.imgMovie.image = listaRazas[indexPath.row].img
                myCell.lblTitleMovie.text = listaRazas[indexPath.row].title
            }
            
            
            
            return myCell
        }
        
        func tableView(_ tableViewSearch: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 185
        }
        
        
        //funcion de SWIPE-ACTION
        func tableView(_ tableViewSearch: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            
            let isLiked = liked(indexPath:indexPath)
            //Adjuntamos todas las opciones que necesitemos en modo de array
            return UISwipeActionsConfiguration(actions: [isLiked])
        }
        
    
    func liked(indexPath:IndexPath) -> UIContextualAction{
        
        let action = UIContextualAction(style: .normal, title: "Like") { (action, view, completion) in
            arrayFavoritos[indexPath.row].isLiked = !arrayFavoritos[indexPath.row].isLiked
            self.tableViewSearch.reloadRows(at: [indexPath], with: .none)
            action.title = "You like this!"
            completion(true)
        }
        action.title = arrayFavoritos[indexPath.row].isLiked ? "Dislike!" : "Like!"
        action.backgroundColor =  arrayFavoritos[indexPath.row].isLiked ? UIColor.black : UIColor.red
        
        return action
    }
        
        
        
        func tableView(_ tableViewSearch: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let instanciaControllerItem = storyboard!.instantiateViewController(withIdentifier: "detail") as! ViewDetail
            instanciaControllerItem.nombrePerro = arrayFavoritos[indexPath.row].raza
            instanciaControllerItem.pesoRaza?.text = arrayFavoritos[indexPath.row].peso
            
            let backItem = UIBarButtonItem()
            backItem.title = "Volver"
            navigationItem.backBarButtonItem = backItem
            
            self.navigationController?.pushViewController(instanciaControllerItem, animated: true)
        }
        

        
        
        
        
        

        
        
        override func viewDidLoad() {
            super.viewDidLoad()
    
            tableViewSearch.delegate = self
            tableViewSearch.dataSource = self
            
            searchBar.delegate = self
            searchBar.placeholder = "Introduce película a buscar"
        }
        
        
}
