//
//  BaseButton.swift
//  Zeyo
//
//  Created by Susan Kim on 02/05/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

class BaseButton: UIButton {
    
    var fillType: ButtonFillType = .lightContent {
        didSet {
            updateButtonType()
        }
    }
    
    var letterSpacing = -0.5 {
        didSet {
            applyCharacterSpacing()
        }
    }
    
    override var tintColor: UIColor! {
        didSet {
            updateShadow()
            updateButtonType()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tintColor = .zeyoBlue
        
        titleLabel?.font = .systemFont(ofSize: 16)
        
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 5)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10 / 2.0

        
        widthAnchor.constraint(equalToConstant: 343).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func updateButtonType() {
        switch fillType {
            
        case .lightContent:
            backgroundColor = tintColor
            setTitleColor(.white, for: .normal)
            layer.borderWidth = 0
            updateShadow()
        case .darkContent:
            backgroundColor = tintColor
            setTitleColor(.textFieldTitle, for: .normal)
            layer.borderWidth = 0
            updateShadow()
        case .empty:
            backgroundColor = .white
            setTitleColor(tintColor, for: .normal)
            layer.borderWidth = 1
            layer.borderColor = tintColor.cgColor
            layer.shadowColor = UIColor.clear.cgColor
        }
    }
    
    func updateShadow() {
        if tintColor == .zeyoBlue {
            let shadowColor = UIColor(red: 16/255, green: 72/255, blue: 255/255, alpha: 1.0)
            layer.shadowColor = shadowColor.cgColor
        } else {
            let shadowColor = UIColor(red: 195/255, green: 195/255, blue: 195/255, alpha: 1.0)
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        
        applyCharacterSpacing()
    }
    
    func applyCharacterSpacing() {
        if let labelText = titleLabel?.text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSRange(location: 0, length: attributedString.length - 1))
            titleLabel?.attributedText = attributedString
        }
    }
    
}

enum ButtonFillType: Int {
    case lightContent
    case darkContent
    case empty
}
