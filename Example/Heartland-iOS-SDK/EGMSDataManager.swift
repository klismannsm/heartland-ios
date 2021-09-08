//
//  EGMSDataManager.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 9/8/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import Heartland_iOS_SDK

class EGMSDataManager {
    static let shared = EGMSDataManager()
    
    var device: GMSDevice!
    var terminals = [HpsTerminalInfo]()
    
    private init() {}
}
