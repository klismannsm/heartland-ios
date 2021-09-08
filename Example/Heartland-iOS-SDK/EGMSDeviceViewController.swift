//
//  EGMSDeviceViewController.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

class EGMSDeviceViewController: UIViewController {
    var viewModel: EGMSDeviceViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addEGMSDeviceSubviews()
        configureEGMSDeviceSubviews()
        constrainEGMSDeviceSubviews()
    }
    
    private func addEGMSDeviceSubviews() {
    }
    
    private func configureEGMSDeviceSubviews() {
    }
    
    private func constrainEGMSDeviceSubviews() {
    }
}

extension EGMSDeviceViewController: EGMSDeviceViewInput {
}

extension EGMSDeviceViewController: EGMSDeviceViewModelOutput {
}
