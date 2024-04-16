//
//  ImgCellTVC.swift
//  ImageLoad
//
//  Created by apple on 16/04/24.
//

import UIKit

class ImgCellTVC: UITableViewCell {
    
    @IBOutlet weak var imgVW: LazyImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
