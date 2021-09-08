//
//  EGMSHomeViewController.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

class EGMSHomeViewController: UIViewController {
    weak var deviceView: EGMSDeviceViewInput!
    weak var transactionView: EGMSTransactionViewInput!
    var viewModel: EGMSHomeViewModelInput!
    
    init(viewModel: EGMSHomeViewModelInput) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEGMSHomeSubviews()
        configureEGMSHomeSubviews()
        constrainEGMSHomeSubviews()
    }
    
    private func addEGMSHomeSubviews() {
    }
    
    private func configureEGMSHomeSubviews() {
    }
    
    private func constrainEGMSHomeSubviews() {
    }
}

extension EGMSHomeViewController: EGMSHomeViewInput {
    func add(deviceView: EGMSDeviceViewInput) {
        add(deviceView)
        self.deviceView = deviceView
        
        let childView = deviceView.view!
        childView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            childView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            childView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, constant: -32),
            childView.leftAnchor.constraint(equalTo: safeArea.leftAnchor, constant: 16),
            childView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5, constant: -24),
        ])
    }
    
    func add(transactionView: EGMSTransactionViewInput) {
        add(transactionView)
        self.transactionView = transactionView
        
        let childView = transactionView.view!
        childView.translatesAutoresizingMaskIntoConstraints = false
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            childView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            childView.heightAnchor.constraint(equalTo: safeArea.heightAnchor, constant: -32),
            childView.rightAnchor.constraint(equalTo: safeArea.rightAnchor, constant: -16),
            childView.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.5, constant: -24),
        ])
    }
}

extension EGMSHomeViewController: EGMSHomeViewModelOutput {
}
