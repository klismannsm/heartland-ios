//
//  HRGMSTerminalListItemView.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 8/17/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
struct HRGMSTerminalListItemView: View {
    let viewModel: HRGMSTerminalViewModel
    
    var body: some View {
        HStack {
            Text(viewModel.name)
            Text("-")
            Text(viewModel.connected ? "Connected" : "Disconnected")
                .foregroundColor(viewModel.connected ? .green : .gray)
            Spacer()
        }
        .padding()
    }
}

@available(iOS 13.0, *)
struct HRGMSTerminalListItemView_Previews: PreviewProvider {
    static var previews: some View {
        HRGMSTerminalListItemView(viewModel: .sample)
            .previewLayout(
                .fixed(width: 300, height: 52)
            )
    }
}
