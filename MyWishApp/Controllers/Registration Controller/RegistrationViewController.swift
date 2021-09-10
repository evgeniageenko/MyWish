//
//  LoginViewController.swift
//  MyWishApp
//
//  Created by Евгений Агеенко on 21.08.21.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var firtNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var birthDayTextfield: UITextField!
    @IBOutlet weak var genderTextfield: UITextField!
    @IBOutlet weak var roleTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    //MARK: DATA Properties
       private var userResponse: UserPostRequest?
       private var dataFetcher = DataFetcherService()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let jsonBody = UserPostRequest(email: emailTextfield.text ?? "",
                                       password: passwordTextfield.text ?? "",
                                       firstName: firtNameTextfield.text ?? "",
                                       lastName: lastNameTextfield.text ?? "",
                                       dateOfBirth: birthDayTextfield.text ?? "",
                                       role: roleTextfield.text ?? "",
                                       gender: genderTextfield.text ?? "")
        dataFetcher.myJson(data: jsonBody)
    }
    
}
