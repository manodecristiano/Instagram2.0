//
//  TableViewCellSearch.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 01/03/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import UIKit

class TableViewCellSearch: UITableViewCell {

    
    @IBOutlet weak var nombreSearch: UILabel!
    
    @IBOutlet weak var paisSearch: UILabel!
    
    @IBOutlet weak var imagenSearch: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
