//
//  EGMSDeviceCoordinator.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

class EGMSDeviceCoordinator {
    weak var parentCoordinator: EGMSDeviceCoordinatorOutput!
    weak var view: EGMSDeviceViewInput!
    weak var viewModel: EGMSDeviceViewModelInput!
}

extension EGMSDeviceCoordinator: EGMSDeviceCoordinatorInput {
    func startEGMSDevice() {
        let model = EGMSDeviceModel()
        let view = EGMSDeviceViewController()
        let viewModel = EGMSDeviceViewModel()
        
        view.viewModel = viewModel
        viewModel.coordinator = self
        viewModel.model = model
        model.viewModel = viewModel
        viewModel.view = view
        self.view = view
        self.viewModel = viewModel
        
        parentCoordinator.show(deviceView: view)
    }
}
