//
//  AppDelegate.swift
//  AppListaContatos
//
//  Created by Squad Apps on 20/07/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupNavigationBar()
        return true
    }
    
    func setupNavigationBar() {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()

            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(named: "adaptGreenColor")

            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
        } else {
            let navigationBarAppearance = UINavigationBar.appearance()

            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20.0)
            ]
            navigationBarAppearance.tintColor = UIColor(named: "adaptGreenColor")
            navigationBarAppearance.barTintColor = UIColor(named: "adaptGreenColor")
            navigationBarAppearance.isTranslucent = false
            
            let barButtonAppearance = UIBarButtonItem.appearance()
            barButtonAppearance.setBackButtonTitlePositionAdjustment(UIOffset(horizontal: -1000.0, vertical: 0), for: .default)
            barButtonAppearance.tintColor = .white
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

