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

        
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        if emailTextField.text?.isEmpty == true {
            print("no email")
            return
        }
        if fullNameTextField.text?.isEmpty == true {
            print("no email")
            return
        }
        if passwordTextField.text?.isEmpty == true {
            print("no email")
            return
        }
        signUp()
    }
    
    @IBAction func signInButtonTapped(_ sender: Any) {
        navigateToLoginPage()
    }
    
    private func signUp(){
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult , error) in
            guard let user = authResult?.user , error == nil else {
                print("error \(String(describing: error?.localizedDescription))")
                return
            }
        }
        navigateToHomePage()
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
