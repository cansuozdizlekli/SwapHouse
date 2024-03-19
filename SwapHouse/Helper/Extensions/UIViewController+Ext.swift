//
//  UIViewController+Ext.swift
//  HouseSwap
//
//  Created by Cansu Özdizlekli on 3/5/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentVC(to vc: UIViewController, transitionStyle: UIModalTransitionStyle = .crossDissolve, presentationStyle: UIModalPresentationStyle = .fullScreen) {
        vc.modalPresentationStyle = presentationStyle
        vc.modalTransitionStyle = transitionStyle
        self.present(vc, animated: true)
    }
}
