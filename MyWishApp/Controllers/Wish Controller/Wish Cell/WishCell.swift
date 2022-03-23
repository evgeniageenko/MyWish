//
//  WishCell.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 24.09.21.
//

import UIKit

struct WishCellModel {
    var name: String
    var progress: Float
    var progressCount: String
}

class WishCell: UITableViewCell {

    @IBOutlet weak var wishNameLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       

    }
    
    func setupWithModel(model: WishCellModel) {
        wishNameLabel.text = model.name
        progressView.progress = model.progress
        progressLabel.text = model.progressCount
    }
    

    override class func description() -> String {
        return "WishCell"
    }
    
}
