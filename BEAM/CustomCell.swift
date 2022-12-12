//
//  CustomCell.swift
//  BEAM
//
//  Created by onur erdem on 11.12.2022.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var ModuleImg: UIImageView!
    @IBOutlet weak var ModuleName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
