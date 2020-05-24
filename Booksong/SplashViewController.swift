//
//  ViewController.swift
//  Booksong
//
//  Created by 김태인 on 2020/05/24.
//  Copyright © 2020 TaeinKim. All rights reserved.
//

import UIKit
import GoogleMobileAds

public class SplashViewController: BaseViewController {
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let navigationVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "navVC") as! UINavigationController)
            
            appDelegate.window?.rootViewController = navigationVC
        })
    }
    
}
