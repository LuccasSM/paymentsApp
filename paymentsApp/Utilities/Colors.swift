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
}
