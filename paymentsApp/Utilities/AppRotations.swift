//
//  AppRotations.swift
//  TheCreditApp
//
//  Created by Luccas Santana Marinho on 09/01/23.
//

import Foundation
import UIKit

func rotationDefault() {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
}
