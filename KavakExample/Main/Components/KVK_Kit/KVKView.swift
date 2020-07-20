//  KVKView.swift
//  Created by Daniel Garcia on 7/18/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.

import Foundation
import UIKit

@IBDesignable
open class KVKView: UIView {
    
    public enum StyleView: Int {
        case background     //0
        case cardView       //1
        case optionView     //2
    }
    @IBInspectable public var style           : Int = 0
    @IBInspectable public var backgroundCode  : Int = 6 {
        didSet{
            setBackground()
        }
    }
    @IBInspectable public var borderColorCode : Int = 6
    public func setBackground(){
        backgroundColor = ColorStyle.colorWith(value: backgroundCode)
        let styleView = StyleView(rawValue: style)
        switch styleView {
            case .background:
                layer.cornerRadius = 0
            case .cardView:
                layer.setShadow(color   : .black,
                                opacity : 0.1,
                                offSet  : CGSize(width  : 0,
                                                 height : 3),
                                radius  : 6)
                layer.cornerRadius = 4
            case .optionView:
                layer.borderWidth  = 1.0
                layer.borderColor  = (ColorStyle.colorWith(value: borderColorCode)).cgColor
                layer.cornerRadius = 4
            case .none:
                layer.setShadow(color   : .black,
                                opacity : 0.1,
                                offSet  : CGSize(width: 0,
                                                 height: 3),
                                radius  : 4)
                break
        }
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        setBackground()
    }
}

extension CALayer {
    func setShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        self.shadowPath         = UIBezierPath(rect: self.bounds).cgPath
        self.shadowColor        = color.cgColor
        self.shadowOffset       = offSet
        self.shadowRadius       = radius
        self.masksToBounds      = false
        self.shadowOpacity      = opacity
        self.shouldRasterize    = true
        self.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
