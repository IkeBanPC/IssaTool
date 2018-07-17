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
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+time) {
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

