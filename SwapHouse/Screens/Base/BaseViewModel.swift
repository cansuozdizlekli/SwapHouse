//
//  BaseViewModel.swift
//  HouseSwap
//
//  Created by Cansu Özdizlekli on 3/15/24.
//

import UIKit

protocol BaseViewModelDelegate: AnyObject {
    func contentWillLoad()
    func contentDidLoad()
    func readyForContent()
}

class BaseViewModel: NSObject {
    
    weak var baseVMDelegate: BaseViewModelDelegate?
    
    func viewDidLoad(){ }
    
    func viewWillAppear(){
        
    }
    
    func viewDidAppear() {
        baseVMDelegate?.readyForContent()
    }
    
    func viewWillDisappear(){ }
    
    func viewDidDisappear(){ }
    
}
