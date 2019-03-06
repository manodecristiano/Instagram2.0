//
//  ViewPerfil.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 27/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import Foundation


import UIKit

class ViewPerfil : UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {
    
    
 
  
    
    @IBOutlet weak var labelLikes: UILabel!
    
    @IBOutlet weak var collectionFav: UICollectionView!
    

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFavoritos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCellCollection", for: indexPath) as! CollectionViewCellCustom
        
        myCell.labelCollectionCell.text = arrayFavoritos[indexPath.row].raza
        
     // myCell.imageCollectionCell = arrayFavoritos[indexPath.row].img
        
        return myCell
        
        
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        var view:UICollectionReusableView? = nil
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerSection = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerSection", for: indexPath) as! CollectionReusableViewCustom
            
            headerSection.labelReusable.text = "Favoritos"
            
            view = headerSection
        default:
            print("Sin cabecera")
              print("Has pulsado el botón \(arrayFavoritos.count)")
        }
        
        return view!
    }
    
    
  
    
    

override func viewDidLoad() {
    
    labelLikes.text = ("\(arrayFavoritos.count) likes")
    collectionFav.delegate = self
    collectionFav.dataSource = self
    super.viewDidLoad()
}

}
