//
//  MainMenuButton.swift
//  Zeyo
//
//  Created by Susan Kim on 10/05/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

@IBDesignable
class MainMenuButton: UIButton {
    
    @IBInspectable
    var highlightColor: UIColor = UIColor.red {
        didSet {
            updateView()
        }
    }
    
    override var tintColor: UIColor! {
        didSet {
            updateView()
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                imageView?.layer.borderColor = highlightColor.cgColor
                imageView?.tintColor =  highlightColor
            } else {
                imageView?.layer.borderColor = tintColor.cgColor
                imageView?.tintColor =  tintColor
            }
        }
    }
    
    override func setImage(_ image: UIImage?, for state: UIControl.State) {
        super.setImage(image, for: .normal)
        updateView()
    }
    
    func updateView() {
        imageView?.contentMode = .center
        titleLabel?.textAlignment = .center
        setTitleColor(tintColor, for: .normal)
        setTitleColor(highlightColor, for: .highlighted)
        adjustsImageWhenHighlighted = false
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let r = imageRect(forContentRect: rect)
        imageView?.layer.cornerRadius = r.width / 2
        
        imageView?.layer.borderWidth = 1.5
        imageView?.layer.borderColor = tintColor.cgColor
    }
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {

        let width = contentRect.width
        let height = contentRect.height * (4.0 / 6.0)
        
        let smaller: CGFloat = width < height ? width : height
        
        let rect = CGRect(origin: .init(x: (width - smaller) / 2, y: (height - smaller) / 2), size: .init(width: smaller, height: smaller))
        
        return rect
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        
        let height = contentRect.height * (1.0 / 6.0)
        
        let rect = CGRect(x: 0, y: contentRect.height - height, width: contentRect.width, height: height)
        
        return rect
    }
}
