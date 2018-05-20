//
//  AppDelegate.swift
//  YoutubeMenuBar
//
//  Created by Manikanta Varma on 5/20/18.
//  Copyright © 2018 Manikanta Varma. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = UINavigationController(rootViewController: ViewController(collectionViewLayout: layout))
        
        application.statusBarStyle = .lightContent
        UINavigationBar.appearance().barTintColor = UIColor(red: 69/255, green: 81/255, blue: 99/255, alpha: 1)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(),for: .default)
        
        let navigationBarView = UIView()
        navigationBarView.translatesAutoresizingMaskIntoConstraints = false
        navigationBarView.backgroundColor = UIColor(red: 49/255, green: 58/255, blue: 71/255, alpha: 1)
        
        window?.addSubview(navigationBarView)
        
        window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":navigationBarView]))
        
        window?.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0(20)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":navigationBarView]))
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

