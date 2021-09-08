//
//  EGMSHomeCoordinator.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

class EGMSHomeCoordinator {
    var deviceCoordinator: EGMSDeviceCoordinatorInput!
    var transactionCoordinator: EGMSTransactionCoordinatorInput!
    let navigationController: UINavigationController
    weak var view: EGMSHomeViewInput!
    weak var viewModel: EGMSHomeViewModelInput!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    private func startEGMSDevice() {
        let deviceCoordinator = EGMSDeviceCoordinator()
        deviceCoordinator.parentCoordinator = self
        deviceCoordinator.startEGMSDevice()
        self.deviceCoordinator = deviceCoordinator
    }
    
    private func startEGMSTransaction() {
        let transactionCoordinator = EGMSTransactionCoordinator()
        transactionCoordinator.parentCoordinator = self
        transactionCoordinator.startEGMSTransaction()
        self.transactionCoordinator = transactionCoordinator
    }
}

extension EGMSHomeCoordinator: EGMSHomeCoordinatorInput {
    func startEGMSHome() {
        let model = EGMSHomeModel()
        let viewModel = EGMSHomeViewModel()
        let view = EGMSHomeViewController(viewModel: viewModel)
        
        view.viewModel = viewModel
        viewModel.coordinator = self
        viewModel.model = model
        model.viewModel = viewModel
        viewModel.view = view
        self.view = view
        self.viewModel = viewModel
        
        navigationController.pushViewController(view, animated: false)
        
        startEGMSDevice()
        startEGMSTransaction()
    }
    
    func show(deviceView: EGMSDeviceViewInput) {
        view.add(deviceView: deviceView)
    }
    
    func show(transactionView: EGMSTransactionViewInput) {
        view.add(transactionView: transactionView)
    }
}
