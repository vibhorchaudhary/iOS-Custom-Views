//
//  ToastViewController.swift
//
//  Created by Vibhor Chaudhary on 20/04/20.
//  Copyright © 2020 Vibhor Chaudhary. All rights reserved.
//

import UIKit

class ToastView {
    
    var toastMessage:String = ""
    var uiWindow:UIWindow?
    
    func initialiseView(window:UIWindow) {
        self.uiWindow = window
    }
    
    func showToastMessage(message:String) {
        self.toastMessage = message
        
        guard let window = uiWindow else {
            return
        }
        
        
        let toastlabel = PaddingLabel()
        toastlabel.text = toastMessage
        toastlabel.textAlignment = NSTextAlignment.center
        toastlabel.font = UIFont.systemFont(ofSize: 16)
        toastlabel.textColor = .white
        toastlabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastlabel.numberOfLines = 0
        toastlabel.layer.cornerRadius = 10
        toastlabel.layer.masksToBounds = true
        
        let textSize = toastlabel.intrinsicContentSize
        let labelwidth = min(textSize.width, window.frame.width - 40)
        
        let textHeight = (textSize.width / window.frame.width) * 30
        let adjustedHeight = max(textHeight, textSize.height + 20)
        
        toastlabel.frame = CGRect(x: 20, y: (window.frame.height - 90) - adjustedHeight, width: labelwidth, height: adjustedHeight)
        toastlabel.center.x = window.center.x
        toastlabel.lineBreakMode = .byWordWrapping
        
        window.addSubview(toastlabel)
        
        UIView.animate(withDuration: 4, animations: {
            toastlabel.alpha = 0
        }) { (_) in
            toastlabel.removeFromSuperview()
        }
        
    }
}

class PaddingLabel: UILabel {
    
    var topInset: CGFloat = 10.0
    var bottomInset: CGFloat = 10.0
    var leftInset: CGFloat = 10.0
    var rightInset: CGFloat = 10.0
    
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        get {
            var contentSize = super.intrinsicContentSize
            contentSize.height += topInset + bottomInset
            contentSize.width += leftInset + rightInset
            return contentSize
        }
    }
}
