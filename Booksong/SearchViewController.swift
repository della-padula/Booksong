//
//  SearchViewController.swift
//  Booksong
//
//  Created by 김태인 on 2020/05/24.
//  Copyright © 2020 TaeinKim. All rights reserved.
//

import Foundation
import UIKit

public class SearchViewController: BaseViewController {
    
    @IBOutlet weak var searchSectionView: RoundShadowView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setViewLayout()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    fileprivate func setViewLayout() {
        searchSectionView.cornerRadius = 6.0
    }
}
