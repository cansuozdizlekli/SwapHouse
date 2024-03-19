//
//  LoginViewController.swift
//  HouseSwap
//
//  Created by Cansu Özdizlekli on 3/5/24.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }
    
    private func initUI(){
        emailTextField.layer.masksToBounds = true
        passwordTextField.layer.masksToBounds = true
    }
    
    func validateFields() -> Bool{
        var isValidated = true
        
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
    
    func login(){
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult , error) in
            guard let user = authResult?.user, error == nil else {
                if let errorDescription = error?.localizedDescription {
                    if errorDescription.contains("email") {
                        self.emailTextField.toggleWarningMessageAndBorderColor(message: errorDescription)
                    } else if errorDescription.contains("password") {
                        self.passwordTextField.toggleWarningMessageAndBorderColor(message: errorDescription)
                    }
                }
                return
            }
            self.checkUserInfo()
        }
    }
    
    func checkUserInfo(){
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.email)
            self.navigateToHomePage()
        }else {
            print("giris yapılamadı")
        }
    }

    @IBAction func signUpButtonClicked(_ sender: Any) {
        navigateToRegisterPage()
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        guard validateFields() else {
            return
        }
        login()
    }
    
    private func navigateToRegisterPage(){
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func navigateToHomePage(){
        let vc = SettingsViewController(nibName: "SettingsViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true) {
            let transition = CATransition()
            transition.type = .push
            transition.subtype = .fromLeft
            transition.duration = 0.3
            self.view.window?.layer.add(transition, forKey: kCATransition)
        }
    }
}
