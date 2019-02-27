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
    @IBOutlet weak var lugarRaza: UILabel!
    @IBOutlet weak var tipoRaza: UILabel!
    @IBOutlet weak var descripcionRaza: UILabel!
    
    var nombrePerro:String = ""
    
    
override func viewDidLoad() {
    super.viewDidLoad()
    
    nombreRaza.text = nombrePerro
    
}

}
