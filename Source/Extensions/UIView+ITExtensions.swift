//
//  UIView+ITExtensions.swift
//  IssaTool
//
//  Created by Isaac on 2018/7/17.
//  Copyright © 2018年 IsaacPan. All rights reserved.
//
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
    public func set(topLeft: Bool = true, topRight: Bool = true, bottomLeft: Bool = true, bottomRight: Bool = true, cornerRadius: CGFloat) {
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
    
    /// add shadow
    ///
    /// - Parameters:
    ///   - color: shadow color
    ///   - radius: shadow radius
    ///   - offset: shadow offset
    ///   - opacity: shadow opacity
    public func addShadow(color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), radius: CGFloat = 3, offset: CGSize = .zero, opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
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

public extension UILabel {
    
    /// a fast way to create a label.
    ///
    /// - Parameters:
    ///   - text: text
    ///   - font: font
    ///   - color: color
    ///   - alignment: alignment
    /// - Returns: created label
    static func create(text: String? = nil, font: UIFont? = nil, color: UIColor? = nil, alignment: NSTextAlignment? = nil) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = color
        label.textAlignment = alignment ?? .left
        return label
    }
}

public extension UIButton {
    
    /// a fast way to create a text button.
    ///
    /// - Parameters:
    ///   - title: title
    ///   - font: font
    ///   - titleColor: title colot
    ///   - backgroundColor: background color
    /// - Returns: created button
    static func create(title: String? = nil, font: UIFont? = nil, titleColor: UIColor? = nil, backgroundColor: UIColor? = nil) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = font
        return button
    }
    
    /// a fast way to create an image button
    ///
    /// - Parameters:
    ///   - image: normal show image
    ///   - highlightImage: hightlight show image
    ///   - selectedImage: selected show image
    ///   - backgroundColor: background color
    /// - Returns: created button
    static func create(image: UIImage? = nil, highlightImage: UIImage? = nil, selectedImage: UIImage? = nil, backgroundColor: UIColor? = nil) -> UIButton {
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.setImage(image, for: .highlighted)
        button.setImage(image, for: .selected)
        button.backgroundColor = backgroundColor
        return button
    }
}
