//
//  HRGMSDeviceViewModel.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 8/17/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import Heartland_iOS_SDK

@available(iOS 13.0, *)
class HRGMSDeviceViewModel: ObservableObject {
    private static func addHRGMSDeviceModel() -> HRGMSDeviceModel {
        HRGMSDeviceModel()
    }
    
    @Published private var model: HRGMSDeviceModel = addHRGMSDeviceModel()
    
    var gmsTerminalViewModels: [HRGMSTerminalViewModel] {
        model.gmsDevicePeripheralList.map {
            HRGMSTerminalViewModel(terminalInfo: $0)
        }
    }
    
    var scanButtonTitle: String {
        model.gmsDeviceIsScanning ? "Stop Scan" : "Scan"
    }
    
    func toggleDeviceScan() {
        model.gmsDeviceIsScanning
            ? model.stopScan()
            : model.startScan()
    }
}
