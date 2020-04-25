//
//  CustomDesignButton.swift
//
//  Created by Vibhor Chaudhary on 20/04/20.
//  Copyright © 2020 Vibhor Chaudhary. All rights reserved.
//

import UIKit

@IBDesignable class CustomDesignButton: UIButton {
    
    private var gradient: CAGradientLayer?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        installGradient()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        installGradient()
    }
    
    override var frame: CGRect {
        didSet {
            updateGradient()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradient()
    }
    
    
    
    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        return gradient
    }
    
    private func installGradient() {
        if let gradient = self.gradient {
            gradient.removeFromSuperlayer()
        }
        let gradient = createGradient()
        self.layer.addSublayer(gradient)
        self.gradient = gradient
    }
    
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var clipBounds: Bool = false {
        didSet {
            self.clipsToBounds = clipBounds
            
        }
    }
    
    @IBInspectable var maskBounds: Bool = false {
        didSet {
            self.layer.masksToBounds = maskBounds
            
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear{
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize() {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var startColor: UIColor = UIColor.clear {
        didSet {
            updateGradient()
        }
    }
    @IBInspectable var endColor: UIColor = UIColor.clear {
        didSet {
            updateGradient()
        }
    }
    
    @IBInspectable var isHorizontal: Bool = true {
        didSet {
            updateGradient()
        }
    }
    
    private func updateGradient(){
        
        let colors:Array = [startColor.cgColor, endColor.cgColor]
        gradient?.colors = colors
        
        if (isHorizontal){
            gradient?.endPoint = CGPoint(x: 0.1, y: 0)
        }else{
            gradient?.endPoint = CGPoint(x: 0.1, y: 0)
        }
        
        gradient?.frame = self.bounds
        
        if let imageView = self.imageView {
            self.bringSubviewToFront(imageView)
        }
        
    }
    
}
