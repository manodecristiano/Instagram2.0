//
//  ViewPerfil.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 27/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import Foundation


import UIKit

class ViewPerfil : UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    
 
  
    
    @IBOutlet weak var labelLikes: UILabel!
    
    @IBOutlet weak var collectionFav: UICollectionView!
    
    @IBOutlet weak var buttonImage: UIButton!
    
    @IBOutlet weak var imagePerfil: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    
    
    
    
    
    
    @IBAction func btnClicked() {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        imagePerfil.image = image
    }

    
    
    
    
   
    
    
    
    
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayFavoritos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCellCollection", for: indexPath) as! CollectionViewCellCustom
        
        myCell.labelCollectionCell.text = arrayFavoritos[indexPath.row].raza
        myCell.imagenCollectionCell.image = arrayFavoritos[indexPath.row].imagen

        return myCell
        
        
    }
    
    
    override
    func viewDidAppear(_ animated: Bool) {
        collectionFav.reloadData()
            labelLikes.text = ("\(arrayFavoritos.count) likes")
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
    collectionFav.backgroundColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
    labelLikes.text = ("\(arrayFavoritos.count) likes")
    collectionFav.delegate = self
    collectionFav.dataSource = self
    super.viewDidLoad()
}

}
