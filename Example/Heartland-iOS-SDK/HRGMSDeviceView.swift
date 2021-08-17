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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

@available(iOS 13.0, *)
struct HRGMSDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        HRGMSDeviceView(viewModel: HRGMSDeviceViewModel())
    }
}
