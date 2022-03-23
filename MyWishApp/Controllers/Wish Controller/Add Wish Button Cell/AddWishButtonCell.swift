//
//  AddWishButtonCell.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 28.09.21.
//

import UIKit

class AddWishButtonCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }



    @IBAction func addNewWishButtonAction(_ sender: Any) {
        let controller = AddWishViewController()
//        present(controller, animated: true, completion: nil)
    }
    
    
    override class func description() -> String {
        return "AddWishButtonCell"
    }
    
}
