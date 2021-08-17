//
//  HRGMSDeviceModel.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 8/17/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import Heartland_iOS_SDK

class HRGMSDeviceModel {
    private var gmsDevice: GMSDevice?
    private(set) var gmsDeviceError: NSError?
    private(set) var gmsDeviceIsConnected = false
    private(set) var gmsDeviceIsScanning = false
    private(set) var gmsDevicePeripheralList = [HpsTerminalInfo]()
    
    func addWiseCubeDevice(config: HpsConnectionConfig) {
        let wisecube = HpsWiseCubeDevice(config: config)
        wisecube.deviceDelegate = self
        wisecube.deviceScanObserver = self
        gmsDevice = wisecube
    }
    
    func startScan() {
        gmsDevice?.scan()
    }
    
    func stopScan() {
        gmsDevice?.stopScan()
    }
}

extension HRGMSDeviceModel: GMSDeviceDelegate {
    func onBluetoothDeviceList(_ peripherals: NSMutableArray) {
        gmsDevicePeripheralList = peripherals as! [HpsTerminalInfo]
    }
    
    func onConnected() {
        gmsDeviceIsConnected = true
    }
    
    func onDisconnected() {
        gmsDeviceIsConnected = false
    }
    
    func onError(_ deviceError: NSError) {
        gmsDeviceError = deviceError
    }
}

extension HRGMSDeviceModel: GMSDeviceScanObserver {
    func deviceDidUpdateScanState(to isScanning: Bool) {
        gmsDeviceIsScanning = isScanning
    }
}
