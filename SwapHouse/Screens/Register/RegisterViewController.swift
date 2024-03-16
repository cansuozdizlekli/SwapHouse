//
//  RegisterViewController.swift
//  HouseSwap
//
//  Created by Cansu Özdizlekli on 3/5/24.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        // Alanların doluluk kontrolü ve uyarı mesajlarını eklemek
        if fullNameTextField.text?.isEmpty == true {
            fullNameTextField.toggleWarningMessage(message: "The name is empty.")
            fullNameTextField.addBorder()
            return
        }
        
        if emailTextField.text?.isEmpty == true {
            emailTextField.toggleWarningMessage(message: "The email is empty.")
            emailTextField.addBorder()
            return
        }
        
        if passwordTextField.text?.isEmpty == true {
            passwordTextField.toggleWarningMessage(message: "The password is empty.")
            passwordTextField.addBorder()
            return
        }
        
        signUp()
    }

    
    @IBAction func signInButtonTapped(_ sender: Any) {
        navigateToLoginPage()
    }
    
    private func initUI(){
        fullNameTextField.layer.masksToBounds = true
        fullNameTextField.layer.cornerRadius = 15.0
        fullNameTextField.layer.borderWidth = 1.0
        fullNameTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        emailTextField.layer.masksToBounds = true
        emailTextField.layer.cornerRadius = 15.0
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.cornerRadius = 15.0
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    private func signUp(){
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult , error) in
            guard let user = authResult?.user , error == nil else {
                print("error \(String(describing: error?.localizedDescription))")
                if let errorDescription = error?.localizedDescription {
                    print(error?.localizedDescription)
                    if errorDescription.contains("email") {
                        self.emailTextField.toggleWarningMessage(message: errorDescription)
                        self.emailTextField.addBorder()
                        print("giriyo mu")
                    }
                    if errorDescription.contains("password") {
                        self.passwordTextField.toggleWarningMessage(message: errorDescription)
                        self.passwordTextField.addBorder()
                    } else {
                        self.fullNameTextField.toggleWarningMessage(message: errorDescription)
                        self.fullNameTextField.addBorder()
                    }
                }
                return
            }
            self.navigateToHomePage()
        }
    }
    
    private func navigateToLoginPage(){
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func navigateToHomePage(){
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    

}
