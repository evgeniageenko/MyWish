//
//  AddWishViewController.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 27.09.21.
//

import UIKit

protocol AddWishViewControllerDelegate: AnyObject {
    func sendName(_ wish: String, _ target: String, _ point: String)
}

enum WishTarget: String {
    case son = "Сына"
    case doughter = "Доча"
}

class AddWishViewController: UIViewController {
    @IBOutlet weak var addWishButton: UIButton!
    @IBOutlet weak var wishNameTextField: UITextField!
    @IBOutlet weak var wishTargetTextField: UITextField!
    @IBOutlet weak var wishPointTextField: UITextField!
    
    weak var delegate: AddWishViewControllerDelegate?
    private let wishTarget: [WishTarget] = [.son, .doughter]
    
    lazy private var pickerView: UIPickerView = {
        let pickerView = UIPickerView.init()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.reloadAllComponents()
        return pickerView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addWishButton.layer.cornerRadius = 8
        wishTargetTextField.inputAccessoryView = toolBar()
        wishTargetTextField.inputView = pickerView
        
    }
    
    //КАРУСЕЛ
    @objc func endEditingAction() {
        view.endEditing(true)
    }
    
    private func toolBar() -> UIToolbar {
        var items: [UIBarButtonItem] = []
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: -50, width: 320, height: 50))
        toolbar.backgroundColor = UIColor.white
        toolbar.barStyle = .default
        toolbar.barTintColor = UIColor.white
        toolbar.isTranslucent = false
        
        let fixedSpace1 = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace1.width = 16
        
        items.append(fixedSpace1)
        items.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil))
        
        let nextActionButton = UIButton(type: .custom)
        nextActionButton.setTitle("Выбрать", for: .normal)
        nextActionButton.setTitleColor(.black, for: .normal)
        
        nextActionButton.addTarget(self, action: #selector(self.endEditingAction), for: .touchUpInside)
        nextActionButton.sizeToFit()
        
        let next = UIBarButtonItem(customView: nextActionButton)
        items.append(next)
        
        let fixedSpace2 = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixedSpace2.width = 16
        items.append(fixedSpace2)
        toolbar.items = items;
        
        return toolbar
    }
    
    
    @IBAction func addWishButtonAction(_ sender: Any) {
        if let wish = wishNameTextField.text, let target = wishTargetTextField.text, let point = wishPointTextField.text {
            delegate?.sendName(wish, target, point)
            dismiss(animated: true, completion: nil)
        }
    }
    
}

//MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension AddWishViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        wishTarget.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return wishTarget[row].rawValue
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        wishTargetTextField.text = wishTarget[row].rawValue
    }
}
