//
//  RoundShadowView.swift
//  Booksong
//
//  Created by 김태인 on 2020/05/24.
//  Copyright © 2020 TaeinKim. All rights reserved.
//

import Foundation
import UIKit

public class RoundShadowView: UIView {
    let containerView = UIView()
    
    public var containerBackgroundColor: UIColor = .white {
        didSet {
            self.layoutView()
        }
    }
    
    public var cornerRadius: CGFloat = 6.0 {
        didSet {
            layoutView()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        layoutView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutView()
    }
    
    func layoutView() {
        
        // set the shadow of the view's layer
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = cornerRadius * 0.6
        
        
        containerView.backgroundColor = containerBackgroundColor
        containerView.layer.cornerRadius = cornerRadius
        containerView.layer.masksToBounds = true
        addSubview(containerView)
        
        // add constraints
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        // pin the containerView to the edges to the view
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
