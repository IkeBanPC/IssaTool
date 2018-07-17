//
//  ITFontAndColor.swift
//  IssaTool
//
//  Created by Isaac on 2018/7/17.
//  Copyright © 2018年 IsaacPan. All rights reserved.
//

import Foundation

/// Define an easy way to create an UIFont instance of default.
///
/// - Parameter size: font size
/// - Returns: returns an UIFont type.
public func ITFont(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size)
}


/// Define an easy way to create an UIFont instance of bold.
///
/// - Parameter size: font size
/// - Returns: returns an UIFont type.
public func ITBoldFont(_ size:CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: size)
}

/// Define an easy way to create an UIColor instance.
///
/// - Parameter rgb: rgb value
/// - Returns: returns an UIColor type.
public func ITColor(_ rgb:UInt) -> UIColor {
    return ITColor(rgb, 1)
}


/// Define an easy way to create an UIColor instance of alpha info.
///
/// - Parameters:
///   - rgb: rgb value
///   - alpha: alpha value
/// - Returns: returns an UIColor type.
public func ITColor(_ rgb:UInt, _ alpha: CGFloat) -> UIColor {
    return UIColor(red: CGFloat((rgb&0xff0000)>>16)/255.0, green: CGFloat((rgb&0xff00)>>8)/255.0, blue: CGFloat(rgb&0xff)/255.0, alpha: alpha)
}
