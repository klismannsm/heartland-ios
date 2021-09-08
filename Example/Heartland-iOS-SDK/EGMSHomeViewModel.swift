//
//  EGMSHomeViewModel.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import Foundation

class EGMSHomeViewModel {
    var coordinator: EGMSHomeCoordinatorInput!
    var model: EGMSHomeModelInput!
    weak var view: EGMSHomeViewModelOutput!
}

extension EGMSHomeViewModel: EGMSHomeModelOutput {
}

extension EGMSHomeViewModel: EGMSHomeViewModelInput {
}
