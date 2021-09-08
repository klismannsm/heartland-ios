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
        
        view.addSubview(scanButton)
        
        self.scanButton = scanButton
    }
    
    private func configureEGMSDeviceSubviews() {
        scanButton.addTarget(self, action: #selector(scanTapped), for: .touchUpInside)
        scanButton.backgroundColor = .egmsGreen
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        updateScanViews()
    }
    
    private func constrainEGMSDeviceSubviews() {
        NSLayoutConstraint.activate([
            scanButton.heightAnchor.constraint(equalToConstant: 54),
            scanButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            scanButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            scanButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
        ])
    }
    
    @objc private func scanTapped() {
        viewModel.toggleScan()
    }
}

extension EGMSDeviceViewController: EGMSDeviceViewInput {
}

extension EGMSDeviceViewController: EGMSDeviceViewModelOutput {
    func updateScanViews() {
        scanButton.setTitle(viewModel.egmsDeviceScanButtonTitle, for: .normal)
    }
}
