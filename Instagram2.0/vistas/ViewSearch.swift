//
//  ViewSearch.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 27/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import Foundation
import UIKit

class ViewSearch : UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    var listaFiltrada:[Perro] = [Perro]()
    var isSearching:Bool = false
    
    @IBOutlet weak var tableViewSearch: UITableView!
    
    
        //Número de columnas
        func tableView(_ tableViewSearch: UITableView, numberOfRowsInSection section: Int) -> Int {
           
        return !isSearching ? listaRazas.count : listaFiltrada.count
        }
    
    
        //Qué información va ha ir dentro de la row
        func tableView(_ tableViewSearch: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //enlazar con la celda para poder entrar en todas las propiedades de tu Celda
            let myCell = tableViewSearch.dequeueReusableCell(withIdentifier: "myCellsSearch", for: indexPath)as! TableViewCellSearch
            
            // myCell.ImagenPerroCell?.text = listaRazas[indexPath.row].img
            myCell.nombreSearch.text = listaRazas[indexPath.row].raza
            
            if isSearching {
                //myCell.imagenSearch.image = listaFiltrada[indexPath.row].img
                myCell.nombreSearch.text = listaFiltrada[indexPath.row].raza
            }else{
               // myCell.imagenSearch.image = listaRazas[indexPath.row].img
                myCell.nombreSearch.text = listaRazas[indexPath.row].raza
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
            listaRazas[indexPath.row].isLiked = !listaRazas[indexPath.row].isLiked
            self.tableViewSearch.reloadRows(at: [indexPath], with: .none)
            action.title = "You like this!"
            completion(true)
        }
        action.title = listaRazas[indexPath.row].isLiked ? "Dislike!" : "Like!"
        action.backgroundColor =  listaRazas[indexPath.row].isLiked ? UIColor.black : UIColor.red
        
        return action
    }
        
        
        
        func tableView(_ tableViewSearch: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let instanciaControllerItem = storyboard!.instantiateViewController(withIdentifier: "detail") as! ViewDetail
            instanciaControllerItem.nombrePerro = listaRazas[indexPath.row].raza
            instanciaControllerItem.pesoRaza?.text = listaRazas[indexPath.row].peso
            
            let backItem = UIBarButtonItem()
            backItem.title = "Volver"
            navigationItem.backBarButtonItem = backItem
            
            self.navigationController?.pushViewController(instanciaControllerItem, animated: true)
        }
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
  
        listaFiltrada = listaRazas.filter({ (perro) -> Bool in
            return perro.raza.lowercased().contains(searchText.lowercased())
        })
        
        isSearching = searchText != "" ? true : false
        tableViewSearch.reloadData()
    }
    
        
        

        
        
        override func viewDidLoad() {
            super.viewDidLoad()
    
            tableViewSearch.delegate = self
            tableViewSearch.dataSource = self
            
            searchBar.delegate = self
            searchBar.placeholder = "Introduce tu Favorito a buscar"
        }
        
        
}
