//  KVKColor.swift
//  Created by Daniel Garcia on 7/17/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.

import UIKit
public enum ColorStyle: Int {
    case KVKBlackSystem     //0
    case KVKWhiteSystem     //1
    case KVKPink            //2
    case KVKGreen           //3
    case KVKRed             //4
    case KVKGray            //5
    case KVKGnomeBG         //6
    //case KVK
    
    public var color : UIColor {
        switch self {
            case .KVKBlackSystem:
                return .KVKBlackSystem
            case .KVKWhiteSystem:
                return .KVKWhiteSystem
            case .KVKPink:
                return .KVKPink
            case .KVKGreen:
                return .KVKGreen
            case .KVKRed:
                return .KVKRed
            case .KVKGray:
                return .KVKGray
            case .KVKGnomeBG:
                return .KVKGnomeBG
        //@unknown default:
        }
    }
    
    static public func colorWith(value: Int) -> UIColor {
        if let color = ColorStyle(rawValue: value)?.color {
            return color
        }
        return .clear
    }
    static public func colorWith(value: String) -> UIColor {
        switch value.lowercased() {
            case "black":
                return .black
            case "white":
                return .white
            case "pink":
                return colorWith(value: ColorStyle.KVKPink.rawValue)
            case "green":
                return colorWith(value: ColorStyle.KVKGreen.rawValue)
            case "red":
                return colorWith(value: ColorStyle.KVKRed.rawValue)
            case "gray":
                return colorWith(value: ColorStyle.KVKGray.rawValue)
            case "gnomeBG ":
                return colorWith(value: ColorStyle.KVKGnomeBG.rawValue)
            default:
                return .clear
        }
    }
}

@objc
public extension UIColor {
    static var KVKBlackSystem: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKBlackSystem") ?? UIColor.clear
            } else {
                return UIColor.black
            }
        }
    }
    static var KVKWhiteSystem: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKBlackSystem") ?? UIColor.clear
            } else {
                return UIColor.white
            }
        }
    }
    static var KVKPink: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKBPink") ?? UIColor.clear
            } else {
                return UIColor.getKVKPink()
            }
        }
    }
    static var KVKGreen: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKGreen") ?? UIColor.clear
            } else {
                return UIColor.getKVKGreen()
            }
        }
    }
    static var KVKRed: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKRed") ?? UIColor.clear
            } else {
                return UIColor.getKVKRed()
            }
        }
    }
    static var KVKGray: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKGray") ?? UIColor.clear
            } else {
                return UIColor.getKVKGray()
            }
        }
    }
    static var KVKGnomeBG: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKGnomeBG") ?? UIColor.clear
            } else {
                return UIColor.getGnomeBG()
            }
        }
    }
    
    static var KVK: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVK") ?? UIColor.clear
            } else {
                return UIColor.get()
            }
        }
    }
    
    
    
    static func getKVKPink() -> UIColor{
        return UIColor(red   : 255.0 / 255.0,
                       green :  20.0 / 255.0,
                       blue  : 147.0 / 255.0,
                       alpha :   1.0)
    }
    static func getKVKGreen() -> UIColor{
        return UIColor(red   :  51.0 / 255.0,
                       green : 255.0 / 255.0,
                       blue  :  51.0 / 255.0,
                       alpha :   1.0)
    }
    static func getKVKRed() -> UIColor{
        return UIColor(red   : 153.0 / 255.0,
                       green :   0.0 / 255.0,
                       blue  :   0.0 / 255.0,
                       alpha :   1.0)
    }
    static func getKVKGray() -> UIColor{
        return UIColor(red   : 119.0 / 255.0,
                       green : 136.0 / 255.0,
                       blue  : 153.0 / 255.0,
                       alpha :   1.0)
    }
    static func getGnomeBG() -> UIColor{
        return UIColor(red   : 254.0 / 255.0,
                       green : 249.0 / 255.0,
                       blue  : 226.0 / 255.0,
                       alpha :   1.0)
    }
    
    static func get() -> UIColor{
        return UIColor(red   :  39.0 / 255.0,
                       green : 130.0 / 255.0,
                       blue  :  82.0 / 255.0,
                       alpha :   1.0)
    }
}
