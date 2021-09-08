//
//  EGMSDeviceViewController.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

class EGMSDeviceViewController: UIViewController {
    weak var scanButton: UIButton!
    var viewModel: EGMSDeviceViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .egmsBlue
        
        addEGMSDeviceSubviews()
        configureEGMSDeviceSubviews()
        constrainEGMSDeviceSubviews()
    }
    
    private func addEGMSDeviceSubviews() {
        let scanButton = UIButton()
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(scanButton)
        
        self.scanButton = scanButton
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
