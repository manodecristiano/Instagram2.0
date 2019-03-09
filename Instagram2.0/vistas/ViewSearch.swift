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
            
             myCell.imagenSearch.image = listaRazas[indexPath.row].imagen
             myCell.nombreSearch.text = listaRazas[indexPath.row].raza
             myCell.paisSearch.text = listaRazas[indexPath.row].pais
            
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
            return 100
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
        
        
        
        if let index = arrayFavoritos.index(of: listaRazas[indexPath.row]) {
            arrayFavoritos.remove(at: index)
            // mostrarAlerta(title: "BORRADO", message:"Has borrado el perro \( listaRazas[indexPath.row].raza)" )
        }else{
            arrayFavoritos.append(listaRazas[indexPath.row])
            // mostrarAlerta(title: "AÑADIDO", message:"Has agregado el perro \( listaRazas[indexPath.row].raza)" )
        }
        return action
    }
        
        
        
        func tableView(_ tableViewSearch: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            let detailPerro = storyboard!.instantiateViewController(withIdentifier: "detail") as! ViewDetail
            detailPerro.imagenPerro = listaRazas[indexPath.row].imagen
            detailPerro.nombrePerro = listaRazas[indexPath.row].raza
            detailPerro.pesoPerro = listaRazas[indexPath.row].peso
            detailPerro.alturaPerro = listaRazas[indexPath.row].altura
            detailPerro.paisPerro = listaRazas[indexPath.row].pais
            detailPerro.tipoPerro = listaRazas[indexPath.row].tipo
            detailPerro.descripcionPerro = listaRazas[indexPath.row].descripcion
            
            
            let backItem = UIBarButtonItem()
            backItem.title = "Volver"
            navigationItem.backBarButtonItem = backItem
            
            self.navigationController?.pushViewController(detailPerro, animated: true)
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
