//
//  EGMSTransactionViewModel.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import Foundation

class EGMSTransactionViewModel {
    var coordinator: EGMSTransactionCoordinatorInput!
    var model: EGMSTransactionModelInput!
    weak var view: EGMSTransactionViewModelOutput!
}

extension EGMSTransactionViewModel: EGMSTransactionModelOutput {
}

extension EGMSTransactionViewModel: EGMSTransactionViewModelInput {
}
