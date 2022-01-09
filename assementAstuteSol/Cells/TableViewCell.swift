//
//  TableViewCell.swift
//  assementAstuteSol
//
//  Created by Ali on 08/01/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    @IBOutlet weak var generelbl: UILabel!
    @IBOutlet weak var ratinglbl: UILabel!
    @IBOutlet weak var summarylbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
