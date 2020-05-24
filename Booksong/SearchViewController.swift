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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setViewLayout()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    fileprivate func setViewLayout() {
        self.navigationController?.navigationBar.isHidden = true
        searchSectionView.cornerRadius = 6.0
        titleLabel.text = "노래 검색"
        subLabel.text = "부르고 싶은 노래를 검색할 수 있습니다."
    }
}
