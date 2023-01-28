//
//  Colors.swift
//  TheCreditApp
//
//  Created by Luccas Santana Marinho on 09/01/23.
//

import UIKit

struct Colors {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    // MARK: Setup App Colors

    static let colorDefault = Colors.rgb(red: 105, green: 175, blue: 168)
    static let grayLight = Colors.rgb(red: 242, green: 237, blue: 234)
    static let opacity = UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)
    static let graySmallButton = Colors.rgb(red: 109, green: 109, blue: 109)
}
