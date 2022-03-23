//
//  WishProfileCell.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 26.09.21.
//

import UIKit

struct WishProfileCellModel {
    let avatar: UIImage
    let name: String
}

class WishProfileCell: UITableViewCell {


    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setupWithModel(model: WishProfileCellModel) {
        avatarImageView.image = model.avatar
        nameLabel.text = model.name
        
    }

    
    override class func description() -> String {
        return "WishProfileCell"
    }

    
}

