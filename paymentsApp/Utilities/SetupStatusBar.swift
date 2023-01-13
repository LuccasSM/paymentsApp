//
//  SetupStatusBar.swift
//  TheCreditApp
//
//  Created by Luccas Santana Marinho on 09/01/23.
//

import UIKit

public func setupStatusBarHidden() {
    UIApplication.shared.isStatusBarHidden = true
}

public func setupStatusBarVisible() {
    UIApplication.shared.isStatusBarHidden = false
}

public func setupStatusBarLight() {
    UIApplication.shared.statusBarStyle = .lightContent
}

public func setupStatusBarDark() {
    UIApplication.shared.statusBarStyle = .darkContent
}
