//
//  WishViewController.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 21.09.21.
//

import UIKit

class WishViewController: UIViewController {
    
    
    enum ControllerSections {
        case profileInfo
        case wishList
    }
    
    
    @IBOutlet weak var firstTableView: UITableView!
    @IBOutlet weak var secondTableView: UITableView!
    @IBOutlet weak var addWishButton: UIButton!
    
    private var dataSourse: [ControllerSections] = [.profileInfo, .wishList]
    private var wishArraySon: [WishCellModel] = [WishCellModel(name: "Sony PlayStation 5", progress: 0.12),
                                                 WishCellModel(name: "Велик", progress: 0.25)]
    private var wishArrayDoughter: [WishCellModel] = [WishCellModel(name: "Платье", progress: 0.73),
                                                      WishCellModel(name: "iPhone 13", progress: 0.4),
                                                      WishCellModel(name: "Disneyland", progress: 0.21)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstTableView.delegate = self
        firstTableView.dataSource = self
        
        secondTableView.delegate = self
        secondTableView.dataSource = self
        
        firstTableView.register(UINib(nibName: WishCell.description(), bundle: nil), forCellReuseIdentifier: WishCell.description())
        firstTableView.register(UINib(nibName: WishProfileCell.description(), bundle: nil), forCellReuseIdentifier: WishProfileCell.description())
        secondTableView.register(UINib(nibName: WishCell.description(), bundle: nil), forCellReuseIdentifier: WishCell.description())
        secondTableView.register(UINib(nibName: WishProfileCell.description(), bundle: nil), forCellReuseIdentifier: WishProfileCell.description())
        
    }
    
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension WishViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == firstTableView {
            
            switch dataSourse[indexPath.row] {
            case .profileInfo:
                let cell = tableView.dequeueReusableCell(withIdentifier: WishProfileCell.description(), for: indexPath) as! WishProfileCell
                let model = WishProfileCellModel(avatar: #imageLiteral(resourceName: "baby-boy"), name: "Сына")
                cell.setupWithModel(model: model)
                
                return cell
                
            case .wishList:
                let cell = tableView.dequeueReusableCell(withIdentifier: WishCell.description(), for: indexPath) as! WishCell
                let model = wishArraySon
                cell.setupWithModel(model: model[indexPath.row])
                return cell
            }
        } else if tableView == secondTableView {
            switch dataSourse[indexPath.row] {
            case .profileInfo:
                let cell = tableView.dequeueReusableCell(withIdentifier: WishProfileCell.description(), for: indexPath) as! WishProfileCell
                
                let model = WishProfileCellModel(avatar: #imageLiteral(resourceName: "baby-girl"), name: "Доча")
                cell.setupWithModel(model: model)
                
                return cell
                
            case .wishList:
                let cell = tableView.dequeueReusableCell(withIdentifier: WishCell.description(), for: indexPath) as! WishCell
                let model = wishArrayDoughter[indexPath.row]
                cell.setupWithModel(model: model)
                return cell
                
                
            }
        }
        return UITableViewCell()
    }
}
