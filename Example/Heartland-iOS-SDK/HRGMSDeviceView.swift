//
//  HRGMSDeviceView.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 8/17/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct HRGMSDeviceView: View {
    @ObservedObject var viewModel: HRGMSDeviceViewModel
    
    var body: some View {
        VStack {
            Button(viewModel.scanButtonTitle) {
                viewModel.toggleDeviceScan()
            }
            List(viewModel.gmsTerminalViewModels, id: \.id) {
                HRGMSTerminalListItemView(viewModel: $0)
            }
        }
        .padding()
    }
}

@available(iOS 13.0, *)
struct HRGMSDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        HRGMSDeviceView(viewModel: HRGMSDeviceViewModel())
    }
}
