//
//  Bundle+ITExtensions.swift
//  IssaTool
//
//  Created by Isaac on 2018/7/17.
//  Copyright © 2018年 IsaacPan. All rights reserved.
//
public extension Bundle {
    
    /// returns version string
    var versionString: String {
        return "\(Bundle.main.infoDictionary?["CFBundleShortVersionString"] ?? "")"
        
    }
    
    /// returns build string
    var buildString: String {
        return "\(Bundle.main.infoDictionary?["CFBundleVersion"] ?? "")"
    }
}
