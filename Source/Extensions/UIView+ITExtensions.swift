//
//  UIView+ITExtensions.swift
//  IssaTool
//
//  Created by Isaac on 2018/7/17.
//  Copyright © 2018年 IsaacPan. All rights reserved.
//

import Foundation

public extension UIView {
    
    /// Create an image from current view
    ///
    /// - Returns: UIImage
    public func toImage() -> UIImage {
        var image = UIImage()
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        if let currentContext = UIGraphicsGetCurrentContext() {
            self.layer.render(in: currentContext)
            image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        }
        UIGraphicsEndImageContext()
        return image
    }
    
    
    /// set conditional corner radius in a safe way
    ///
    /// - Parameters:
    ///   - topLeft: top left has corner radius, default is true
    ///   - topRight: top right has corner radius, default is true
    ///   - bottomLeft: bottom left has corner radius, default is true
    ///   - bottomRight: bottom right has corner radius, default is true
    ///   - cornerRadius: corner radius to set
    public func setCornerRadius(topLeft: Bool = true, topRight: Bool = true, bottomLeft: Bool = true, bottomRight: Bool = true, cornerRadius: CGFloat) {
        var rawValue: UInt = 0
        if topLeft {
            rawValue = UIRectCorner.topLeft.rawValue
        }
        if topRight {
            rawValue = rawValue | UIRectCorner.topRight.rawValue
        }
        if bottomLeft {
            rawValue = rawValue | UIRectCorner.bottomLeft.rawValue
        }
        if bottomRight {
            rawValue = rawValue | UIRectCorner.bottomRight.rawValue
        }
        let rect = self.bounds
        let corner = UIRectCorner(rawValue: rawValue)
        let radio = CGSize(width: cornerRadius, height: cornerRadius)
        let path = UIBezierPath.init(roundedRect: rect, byRoundingCorners: corner, cornerRadii: radio)
        let mask = CAShapeLayer()
        mask.frame = self.bounds
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    /// define an easy way to animate show an view
    public func animateShow(duration: Double = 0.2, handle: @escaping Handle = {}) {
        if self.alpha == 0 {
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 1
            }) { _ in
                handle()
            }
        }
    }
    
    /// define an easy way to animate hide an view
    func animateHide(duration: Double = 0.2, handle: @escaping Handle = {}) {
        if self.alpha != 0 {
            UIView.animate(withDuration: duration, animations: {
                self.alpha = 0
            }) { _ in
                handle()
            }
        }
    }
}
