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
    private var isScanning = false {
        didSet { view.updateScanViews() }
    }
    weak var view: EGMSDeviceViewModelOutput!
}

extension EGMSDeviceViewModel: EGMSDeviceModelOutput {
}

extension EGMSDeviceViewModel: EGMSDeviceViewModelInput {
    var egmsDeviceScanButtonTitle: String {
        isScanning
            ? "Stop Scanning"
            : "Scan for Devices"
    }
    
    func toggleScan() {
        isScanning = !isScanning
    }
}
