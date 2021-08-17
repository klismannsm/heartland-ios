//
//  HRGMSDeviceModel.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 8/17/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import Heartland_iOS_SDK

struct HRGMSDeviceModel {
    var gmsDevice: GMSDevice?
    var gmsDeviceError: NSError?
    var gmsDeviceIsConnected = false
    var gmsDeviceIsScanning = false
    var gmsDevicePeripheralList = [HpsTerminalInfo]()
}
