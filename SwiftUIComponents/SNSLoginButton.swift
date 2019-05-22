//
//  SNSLoginButton.swift
//  Zeyo
//
//  Created by Susan Kim on 02/05/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

class SNSLoginButton: BaseButton {
    
    var logoImage: UIImage? {
        didSet {
            logoImageView.image = logoImage
        }
    }
    
    var companyName: String = "SNS" {
        didSet {
            textLabel.text = "\(companyName)로 시작하기"
        }
    }
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .center
        return iv
    }()
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "SNS로 시작하기"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        addSubview(logoImageView)
        addSubview(textLabel)
        
        logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        logoImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        textLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 16).isActive = true
        textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
