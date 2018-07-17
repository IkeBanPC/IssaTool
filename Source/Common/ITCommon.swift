//
//  Common.swift
//  IssaTool
//
//  Created by Isaac on 2018/7/17.
//  Copyright © 2018年 IsaacPan. All rights reserved.
//

import Foundation

/// define a common handle of blocks.
public typealias Handle = () -> ()

/// define a common bool handle of blocks.
public typealias BoolHandle = (Bool) -> ()

/// define a common string handle of blocks.
public typealias StringHandle = (String) -> ()

/// current device screen width
public let kScreenWidth = UIScreen.main.bounds.width

/// current device screen height.
public let kScreenHeight = UIScreen.main.bounds.height


/// Define Device Screen Types
///
/// - iPhone3_5: iPhone such as iPhone 4s
/// - iPhone4_0: iPhone such as iPhone SE
/// - iPhone4_7: iPhone such as iPhone8
/// - iPhone5_5_1: iPhone such as iPhone8 Plus
/// - iPhone5_5_2: iPhone such as iPhone8 Plus on Simulator
/// - iPhone5_8: iPhone such as iPhone X
/// - iPad1024_768: iPad such as iPad2
/// - iPad2048_1536: iPad such as iPad Air
/// - iPad2224_1668: iPad such as iPad Pro(10.5)
/// - iPad2732_2048: iPad such as iPad Pro(12.9)
/// - iOS_unknown: unknown iOS device
public enum DeviceScreenType: CGFloat {
    case iPhone3_5 = 1600.0
    case iPhone4_0 = 1776.0
    case iPhone4_7 = 2084.0
    case iPhone5_5_1 = 3000.0
    case iPhone5_5_2 = 3450.0
    case iPhone5_8 = 3561.0
    case iPad1024_768 = 1792.0
    case iPad2048_1536 = 3584.0
    case iPad2224_1668 = 3892.0
    case iPad2732_2048 = 4780.0
    case iOS_unknown = 0
}

/// current device screen type
public var kScreenType: DeviceScreenType {
    let width = UIScreen.main.nativeBounds.width
    let height = UIScreen.main.nativeBounds.height
    return DeviceScreenType(rawValue: width+height) ?? .iOS_unknown
}

/// define a common function to perform actions on main thread.
///
/// - Parameter handle: acitons to perform.
public func performOnMain(handle:@escaping Handle) {
    DispatchQueue.main.async {
        handle()
    }
}

/// define a common function to perform actions after certain times.
///
/// - Parameters:
///   - time: time to delay
///   - handle: acitons to perform.
public func performAfter(time:TimeInterval,handle:@escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now()+time) {
        handle()
    }
}

/// define a common function to perform actions on global thread.
///
/// - Parameter handle: actions to perform.
public func performOnGlobal(handle:@escaping Handle) {
    DispatchQueue.global().async {
        handle()
    }
}

/// define a common function to perform actions on background thread.
///
/// - Parameter handle: actions to perform.
public func performOnBackground(handle:@escaping Handle) {
    DispatchQueue.global(qos: .background).async {
        handle()
    }
}

/// define a common function to get localized strings.
///
/// - Parameter key: string key
/// - Returns: localized string
public func localized(key: String) -> String {
    return NSLocalizedString(key, comment: "")
}

