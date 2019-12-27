//
//  RoundButton.swift
//  button-ibdesignable
//
//  Created by miguel tomairo on 12/26/19.
//  Copyright © 2019 rapser. All rights reserved.
//

import UIKit

@IBDesignable class RoundButton: UIButton {
    
        
    //MARK: - Programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sharedInit()
    }
    
    //MARK: - Storyboard
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    // MARK: - Rendering
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit(){
        refreshCorners(value: cornerRadius)
        refreshColors(color: customBGColor)
//        refreshColor(color: backgroundImageColor)
        
        refreshBorderColor(_colorBorder: customBorderColor)
        refreshBorder(_borderWidth: borderWidth)
        self.tintColor = UIColor.white
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func refreshColors(color: UIColor){
        layer.backgroundColor = color.cgColor
    }
    
    @IBInspectable var customBGColor: UIColor = .systemBlue {
        didSet {
            refreshColors(color: customBGColor)
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
//    @IBInspectable var backgroundImageColor: UIColor = UIColor.init(red: 0, green: 122/255.0, blue: 255/255.0, alpha: 1) {
//        didSet {
//            refreshColor(color: customBGColor)
//        }
//    }
    
    func createImage(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), true, 0.0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }
    
    func refreshColor(color: UIColor) {
        let image = createImage(color: color)
        setBackgroundImage(image, for: .normal)
        clipsToBounds = true
    }
    
    @IBInspectable var borderWidth: CGFloat = 2 {
        didSet {
            refreshBorder(_borderWidth: borderWidth)
        }
    }

    func refreshBorder(_borderWidth: CGFloat) {
        layer.borderWidth = _borderWidth
    }

    @IBInspectable var customBorderColor: UIColor = UIColor.init (red: 0, green: 122/255, blue: 255/255, alpha: 1){
        didSet {
            refreshBorderColor(_colorBorder: customBorderColor)
        }
    }

    func refreshBorderColor(_colorBorder: UIColor) {
        layer.borderColor = _colorBorder.cgColor
    }
}

