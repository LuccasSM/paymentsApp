//
//  AppRotations.swift
//  TheCreditApp
//
//  Created by Luccas Santana Marinho on 09/01/23.
//

import UIKit

    // MARK: Setup lockOrientation

public func lockOrientation() {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
}

    // MARK: Setup rotationOrientation

public func rotationOrientation() {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.all, andRotateTo: UIInterfaceOrientation.unknown)
}
