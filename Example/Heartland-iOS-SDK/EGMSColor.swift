//
//  EGMSColor.swift
//  Heartland-iOS-SDK_Example
//
//  Created by Desimini, Wilson on 9/8/21.
//  Copyright © 2021 Shaunti Fondrisi. All rights reserved.
//

import UIKit

extension UIColor {
    static var egmsBlue: UIColor {
        color(from: "#37485a")
    }
    
    static var egmsDarkGreen: UIColor {
        color(from: "#5c7267")
    }
    
    static var egmsDarkPurple: UIColor {
        color(from: "#2e2f39")
    }
    
    static var egmsGreen: UIColor {
        color(from: "#8cbe80")
    }
    
    static var egmsLightGreen: UIColor {
        color(from: "#d0d890")
    }
    
    static var egmsOrange: UIColor {
        color(from: "#e0aa38")
    }
    
    private static func color(from hex: String) -> UIColor {
        var cString: String = hex
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        guard cString.count == 6 else {
            return .gray
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
