//
//  UIControl+Ext.swift
//  SwapHouse
//
//  Created by Cansu Özdizlekli on 3/16/24.
//

import Foundation
import UIKit

extension UITextField {
    func toggleWarningMessage(message: String) {
        //add border
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 15.0
        
        //text control & toggle border color
        if self.text?.isEmpty == true {
            self.layer.borderColor = UIColor.red.cgColor
        } else {
            self.layer.borderColor = UIColor.lightGray.cgColor
        }
        
        // add warning label
        if let warningLabel = self.superview?.viewWithTag(999) as? UILabel {
            // Eğer text alanı boşsa ve uyarı mesajı varsa, hiçbir şey yapma
            if let text = self.text, text.isEmpty {
                return
            }
            
            // Uyarı mesajı zaten varsa ve text doluysa, kaldır
            warningLabel.removeFromSuperview()
        } else {
            // Uyarı mesajı yoksa ve text doluysa, oluştur ve ekle
            if let text = self.text, text.isEmpty {
                let warningLabel = UILabel(frame: CGRect(x: 0, y: self.frame.maxY + 5, width: self.frame.width, height: 20))
                warningLabel.font = UIFont.systemFont(ofSize: 12)
                warningLabel.textColor = UIColor.red
                warningLabel.text = message
                warningLabel.textAlignment = .left
                warningLabel.tag = 999 // Uyarı mesajını daha sonra kaldırmak için bir etiket (tag) ekleyin
                
                // Uyarı mesajını ekle
                self.superview?.addSubview(warningLabel)
            }
        }
    }

}
