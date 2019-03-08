//
//  ViewDetail.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 27/02/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import Foundation
import UIKit

class ViewDetail: UIViewController {
    
    @IBOutlet weak var imagenRaza: UIImageView!
    @IBOutlet weak var nombreRaza: UILabel!
    @IBOutlet weak var pesoRaza: UILabel!
    @IBOutlet weak var alturaRaza: UILabel!
    @IBOutlet weak var paisRaza: UILabel!
    @IBOutlet weak var tipoRaza: UILabel!
    @IBOutlet weak var descripcionRaza: UILabel!
    
    var imagenPerro:UIImage = UIImage()
    var nombrePerro:String = ""
    var pesoPerro:String = ""
    var alturaPerro:String = ""
    var paisPerro:String = ""
    var tipoPerro:String = ""
     var descripcionPerro:String = ""
    
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    imagenRaza.image = imagenPerro
    nombreRaza.text = nombrePerro
    pesoRaza.text = pesoPerro
    alturaRaza.text = alturaPerro
    paisRaza.text = paisPerro
    tipoRaza.text = tipoPerro
    descripcionRaza.text = descripcionPerro
}

}
