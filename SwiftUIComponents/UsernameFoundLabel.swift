//
//  UsernameFoundLabel.swift
//  Zeyo
//
//  Created by Susan Kim on 13/05/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

class UsernameFoundLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        textAlignment = .center
        
        backgroundColor = .paleGrey
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.paleLilac.cgColor
        
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
