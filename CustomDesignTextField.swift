//
//  CustomDesignTextField.swift
//
//  Created by Vibhor Chaudhary on 20/04/20.
//  Copyright © 2020 Vibhor Chaudhary. All rights reserved.
//

import UIKit

@IBDesignable class CustomDesignTextField: UITextField {
    
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
        // this is crucial when constraints are used in superviews
        updateGradient()
    }
    
    private func createGradient() -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        return gradient
    }
    
    private func installGradient() {
        // if there's already a gradient installed on the layer, remove it
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
            
            if(cornerRadius > 0.0){
                self.clipsToBounds = true
                self.layer.masksToBounds = true
            }
            
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
            gradient?.endPoint = CGPoint(x: 1, y: 0)
        }else{
            gradient?.endPoint = CGPoint(x: 0, y: 1)
        }
        
        gradient?.frame = self.bounds
        
        
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    
}
