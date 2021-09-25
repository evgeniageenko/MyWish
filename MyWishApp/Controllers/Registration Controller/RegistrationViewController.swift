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
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: DATA Properties
    private var userResponse: UserPostRequest?
    private var dataFetcher = DataFetcherService()
    private var userToken: TokenModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 8
    }
    
    
    @IBAction func loginButtonAction(_ sender: Any) {
        
        //create user
        let jsonBody = UserPostRequest(email: emailTextfield.text ?? "",
                                       password: passwordTextfield.text ?? "",
                                       firstName: firtNameTextfield.text ?? "",
                                       lastName: lastNameTextfield.text ?? "",
                                       dateOfBirth: birthDayTextfield.text ?? "",
                                       role: roleTextfield.text ?? "",
                                       gender: genderTextfield.text ?? "")
        
        //registration + get token
        dataFetcher.myJson(data: jsonBody, completion: { [weak self] userModel in
            DispatchQueue.main.async { [weak self] in
                self?.dataFetcher.requestAccessAndRefreshTokens(email: self?.emailTextfield.text ?? "",
                                                                password: self?.passwordTextfield.text ?? "",
                                                                completion: { token in
                                                                    // guard let self = self, let token = token else { return }
                                                                    print(token)
                                                                    
                                                                })
            }
        print(userModel)
        })
        //save data to keychain
        
        //go to TasksViewController
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyBoard.instantiateViewController(withIdentifier: "MainTabBar") as? MainTabBar  else { return }
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
        
    }
}

