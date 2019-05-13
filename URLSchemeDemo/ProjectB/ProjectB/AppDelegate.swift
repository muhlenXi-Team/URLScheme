//
//  AppDelegate.swift
//  ProjectB
//
//  Created by muhlenXi on 2019/5/13.
//  Copyright © 2019 muhlenXi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var fromScheme: String?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let dict = MXURLSchemeUtil.convetURLScheme2Dictionary(schemeURL: url)
        print(dict)
        
        if let bundleId = options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, let fromScheme = bundleId.components(separatedBy: ".").last {
            self.fromScheme = fromScheme
        }
        return true
    }
}

extension AppDelegate {
    func backProjectA() {
        if let fromScheme = self.fromScheme {
            let entity = MXURLSchemeEntity(scheme: fromScheme, action: nil, parameters: nil)
            MXURLSchemeUtil.OpenApp(urlScheme: entity)
        }
    }
}

func delay(seconds: TimeInterval, handler:@escaping () -> Void) {
    DispatchQueue.global().asyncAfter(deadline: DispatchTime.now()+seconds) {
        DispatchQueue.main.async {
            handler()
        }
    }
}

