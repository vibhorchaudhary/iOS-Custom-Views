//
//  CustomLoader.swift
//  Splash
//
//  Created by Vibhor Chaudhary on 20/04/20.
//  Copyright © 2020 Vibhor Chaudhary. All rights reserved.
//

import UIKit

class CustomLoader: UIView {
    
    static let instance = CustomLoader()
    
    lazy var transparentView: UIView = {
        let transparentView = UIView(frame: UIScreen.main.bounds)
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        transparentView.isUserInteractionEnabled = false
        return transparentView
    }()
    
    lazy var gifLoader: UIImageView = {
        let gifLoader = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        gifLoader.contentMode = .scaleAspectFit
        gifLoader.center = transparentView.center
        gifLoader.isUserInteractionEnabled = false
        gifLoader.image = UIImage(named: "")
        return gifLoader
    }()
    
    
    func showLoader(uiWindow:UIWindow) {
        self.addSubview(transparentView)
        self.transparentView.addSubview(gifLoader)
        self.transparentView.bringSubviewToFront(gifLoader)
        uiWindow.addSubview(transparentView)
    }
    
    
    func hideLoader() {
        self.transparentView.removeFromSuperview()
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
