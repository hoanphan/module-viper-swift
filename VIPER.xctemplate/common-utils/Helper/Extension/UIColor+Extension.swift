//
//  UIColor+Extension.swift
//  BaseSwift
//
//  Created by nava on 7/13/18.
//  Copyright © 2018 nava. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

struct ColorHex {
    static let squash = "ea9321"
    static let pinkishRed = "ed2024"
    static let denimBlue = "3b5998"
    static let slateGrey = "4e485b"
    static let white = "ffffff"
    static let black = "333333"
    static let lightMauve = "d6b4cd"
    static let mutedPurple = "7c5985"
    static let veryLightPurple = "fcebf8"
    static let purpleyGrey = "9c8095"
    static let warmGrey = "888888"
}

struct FontText {
    static let Roman = "HelveticaLTStd-Roman"
    static let Light = "HelveticaLTStd-Light"
}
