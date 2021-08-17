//
//  HRGMSDeviceViewModel.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 8/17/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import Combine
import SwiftUI

@available(iOS 13.0, *)
class HRGMSDeviceViewModel: ObservableObject {
    @Published private var model: HRGMSDeviceModel!
    private lazy var modelObserver = service.$model.sink { self.model = $0 }
    @ObservedObject private var service = HRGMSDeviceModelService()
    
    var gmsDeviceError: NSError? {
        model.gmsDeviceError
    }
    
    var gmsTerminalViewModels: [HRGMSTerminalViewModel] {
        model.gmsDevicePeripheralList.map {
            HRGMSTerminalViewModel(terminalInfo: $0)
        }
    }
    
    var scanButtonTitle: String {
        model.gmsDeviceIsScanning ? "Stop Scan" : "Scan"
    }
    
    func resetScanState() {
        service.resetScanState()
    }
    
    func toggleDeviceScan() {
        model.gmsDeviceIsScanning
            ? service.stopScan()
            : service.startScan()
    }
}
