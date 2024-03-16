//
//  BaseViewController.swift
//  HouseSwap
//
//  Created by Cansu Özdizlekli on 3/15/24.
//

import UIKit

class BaseViewController: UIViewController {
    private var viewModel: BaseViewModel!
    
    private var progressViewCount = 0
//    private lazy var progressView = NVActivityIndicatorView(frame: .zero)
    let backView = UIView()
    
    private var workItem: DispatchWorkItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let baseVM = provideViewModel() else {
            fatalError("A view model must be provided")
        }
        
        viewModel = baseVM
        viewModel.baseVMDelegate = self
        viewModel.viewDidLoad()
        
        view.addSubview(backView)
//        configureProgressView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        viewModel.viewWillDisappear()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    // - BaseViewModel provider
    func provideViewModel() -> BaseViewModel? {
        return nil
    }
    
//    private func configureProgressView() {
//        progressView = NVActivityIndicatorView(frame: .zero, type: .ballSpinFadeLoader, color: .white, padding: 20)
//        progressView.translatesAutoresizingMaskIntoConstraints = false
//        backView.addSubview(progressView)
//        NSLayoutConstraint.activate([
//            progressView.widthAnchor.constraint(equalToConstant: 90),
//            progressView.heightAnchor.constraint(equalToConstant: 90),
//            progressView.centerXAnchor.constraint(equalTo: self.backView.centerXAnchor),
//            progressView.centerYAnchor.constraint(equalTo: self.backView.centerYAnchor)
//        ])
////        progressView.backgroundColor = .systemGray4
//        progressView.layer.cornerRadius = 8
//    }
}


//    MARK: - BaseViewModel Delegate
extension BaseViewController: BaseViewModelDelegate {
    @objc func contentWillLoad() {
        progressViewCount += 1
        guard progressViewCount == 1 else {
            return
        }

        addBackView()
//        progressView.startAnimating()
    }
    
    func contentDidLoad() {
        progressViewCount -= 1
        guard progressViewCount == 0 else {
            return
        }
//        progressView.stopAnimating()
        removeBackView()
    }
    
    func readyForContent() { }
    
}

extension BaseViewController {
    func addBackView() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        backView.backgroundColor = .black.withAlphaComponent(0.47)
        backView.alpha = 1
        view.addSubview(backView)
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func removeBackView() {
        UIView.transition(with: backView, duration: 0.3, options: .transitionCrossDissolve) {
            self.backView.alpha = 0
        } completion: { _ in
            self.backView.removeFromSuperview()
        }
    }
}

