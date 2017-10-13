//
//  HeaderView.swift
//  devslopes-chat
//
//  Created by Jean-François Droux on 03.10.17.
//  Copyright © 2017 Droux. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    override func awakeFromNib() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 2
        
    }
}
