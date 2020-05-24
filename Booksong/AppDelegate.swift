//
//  AppDelegate.swift
//  Booksong
//
//  Created by 김태인 on 2020/05/24.
//  Copyright © 2020 TaeinKim. All rights reserved.
//

import UIKit
import CoreData
import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GADInterstitialDelegate {

    var window: UIWindow?
    var interstitial: GADInterstitial?
    var launchScreenView: UIView?
    
    private var adUnitID: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/4411468910"
        #else
        return "ca-app-pub-8965771939775493/5086111158"
        #endif
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
//        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers = ["9df38a15046bac616e9e4e02cf21833a"]
        
        if let view = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController()?.view {
            launchScreenView = view
            view.translatesAutoresizingMaskIntoConstraints = false
            if let rootView = window?.rootViewController?.view {
                rootView.addSubview(view)
                var constraints = [NSLayoutConstraint]()
                constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[view]-0-|", options: [], metrics: nil, views: ["view": view])
                constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[view]-0-|", options: [], metrics: nil, views: ["view": view])
                rootView.addConstraints(constraints)
            }
        }
        
        interstitial = GADInterstitial(adUnitID: adUnitID)
        interstitial?.delegate = self
        
        let request = GADRequest()
        interstitial?.load(request)

        return true
    }
    
    func interstitialDidReceiveAd(_ ad: GADInterstitial) {
        guard let viewController = window?.rootViewController else { return }
        ad.present(fromRootViewController: viewController)
    }
    
    func interstitialWillDismissScreen(_ ad: GADInterstitial) {
        launchScreenView?.removeFromSuperview()
    }

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "Booksong")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

