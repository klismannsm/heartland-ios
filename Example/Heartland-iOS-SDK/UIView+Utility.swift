//
//  UIView+Utility.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 9/8/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import UIKit

extension UIView {
    func pin(to view: UIView) {
        NSLayoutConstraint.activate([
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
}
