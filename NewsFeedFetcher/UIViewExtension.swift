//
//  UIViewExtension.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyGradientShadowBackground(color: UIColor) {
        self.backgroundColor = color
        let gray = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0)
        let clear = UIColor(red: 1, green: 1, blue: 1, alpha: 0.5)
        
        if let sublayers = layer.sublayers {
            sublayers.forEach { layer in
                if layer is CAGradientLayer {
                    layer.removeFromSuperlayer()
                }
            }
        }
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [gray.cgColor, clear.cgColor, clear.cgColor, gray.cgColor]
        gradient.locations = [0.0 , 0.3, 0.7, 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = self.bounds
        gradient.opacity = 0.3
        self.layer.insertSublayer(gradient, at: 0)
    }
    
}
