//
//  WishViewController.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 21.09.21.
//

import UIKit

class WishViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addWishButton: UIButton!
    
    private var dataSourse: [String] = ["Велик"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: WishCell.description(), bundle: nil), forCellReuseIdentifier: WishCell.description())
        
    }
    
    
    @IBAction func addWishButtonAction(_ sender: Any) {
        let alert = UIAlertController(title: "Новый wish", message: "Я хочу..", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .destructive) { action in }
        let action = UIAlertAction(title: "Добавить", style: .default) { [self] action in
            let textField = alert.textFields?[0]
            dataSourse.append(textField?.text ?? "")
            tableView.reloadData()
        }
        
        alert.addAction(cancel)
        alert.addAction(action)
        alert.addTextField { (textField: UITextField) in
            //add smth
        }
        present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - UITableViewDataSource, UITableViewDelegate
extension WishViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WishCell.description(), for: indexPath) as! WishCell
//        cell.textLabel?.text = dataSourse[indexPath.row]
        return cell
    }
}
