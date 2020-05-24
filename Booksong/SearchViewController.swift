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
    @IBOutlet weak var resultTable: UITableView!
    @IBOutlet weak var placeholderView: UIView!
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
        searchSectionView.isHidden = false
        titleLabel.isHidden = false
        subLabel.isHidden = false
        
        searchSectionView.cornerRadius = 20.0
        
        titleLabel.text = "노래 검색"
        subLabel.text = "부르고 싶은 노래를 검색할 수 있습니다."
        
        resultTable.separatorInset = .zero
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
