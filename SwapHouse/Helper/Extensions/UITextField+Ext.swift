//
//  UIControl+Ext.swift
//  SwapHouse
//
//  Created by Cansu Özdizlekli on 3/16/24.
//

import Foundation
import UIKit

extension UITextField {
    
    func toggleWarningMessageAndBorderColor(message: String) {
        
        if let warningLabel = self.superview?.viewWithTag(999) as? UILabel {
            // Text alanı boş ve mesaj varsa uyarı ver
            if let text = self.text, text.isEmpty && !message.isEmpty {
                warningLabel.text = message
                self.layer.borderColor = UIColor.red.cgColor
            } else if let text = self.text, !text.isEmpty && !message.isEmpty {
                // Text alanı dolu ve mesaj da doluysa uyarı ver
                warningLabel.text = message
                self.layer.borderColor = UIColor.red.cgColor
            } else {
                // Text alanı dolu ve mesaj boşsa uyarıyı kaldır
                warningLabel.removeFromSuperview()
                self.layer.borderColor = UIColor.systemGray3.cgColor
            }
        } else {
            // Text alanı boş ve mesaj varsa uyarı ver
            if let text = self.text, text.isEmpty && !message.isEmpty {
                let newWarningLabel = UILabel(frame: CGRect(x: 0, y: self.frame.maxY + 5, width: self.frame.width, height: 20))
                newWarningLabel.font = UIFont.systemFont(ofSize: 12)
                newWarningLabel.textColor = UIColor.red
                newWarningLabel.text = message
                newWarningLabel.textAlignment = .left
                newWarningLabel.numberOfLines = 0
                newWarningLabel.tag = 999
                self.superview?.addSubview(newWarningLabel)
                self.layer.borderColor = UIColor.red.cgColor
            } else if let text = self.text, !text.isEmpty && !message.isEmpty {
                // Text alanı dolu ve mesaj da doluysa uyarı ver
                let newWarningLabel = UILabel(frame: CGRect(x: 0, y: self.frame.maxY + 5, width: self.frame.width, height: 20))
                newWarningLabel.font = UIFont.systemFont(ofSize: 12)
                newWarningLabel.textColor = UIColor.red
                newWarningLabel.text = message
                newWarningLabel.textAlignment = .left
                newWarningLabel.numberOfLines = 0
                newWarningLabel.tag = 999
                self.superview?.addSubview(newWarningLabel)
                self.layer.borderColor = UIColor.red.cgColor
            }
        }
    }

}
