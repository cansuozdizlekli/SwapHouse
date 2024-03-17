//
//  ForgetPasswordViewController.swift
//  SwapHouse
//
//  Created by Cansu Özdizlekli on 3/17/24.
//

import UIKit
import FirebaseAuth

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func resetPasswordButtonTapped(_ sender: Any) {
        guard let email = emailTextField.text, !email.isEmpty else {
            showAlert(title: "Error", message: "Please enter your email.")
            return
        }
        
        // Firebase Authentication ile parola sıfırlama bağlantısı gönder
        Auth.auth().sendPasswordReset(withEmail: email) { [weak self] (error) in
            guard let strongSelf = self else { return }
            
            if let error = error {
                // Hata varsa, uygun bir hata mesajı göster
                strongSelf.showAlert(title: "Error", message: error.localizedDescription)
                print("Error sending password reset email: \(error.localizedDescription)")
                return
            }
            
            // Parola sıfırlama bağlantısı başarıyla gönderildiyse, kullanıcıya bilgi ver
            strongSelf.showAlert(title: "Success", message: "Password reset email has been sent to \(email)")
        }
    }
    
    private func handleResetPasswordError(error: Error) {
        if let errorCode = AuthErrorCode.Code(rawValue: (error as NSError).code) {
                switch errorCode {
                    case .invalidEmail:
                        emailTextField.toggleWarningMessageAndBorderColor(message: "Please enter a valid email.")
                    case .userNotFound:
                        emailTextField.toggleWarningMessageAndBorderColor(message: "User with this email does not exist.")
                    default:
                        showAlert(title: "Error", message: error.localizedDescription)
                }
            } else {
                showAlert(title: "Error", message: error.localizedDescription)
        }
    }

    
    func showAlert(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { _ in
                // "OK" düğmesine basıldığında navigasyonu gerçekleştir
                self.navigateToLoginPage()
            }
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
    }
    
    private func navigateToLoginPage(){
        let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}
