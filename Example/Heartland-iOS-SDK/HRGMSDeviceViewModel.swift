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
    private var modelObserver: AnyCancellable?
    @ObservedObject private var service = HRGMSDeviceModelService()
    
    init() {
        modelObserver = service.$model.sink { self.model = $0 }
    }
    
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
