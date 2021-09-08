//
//  EGMSDeviceContract.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

protocol EGMSDeviceCoordinatorInput: AnyObject {
    func startEGMSDevice()
}

protocol EGMSDeviceCoordinatorOutput: AnyObject {
    func show(deviceView: EGMSDeviceViewInput)
}

protocol EGMSDeviceModelInput: AnyObject {
}

protocol EGMSDeviceModelOutput: AnyObject {
}

protocol EGMSDeviceViewInput: UIViewController {
}

protocol EGMSDeviceViewOutput: AnyObject {
}

protocol EGMSDeviceViewModelInput: AnyObject {
}

protocol EGMSDeviceViewModelOutput: AnyObject {
}
