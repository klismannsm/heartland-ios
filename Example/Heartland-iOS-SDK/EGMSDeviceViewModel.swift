//
//  EGMSDeviceViewModel.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import Foundation

class EGMSDeviceViewModel {
    var coordinator: EGMSDeviceCoordinatorInput!
    var model: EGMSDeviceModelInput!
    weak var view: EGMSDeviceViewModelOutput!
}

extension EGMSDeviceViewModel: EGMSDeviceModelOutput {
}

extension EGMSDeviceViewModel: EGMSDeviceViewModelInput {
}
