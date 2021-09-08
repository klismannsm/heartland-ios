//
//  EGMSDeviceContract.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import Heartland_iOS_SDK
import UIKit

protocol EGMSDeviceCoordinatorInput: AnyObject {
    func startEGMSDevice()
}

protocol EGMSDeviceCoordinatorOutput: AnyObject {
    func show(deviceView: EGMSDeviceViewInput)
}

protocol EGMSDeviceModelInput: AnyObject {
    func connect(terminalWithId terminalId: UUID)
    func startScan()
    func stopScan()
}

protocol EGMSDeviceModelOutput: AnyObject {
    func gmsDeviceModelDidFind(terminals: [HpsTerminalInfo])
    func gmsDeviceModelDidReceive(error: Error)
    func gmsDeviceModelDidUpdate(scanning: Bool)
    func gmsDeviceModelDidUpdate(connected: Bool)
}

protocol EGMSDeviceViewInput: UIViewController {
}

protocol EGMSDeviceViewOutput: AnyObject {
}

protocol EGMSDeviceViewModelInput: AnyObject {
    func didSelect(terminalWithId terminalId: UUID)
    func toggleScan()
}

protocol EGMSDeviceViewModelOutput: AnyObject {
    func show(connected: Bool)
    func show(connecting: Bool)
    func show(error: Error)
    func show(scanning: Bool)
    func show(terminalViewModels: [EGMSTerminalViewModel])
}
