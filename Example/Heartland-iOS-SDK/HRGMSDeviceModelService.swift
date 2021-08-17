//
//  HRGMSDeviceModelService.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 8/17/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import Heartland_iOS_SDK
import SwiftUI

@available(iOS 13.0, *)
class HRGMSDeviceModelService: ObservableObject {
    @Published var model = HRGMSDeviceModel()
    
    init() {
        addWiseCubeDeviceFromSampleConfig()
    }
    
    func addWiseCubeDevice(config: HpsConnectionConfig) {
        let wisecube = HpsWiseCubeDevice(config: config)
        wisecube.deviceDelegate = self
        wisecube.deviceScanObserver = self
        model.gmsDevice = wisecube
    }
    
    func addWiseCubeDeviceFromSampleConfig() {
        let config = HpsConnectionConfig()
        config.versionNumber = "3409"
        config.developerID = "002914"
        config.username = "701389328"
        config.password = "$Test1234"
        config.siteID = "142914"
        config.deviceID = "6399854"
        config.licenseID = "142827"
        config.timeout = 60
        addWiseCubeDevice(config: config)
    }
    
    func resetScanState() {
        stopScan()
        model.gmsDeviceError = nil
    }
    
    func startScan() {
        model.gmsDevice?.scan()
    }
    
    func stopScan() {
        model.gmsDevice?.stopScan()
    }
}

@available(iOS 13.0, *)
extension HRGMSDeviceModelService: GMSDeviceDelegate {
    func onBluetoothDeviceList(_ peripherals: NSMutableArray) {
        model.gmsDevicePeripheralList = peripherals as! [HpsTerminalInfo]
    }
    
    func onConnected() {
        model.gmsDeviceIsConnected = true
    }
    
    func onDisconnected() {
        model.gmsDeviceIsConnected = false
    }
    
    func onError(_ deviceError: NSError) {
        model.gmsDeviceError = deviceError
    }
}

@available(iOS 13.0, *)
extension HRGMSDeviceModelService: GMSDeviceScanObserver {
    func deviceDidUpdateScanState(to isScanning: Bool) {
        model.gmsDeviceIsScanning = isScanning
    }
}
