//
//  MainViewController.swift
//  Booksong
//
//  Created by 김태인 on 2020/05/24.
//  Copyright © 2020 TaeinKim. All rights reserved.
//

import Foundation
import UIKit
import GoogleMobileAds

public class HomeViewController: BaseViewController {
    private var adUnitID: String {
        #if DEBUG
        return "ca-app-pub-3940256099942544/4411468910"
        #else
        return "ca-app-pub-8965771939775493/5086111158"
        #endif
    }
    
    var interstitial: GADInterstitial!
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        prepareGoogleAd()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            self.requestFullAdView()
        })
    }
    
    fileprivate func prepareGoogleAd() {
        interstitial = GADInterstitial(adUnitID: adUnitID)
        
        let request = GADRequest()
        interstitial.load(request)
    }
    
    fileprivate func requestFullAdView() {
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
    }
}

extension HomeViewController: GADInterstitialDelegate {
    public func createAndLoadInterstitial() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: adUnitID)
        interstitial.delegate = self
        interstitial.load(GADRequest())
        return interstitial
    }
    
    public func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        interstitial = createAndLoadInterstitial()
    }
}

