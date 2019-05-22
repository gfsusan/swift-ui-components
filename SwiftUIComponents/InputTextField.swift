//
//  InputTextField.swift
//  Zeyo
//
//  Created by Susan Kim on 03/05/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

@IBDesignable
class InputTextField: UITextField {
    
    var title: String = "제목" {
        didSet {
            titleLabel.text = title
            titleLabel.sizeToFit()
        }
    }
    
    var leftIconImage: UIImage = #imageLiteral(resourceName: "username_icon") {
        didSet {
            leftView = UIImageView(image: leftIconImage)
        }
    }
    
    var rightIconImage: UIImage = #imageLiteral(resourceName: "icDropdownArrowCopy") {
        didSet {
            rightView = UIImageView(image: rightIconImage)
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .textFieldTitle
        label.text = title
        label.sizeToFit()
        return label
    }()
    
    let bottomLine: CALayer = CALayer()
    
    // MARK:- Init
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        
        // setup input text color
        textColor = .textDefault
        
        // setup view modes
        leftView?.contentMode = .center
        leftViewMode = .always
        
        rightView?.contentMode = .center
        rightViewMode = .always
        
        
        contentVerticalAlignment = .bottom
        
        // add underline
        layer.addSublayer(bottomLine)
        
        // add title label
        self.addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- Overrides
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // set frame
        bottomLine.frame = CGRect(x: 0.0, y: frame.height - 1, width: frame.width, height: 1)
        
        if isFirstResponder {
            bottomLine.backgroundColor = UIColor.textDefault.cgColor
        } else {
            bottomLine.backgroundColor = UIColor.textFieldUnderline.cgColor
        }
    }
    
    override func textRect(forBounds bounds:CGRect) -> CGRect {
        var r = super.textRect(forBounds: bounds)
        
        let top = ceil(titleLabel.font.lineHeight)
        r = r.inset(by: UIEdgeInsets(top: top, left: 10, bottom: 10, right: 8))
        
        return r.integral
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        var r = super.textRect(forBounds: bounds)
        
        let top = ceil(titleLabel.font.lineHeight)
        r = r.inset(by: UIEdgeInsets(top: top, left: 10, bottom: 10, right: 8))
        
        return r.integral
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var r = super.leftViewRect(forBounds: bounds)
        
        let top = ceil(titleLabel.font.lineHeight)
        let half = (frame.height - top) / 2
        r = CGRect(x: r.origin.x, y: r.origin.y, width: 16, height: 18)
        r = r.applying(CGAffineTransform(translationX: 8, y: half - 13))

        return r.integral
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var r = super.rightViewRect(forBounds: bounds)
        
        let top = ceil(titleLabel.font.lineHeight)
        let half = (frame.height - top) / 2
        r = CGRect(x: r.origin.x, y: r.origin.y, width: 7, height: 4)
        r = r.applying(CGAffineTransform(translationX: -8, y: half - 13))

        return r.integral
    }

}
