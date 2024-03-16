//
//  RegisterViewController.swift
//  HouseSwap
//
//  Created by Cansu Özdizlekli on 3/5/24.
//

import UIKit
//import Firebase
//import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
//    var loginViewController = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
//        presentVC(to: loginViewController)
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authResult , error) in
            guard let user = authResult?.user , error == nil else {
                print("error \(String(describing: error?.localizedDescription))")
                return
            }
        }
    }

}
