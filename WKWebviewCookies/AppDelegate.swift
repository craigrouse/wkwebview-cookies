//
//  AppDelegate.swift
//  WKWebviewCookies
//
//  Created by Christina S on 11/11/20.
//

import UIKit
import WebKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         TealiumHelper.shared.start()
        return true
    }

}

