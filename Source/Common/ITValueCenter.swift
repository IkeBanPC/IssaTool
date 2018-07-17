//
//  ITValueCenter.swift
//  IssaTool
//
//  Created by Isaac on 2018/7/17.
//  Copyright © 2018年 IsaacPan. All rights reserved.
//

import Foundation

/// A center to store values and datas.
public class ITValueCenter {
    static let shared = ITValueCenter()
    private let defaults = UserDefaults.standard
    private var values: [String:Any]
    private init() {
        values = [String:Any]()
    }
}


// MARK: - Public functions
extension ITValueCenter {
    /// define a common function to store value.
    ///
    /// - Parameters:
    ///   - value: value to store.
    ///   - forkey: value key.
    ///   - disk: should on disk.
    public func store(value:Any,for key:String ,disk:Bool = false) {
        values[key] = value
        if disk {
            defaults.set(value, forKey: key)
            defaults.synchronize()
        }
    }
    
    /// define a common function to get stored value.
    ///
    /// - Parameter forkey: value key.
    /// - Returns: the stored value.
    public func value(for key:String) -> Any?{
        if (values[key] != nil) {
            return values[key]
        } else {
            return defaults.value(forKey:key)
        }
    }
    
    
    /// define a common function to get stored bool value.
    ///
    /// - Parameter forkey: value key
    /// - Returns: the stored bool value.
    public func bool(for key:String) -> Bool {
        if let dicValue = values[key] as? Bool{
            return dicValue
        }
        return defaults.bool(forKey:key)
    }

    
    /// define a common function to get stored string value.
    ///
    /// - Parameter forkey: value key.
    /// - Returns: the stored string value.
    public func string(for key:String) -> String {
        if (values[key] != nil) {
            return values[key] as? String ?? ""
        } else {
            return defaults.value(forKey:key) as? String ?? ""
        }
    }
    
    
    /// define a common function to store string value.
    ///
    /// - Parameter forkey: value key.
    public func removeValue(for key:String) {
        values[key] = nil
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
}
