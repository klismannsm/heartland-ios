//
//  EGMSDeviceViewModel.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import Foundation
import Heartland_iOS_SDK

class EGMSDeviceViewModel {
    var coordinator: EGMSDeviceCoordinatorInput!
    var model: EGMSDeviceModelInput!
    private var isScanning = false
    weak var view: EGMSDeviceViewModelOutput!
}

extension EGMSDeviceViewModel: EGMSDeviceModelOutput {
    func gmsDeviceModelDidFind(terminals: [HpsTerminalInfo]) {
        view.show(terminals: terminals)
    }
    
    func gmsDeviceModelDidReceive(error: Error) {
        view.show(error: error)
    }
    
    func gmsDeviceModelDidUpdate(connected: Bool) {
        view.show(connected: connected)
    }
    
    func gmsDeviceModelDidUpdate(scanning: Bool) {
        isScanning = scanning
        view.show(scanning: scanning)
    }
}

extension EGMSDeviceViewModel: EGMSDeviceViewModelInput {
    func toggleScan() {
        isScanning ? model.stopScan() : model.startScan()
    }
}
