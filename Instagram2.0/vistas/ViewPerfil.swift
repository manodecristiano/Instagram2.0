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
    
    
    
    

override func viewDidLoad() {
    collectionFav.delegate = self
    collectionFav.dataSource = self
    super.viewDidLoad()
}

}
