//
//  TasksViewController.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 16.09.21.
//

import UIKit

class Task {
    let name: String
    var isFavorite: Bool
    var isDone: Bool
    
    init(name: String, isFavorite: Bool, isDone: Bool) {
        self.name = name
        self.isFavorite = isFavorite
        self.isDone = isDone
    }
}


class TasksViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addWishButton: UIButton!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
//    private var sonTasks: [String] = ["сделать дз"]
//    private var daughterTasks: [String] = []
//    lazy private var dataSourse: [String] = sonTasks
    
    private var sonTasks: [Task] = [Task(name: "Помыть пол", isFavorite: false, isDone: false),
                                    Task(name: "Cделать домашку", isFavorite: false, isDone: false),
                                    Task(name: "Почитать книгу", isFavorite: false, isDone: false),
                                    Task(name: "Сходить в магазин", isFavorite: false, isDone: false),
                                    Task(name: "Почистить картошку", isFavorite: false, isDone: false) ]
    private var daughterTasks: [Task] = [Task(name: "Помочь бабушке", isFavorite: false, isDone: false),
                                         Task(name: "Сделать папе массаж", isFavorite: true, isDone: false),
                                         Task(name: "Протереть пыль в зале ", isFavorite: false, isDone: false),
                                         Task(name: "Выучить стих", isFavorite: false, isDone: false)]
    lazy private var dataSourse: [Task] = sonTasks
    
//  private var tasks: [Task] = ["помыть пол"].compactMap({Task(name: $0, isFavorite: false, isDone: false)})
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        segmentControl.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        
    }
    
    @objc fileprivate func handleSegmentChange() {

        switch segmentControl.selectedSegmentIndex {
        case 0:
            dataSourse = sonTasks
        case 1:
            dataSourse = daughterTasks
        default:
            break
        }
        tableView.reloadData()
    }
    
    
    @IBAction func addTaskButtonAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Новая задача", message: "Что будем делать?", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .destructive) { action in }
        let action = UIAlertAction(title: "Добавить", style: .default) { [self] action in
            let textField = alert.textFields?[0]

            switch segmentControl.selectedSegmentIndex {
            case 0:
                sonTasks.append(Task(name: textField?.text ?? "", isFavorite: false, isDone: false))
            case 1:
                daughterTasks.append(Task(name: textField?.text ?? "", isFavorite: false, isDone: false))
            default:
                break
                
            }
            dataSourse.append(Task(name: textField?.text ?? "", isFavorite: false, isDone: false))
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

// MARK: - UITableViewDataSource, UITableViewDelegate
extension TasksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = dataSourse[indexPath.row]
        cell.textLabel?.text = "\(indexPath.row + 1). \(task.name)"
        if task.isFavorite {
            cell.backgroundColor = .systemYellow
        } else if task.isDone {
            cell.backgroundColor = .systemGreen
        } else {
            cell.backgroundColor = nil
        }
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //delete - NEW METHOD iOS13 +
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Удалить") { (action, indexPath) in
            self.dataSourse.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let task = dataSourse[indexPath.row]
        let favoriteActionTitle = task.isFavorite ? "Неважная" : "Важная"
        let acceptActionTitle = task.isDone ? "Не сделано" : "Сделано"
        
        
        let acceptAction = UITableViewRowAction(style: .destructive, title: acceptActionTitle) { (action, IndexPath) in
            self.dataSourse[indexPath.row].isDone.toggle()
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        let favoriteAction = UITableViewRowAction(style: .normal, title: favoriteActionTitle) { (action, IndexPath) in
            self.dataSourse[indexPath.row].isFavorite.toggle()
            self.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        favoriteAction.backgroundColor = .systemYellow
        acceptAction.backgroundColor = .systemGreen

        return [deleteAction, acceptAction, favoriteAction]
    }
    
}
