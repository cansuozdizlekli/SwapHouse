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
    let registerViewController = RegisterViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        checkUserInfo()
//    }
//    
//    func validateFields(){
//        if emailTextField.text?.isEmpty == true {
//            print("no email")
//            return
//        }
//        if passwordTextField.text?.isEmpty == true {
//            print("no email")
//            return
//        }
//        login()
//    }
    
//    func login(){
//        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { [weak self] authResult , err in
//            guard let strongSelf = self else {
//                return
//            }
//            if let error = err {
//                print("error \(String(describing: err?.localizedDescription))")
//            }
//        }
//        self.checkUserInfo()
//    }
//    
//    func checkUserInfo(){
//        if Auth.auth().currentUser != nil {
//            print(Auth.auth().currentUser?.uid)
//        }
//    }

    @IBAction func signUpButtonClicked(_ sender: Any) {
        presentVC(to: registerViewController)
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
//        validateFields()
    }
}
