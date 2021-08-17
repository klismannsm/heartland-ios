//
//  HRGMSTerminalViewModel.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 8/17/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import Heartland_iOS_SDK

struct HRGMSTerminalViewModel: Identifiable {
    var connected: Bool
    let id: UUID
    let name: String
    
    init(terminalInfo: HpsTerminalInfo) {
        self.connected = terminalInfo.connected
        self.id = terminalInfo.identifier
        self.name = terminalInfo.name
    }
    
    mutating func update(connected: Bool) {
        self.connected = connected
    }
}
