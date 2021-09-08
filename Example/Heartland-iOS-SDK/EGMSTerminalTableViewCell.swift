//
//  EGMSTerminalTableViewCell.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 9/8/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import UIKit

class EGMSTerminalTableViewCell: UITableViewCell {
    func configureCell(with viewModel: EGMSTerminalViewModel) {
        contentView.backgroundColor = .egmsDarkGreen
        detailTextLabel?.text = viewModel.terminalTypeName
        detailTextLabel?.textColor = .egmsOrange
        textLabel?.text = viewModel.title
        textLabel?.textColor = .egmsLightGreen
    }
}
