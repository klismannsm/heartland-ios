//
//  EGMSTransactionViewController.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

class EGMSTransactionViewController: UIViewController {
    var viewModel: EGMSTransactionViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEGMSTransactionSubviews()
        configureEGMSTransactionSubviews()
        constrainEGMSTransactionSubviews()
    }
    
    private func addEGMSTransactionSubviews() {
    }
    
    private func configureEGMSTransactionSubviews() {
    }
    
    private func constrainEGMSTransactionSubviews() {
    }
}

extension EGMSTransactionViewController: EGMSTransactionViewInput {
}

extension EGMSTransactionViewController: EGMSTransactionViewModelOutput {
}
