//
//  EGMSTransactionCoordinator.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

class EGMSTransactionCoordinator {
    weak var parentCoordinator: EGMSTransactionCoordinatorOutput!
    weak var view: EGMSTransactionViewInput!
    weak var viewModel: EGMSTransactionViewModelInput!
}

extension EGMSTransactionCoordinator: EGMSTransactionCoordinatorInput {
    func startEGMSTransaction() {
        let model = EGMSTransactionModel()
        let view = EGMSTransactionViewController()
        let viewModel = EGMSTransactionViewModel()
        
        view.viewModel = viewModel
        viewModel.coordinator = self
        viewModel.model = model
        model.viewModel = viewModel
        viewModel.view = view
        self.view = view
        self.viewModel = viewModel
        
        parentCoordinator.show(transactionView: view)
    }
}
