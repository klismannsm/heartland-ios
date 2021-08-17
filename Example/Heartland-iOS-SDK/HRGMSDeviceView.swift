//
//  HRGMSDeviceView.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 8/17/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct HRGMSDeviceView: View {
    @State private var isShowingError = false
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
        .alert(isPresented: $isShowingError) {
            Alert(
                title: Text("Error"),
                message: Text(viewModel.gmsDeviceError!.localizedDescription),
                dismissButton: .default(Text("Dismiss")) {
                    isShowingError = false
                    viewModel.resetScanState()
                }
            )
        }
        .onChange(of: viewModel.gmsDeviceError, perform: { value in
            if viewModel.gmsDeviceError != nil {
                isShowingError = true
            }
        })
    }
}

@available(iOS 14.0, *)
struct HRGMSDeviceView_Previews: PreviewProvider {
    static var previews: some View {
        HRGMSDeviceView(viewModel: HRGMSDeviceViewModel())
    }
}
