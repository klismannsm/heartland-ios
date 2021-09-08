//
//  EGMSTransactionContract.swift
//  Heartland-iOS-SDK
//
//  Created by Desimini, Wilson on 9/8/21.
//

import UIKit

protocol EGMSTransactionCoordinatorInput: AnyObject {
    func startEGMSTransaction()
}

protocol EGMSTransactionCoordinatorOutput: AnyObject {
    func show(transactionView: EGMSTransactionViewInput)
}

protocol EGMSTransactionModelInput: AnyObject {
}

protocol EGMSTransactionModelOutput: AnyObject {
}

protocol EGMSTransactionViewInput: UIViewController {
}

protocol EGMSTransactionViewOutput: AnyObject {
}

protocol EGMSTransactionViewModelInput: AnyObject {
}

protocol EGMSTransactionViewModelOutput: AnyObject {
}
