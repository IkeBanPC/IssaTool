//
//  UIView+ITExtensions.swift
//  IssaTool
//
//  Created by Isaac on 2018/7/17.
//  Copyright © 2018年 IsaacPan. All rights reserved.
//

import Foundation

public extension UIView {
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
}
