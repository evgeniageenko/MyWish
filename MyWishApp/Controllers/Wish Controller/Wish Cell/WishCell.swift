//
//  WishCell.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 24.09.21.
//

import UIKit

struct Wish {
    var name: String
    var progress: Float
}

class WishCell: UITableViewCell {

    @IBOutlet weak var wishNameLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()




    }


    override class func description() -> String {
        return "WishCell"
    }
    
}
