//
//  CustomCell.swift
//  BEAM
//
//  Created by onur erdem on 11.12.2022.
//

import UIKit
import Kingfisher

class CustomCell: UITableViewCell {

    @IBOutlet weak var ModuleImg: UIImageView!
    @IBOutlet weak var ModuleName: UILabel!
    var imgURL : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        ModuleImg.kf.setImage(with: URL(string: Constant.baseURL+imgURL))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
