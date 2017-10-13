//
//  SignInVC.swift
//  devslopes-chat
//
//  Created by Jean-François Droux on 26.09.17.
//  Copyright © 2017 Droux. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 8

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        setUsername()
        if AuthService.instance.isLoggedIn {
            performSegue(withIdentifier: "showMainVC", sender: nil)
        }
    }
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func setUsername() {
        if let user = Auth.auth().currentUser {
            AuthService.instance.isLoggedIn = true
            let emailComponents = user.email?.components(separatedBy: "@")
            if let username = emailComponents?[0] {
                AuthService.instance.username = username
            }
        } else {
            AuthService.instance.isLoggedIn = false
            AuthService.instance.username = nil
        }
    }
    @IBAction func signInTapped(sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            self.showAlert(title: "Error", message: "Please enter an email and password")
            return
        }
        guard
            email != "", password != "" else {
                self.showAlert(title: "Error", message: "Please enter an email and password")
                return
        }
        AuthService.instance.emailLogin(email, password: password) {(success, message) in
            if success {
                self.setUsername()
                print(AuthService.instance.username ?? "Ca a merdé")
                self.performSegue(withIdentifier: "showMainVC", sender: nil)
            } else {
                self.showAlert(title: "Failure", message: message)
            }
        }
        DataService.instance.loadMessages { (success) in
            if !success { print("Load Firebase data FAILED!")
            } else {
                print("Success!")
            }
        }
    }
}


