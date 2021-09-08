//
//  UIViewController+Utility.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 9/8/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else {
            return
        }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
