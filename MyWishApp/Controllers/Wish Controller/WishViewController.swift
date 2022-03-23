//
//  WishViewController.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 21.09.21.
//

import UIKit

class WishViewController: UIViewController {
    
    //    enum ControllerSections {
    //        case profileInfo
    //        case wishList
    //        case addNewWish
    //    }
    
    @IBOutlet weak var firstTableView: UITableView!
    @IBOutlet weak var secondTableView: UITableView!
    @IBOutlet weak var addWishButton: UIButton!
    
    //    private var dataSourse: [ControllerSections] = [.profileInfo, .wishList, .addNewWish]
    
    private var wishArraySon: [WishCellModel] = [WishCellModel(name: "Sony PlayStation 5", progress: 0.12, progressCount: "4000"),
                                                 WishCellModel(name: "Велик", progress: 0.55, progressCount: "1200")]
    private var wishArrayDoughter: [WishCellModel] = [WishCellModel(name: "Платье", progress: 0.73, progressCount: "450"),
                                                      WishCellModel(name: "iPhone 13", progress: 0.4, progressCount: "3300"),
                                                      WishCellModel(name: "Disneyland", progress: 0.21, progressCount: "5000")]
    
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
    
    
    @IBAction func addWishButtonAction(_ sender: Any) {
        let controller = AddWishViewController()
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension WishViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableView == firstTableView ? wishArraySon.count + 1 : wishArrayDoughter.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == firstTableView {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: WishProfileCell.description(), for: indexPath) as! WishProfileCell
                let model = WishProfileCellModel(avatar: #imageLiteral(resourceName: "baby-boy"), name: "Сына")
                cell.setupWithModel(model: model)
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: WishCell.description(), for: indexPath) as! WishCell
                let model = wishArraySon[indexPath.row - 1]
                cell.setupWithModel(model: model)
                return cell
            }
            
        } else if tableView == secondTableView {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: WishProfileCell.description(), for: indexPath) as! WishProfileCell
                let model = WishProfileCellModel(avatar: #imageLiteral(resourceName: "baby-girl"), name: "Доча")
                cell.setupWithModel(model: model)
                return cell
                
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: WishCell.description(), for: indexPath) as! WishCell
                let model = wishArrayDoughter[indexPath.row - 1]
                cell.setupWithModel(model: model)
                return cell
            }
        }
        return UITableViewCell()
    }
}

//MARK: - AddWishViewControllerDelegate
extension WishViewController: AddWishViewControllerDelegate {
    func sendName(_ wish: String, _ target: String, _ point: String) {
        if target == "Сына" {
            wishArraySon.append(WishCellModel(name: wish, progress: 0, progressCount: point))
            firstTableView.reloadData()
        } else if target == "Доча" {
            wishArrayDoughter.append(WishCellModel(name: wish, progress: 0, progressCount: point))
            secondTableView.reloadData()
        }
    }
}
