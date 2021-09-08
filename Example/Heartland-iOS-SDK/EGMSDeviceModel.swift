//
//  EGMSDeviceModel.swift
//  
//
//  Created by Desimini, Wilson on 7/23/21.
//

import Heartland_iOS_SDK

class EGMSDeviceModel {
    weak var viewModel: EGMSDeviceModelOutput!
    
    init() {
        addSampleWiseCubeDevice()
    }
    
    private func addSampleWiseCubeDevice() {
        let config = HpsConnectionConfig()
        config.versionNumber = "3409"
        config.developerID = "002914"
        config.username = "701385995"
        config.password = "$Test1234"
        config.siteID = "142913"
        config.deviceID = "6398417"
        config.licenseID = "142826"
        addWiseCubeDevice(with: config)
    }
    
    private func addWiseCubeDevice(with config: HpsConnectionConfig) {
        let device = HpsWiseCubeDevice(config: config)
        device.deviceDelegate = self
        device.deviceScanObserver = self
        EGMSDataManager.shared.device = device
    }
}

extension EGMSDeviceModel: EGMSDeviceModelInput {
    func connect(terminalWithId terminalId: UUID) {
        let manager = EGMSDataManager.shared
        let matches = manager.terminals.filter { $0.identifier == terminalId }
        guard let terminal = matches.first else { return }
        manager.device.connectDevice(terminal)
    }
    
    func startScan() {
        EGMSDataManager.shared.device.scan()
    }
    
    func stopScan() {
        EGMSDataManager.shared.device.stopScan()
    }
}

extension EGMSDeviceModel: GMSDeviceDelegate {
    func onConnected() {
        viewModel.gmsDeviceModelDidUpdate(connected: true)
    }
    
    func onDisconnected() {
        viewModel.gmsDeviceModelDidUpdate(connected: false)
    }
    
    func onError(_ deviceError: NSError) {
        viewModel.gmsDeviceModelDidReceive(error: deviceError)
    }
    
    func onBluetoothDeviceList(_ peripherals: NSMutableArray) {
        let terminals = peripherals as! [HpsTerminalInfo]
        EGMSDataManager.shared.terminals = terminals
        
        viewModel.gmsDeviceModelDidFind(terminals: terminals)
    }
}

extension EGMSDeviceModel: GMSDeviceScanObserver {
    func deviceDidUpdateScanState(to isScanning: Bool) {
        viewModel.gmsDeviceModelDidUpdate(scanning: isScanning)
    }
}
