//
//  EGMSHomeContract.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import Heartland_iOS_SDK
import UIKit

protocol EGMSHomeCoordinatorInput: EGMSDeviceCoordinatorOutput, EGMSTransactionCoordinatorOutput {
    func startEGMSHome()
}

protocol EGMSHomeCoordinatorOutput: AnyObject {
}

protocol EGMSHomeModelInput: AnyObject {
}

protocol EGMSHomeModelOutput: AnyObject {
}

protocol EGMSHomeViewInput: UIViewController {
    func add(deviceView: EGMSDeviceViewInput)
    func add(transactionView: EGMSTransactionViewInput)
}

protocol EGMSHomeViewOutput: AnyObject {
}

protocol EGMSHomeViewModelInput: AnyObject {
}

protocol EGMSHomeViewModelOutput: AnyObject {
}
