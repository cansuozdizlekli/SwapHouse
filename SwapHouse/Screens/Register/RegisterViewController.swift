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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        guard validateFields() else {
            return
        }
        signUp()
    }

    
    @IBAction func signInButtonTapped(_ sender: Any) {
        navigateToLoginPage()
    }
    
    
    @IBAction func forgetPasswordButtonTapped(_ sender: Any) {
        navigateToForgetPasswordPage()
    }
    
    
    private func initUI(){
        fullNameTextField.layer.masksToBounds = true
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.masksToBounds = true
        passwordTextField.textContentType = .oneTimeCode
    }
    
    private func signUp() {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult , error) in
            guard let user = authResult?.user, error == nil else {
                if let errorDescription = error?.localizedDescription {
                    if errorDescription.contains("email") {
                        self.emailTextField.toggleWarningMessageAndBorderColor(message: errorDescription)
                    } else if errorDescription.contains("password") {
                        self.passwordTextField.toggleWarningMessageAndBorderColor(message: errorDescription)
                    } else {
                        self.fullNameTextField.toggleWarningMessageAndBorderColor(message: errorDescription)
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
    
    private func navigateToForgetPasswordPage(){
        let vc = ForgetPasswordViewController(nibName: "ForgetPasswordViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func validateFields() -> Bool {
        var isValidated = true
        
        if fullNameTextField.text?.isEmpty == true  {
            fullNameTextField.toggleWarningMessageAndBorderColor(message: "The name is empty.")
            isValidated = false
        } else {
            fullNameTextField.toggleWarningMessageAndBorderColor(message: "")
        }
        
        if emailTextField.text?.isEmpty == true {
            emailTextField.toggleWarningMessageAndBorderColor(message: "The email is empty.")
            isValidated = false
        } else {
            emailTextField.toggleWarningMessageAndBorderColor(message: "")
        }
        
        if passwordTextField.text?.isEmpty == true {
            passwordTextField.toggleWarningMessageAndBorderColor(message: "The password is empty.")
            isValidated = false
        } else {
            passwordTextField.toggleWarningMessageAndBorderColor(message: "")
        }
        
        return isValidated
    }
    

}
