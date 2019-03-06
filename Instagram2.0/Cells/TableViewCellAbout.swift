//
//  TableViewCellAbout.swift
//  Instagram2.0
//
//  Created by Cristian Carreño Navarro on 06/03/2019.
//  Copyright © 2019 Cristian Carreño Navarro. All rights reserved.
//

import UIKit

class TableViewCellAbout: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var labelAbout: UILabel!
    @IBOutlet weak var imagenAbout: UIImageView!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
