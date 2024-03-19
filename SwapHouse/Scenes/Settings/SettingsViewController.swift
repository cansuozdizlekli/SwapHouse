//
//  SettingsViewController.swift
//  SwapHouse
//
//  Created by Cansu Özdizlekli on 3/19/24.
//

import UIKit
import FirebaseAuth

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func logoutButtonTapped(_ sender: Any) {
        logout()
    }
    
    private func logout(){
        do {
            try Auth.auth().signOut()
            self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
        } catch let error {
            print("Çıkış yaparken bir hata oluştu: \(error.localizedDescription)")
        }
    
    }
    
}
