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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkUserInfo()
    }
    
    func validateFields(){
        if emailTextField.text?.isEmpty == true {
            print("no email")
            return
        }
        if passwordTextField.text?.isEmpty == true {
            print("no email")
            return
        }
        login()
    }
    
    func login(){
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult , err in
            guard let strongSelf = self else {
                return
            }
            if let error = err {
                print("error \(String(describing: err?.localizedDescription))")
            }
        }
        self.checkUserInfo()
    }
    
    func checkUserInfo(){
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            navigateToHomePage()
        }
    }

    @IBAction func signUpButtonClicked(_ sender: Any) {
        navigateToRegisterPage()
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        validateFields()
    }
    
    private func navigateToRegisterPage(){
        let vc = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func navigateToHomePage(){
        let vc = HomeViewController(nibName: "HomeViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}
