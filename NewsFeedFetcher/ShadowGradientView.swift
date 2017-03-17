//
//  ShadowGradientView.swift
//  NewsFeedFetcher
//
//  Created by Chavalit Vanasapdamrong on 3/17/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class ShadowGradientView: UIView {
    
    override func draw(_ rect: CGRect) {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let context = UIGraphicsGetCurrentContext()
        
        let gradientColors = [UIColor.clear.cgColor, UIColor.black.cgColor] as CFArray
        let gradientLocations: [CGFloat] = [0.0, 1.0]
        
        let gradient = CGGradient(colorsSpace: colorSpace, colors: gradientColors, locations: gradientLocations)
        
        let startPoint = CGPoint(x: rect.midX, y: rect.minY)
        let endPoint = CGPoint(x: rect.midX, y: rect.maxY)
        
        if let drawContext = context, let drawGradient = gradient {
            drawContext.drawLinearGradient(drawGradient, start: startPoint, end: endPoint, options: .drawsBeforeStartLocation)
        }
        
    }
    
}
