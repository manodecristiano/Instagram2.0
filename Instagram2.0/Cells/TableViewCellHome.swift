//
//  celdaCustom.swift
//  Table_View
//
//  Created by DAM on 15/02/2019.
//  Copyright © 2019 DAM. All rights reserved.
//

import UIKit

class TableViewCellHome: UITableViewCell {
 
    @IBOutlet weak var imagenPerroCell: UIImageView!
    
    @IBOutlet weak var nombrePerroCell: UILabel!
    
    @IBOutlet weak var buttonLike: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   nombrePerroCell.layer.cornerRadius = 10
        // Configure the view for the selected state
    }


  
    
    
    
    
    
    
   
    

    
}
