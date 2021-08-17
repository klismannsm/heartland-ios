//
//  HRGMSDeviceHostingController.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 8/17/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
class HRGMSDeviceHostingController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let viewModel = HRGMSDeviceViewModel()
        let view = HRGMSDeviceView(viewModel: viewModel)
        let wrapped = UIHostingController(rootView: view)
        let wrappedView = wrapped.view!
        wrappedView.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(wrapped)
        self.view.addSubview(wrapped.view)
        wrapped.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            wrappedView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            wrappedView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            wrappedView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            wrappedView.topAnchor.constraint(equalTo: self.view.topAnchor),
        ])
    }
}
