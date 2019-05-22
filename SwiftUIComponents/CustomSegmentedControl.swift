//
//  CustomSegmentedControl.swift
//  Example
//
//  Created by Susan Kim on 09/05/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

@IBDesignable
class CustomSegmentedControl: UIControl {

    var buttons = [UIButton]()
    var selectedIndex: Int = 0
    
    @IBInspectable
    var title: String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var titleColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var titleFont: UIFont = .systemFont(ofSize: 12) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textFont: UIFont = .systemFont(ofSize: 14) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var buttonBackgroundColor: UIColor = .white {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectedBorderColor: UIColor = .zeyoBlue {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectedTextColor: UIColor = .zeyoBlue {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var commaSeparatedButtonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        
        buttons.removeAll()
        subviews.forEach({ $0.removeFromSuperview() })
        
        let buttonTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        buttonTitles.forEach { (buttonTitle) in
            let button = UIButton()
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.titleLabel?.font = textFont
            button.backgroundColor = buttonBackgroundColor
            button.layer.borderColor = borderColor.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 5
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            buttons.append(button)
        }
        
        buttons[0].layer.borderColor = selectedBorderColor.cgColor
        buttons[0].setTitleColor(selectedTextColor, for: .normal)
        
        let buttonsStackView = UIStackView(arrangedSubviews: buttons)
        buttonsStackView.axis = .horizontal
        buttonsStackView.alignment = .fill
        buttonsStackView.distribution = .fillEqually
        buttonsStackView.spacing = 5
        
        let largestStackView = UIStackView()
        largestStackView.axis = .vertical
        largestStackView.spacing = 16
        largestStackView.alignment = .fill
        largestStackView.distribution = .fillProportionally
        
        if title != "" {
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.textAlignment = .left
            titleLabel.textColor = titleColor
            titleLabel.font = titleFont
            titleLabel.sizeToFit()
            
            largestStackView.addArrangedSubview(titleLabel)
        }
        largestStackView.addArrangedSubview(buttonsStackView)
        
        addSubview(largestStackView)
        largestStackView.translatesAutoresizingMaskIntoConstraints = false
        largestStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        largestStackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        largestStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        largestStackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    @objc func buttonTapped(button: UIButton) {
        for (buttonIndex, b) in buttons.enumerated() {
            
            selectedIndex = buttonIndex
            
            if b == button {
                b.setTitleColor(selectedTextColor, for: .normal)
                b.layer.borderColor = selectedBorderColor.cgColor
            } else {
                b.setTitleColor(textColor, for: .normal)
                b.layer.borderColor = borderColor.cgColor
            }
        }
        
        sendActions(for: .valueChanged)
    }
}
