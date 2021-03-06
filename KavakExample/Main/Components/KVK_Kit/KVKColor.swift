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
    case KVKCell            //7
    case KVKBlack           //8
    case KVKWhite           //9
    
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
            case .KVKCell:
                return .KVKCell
            case .KVKBlack:
                return .KVKBlack
            case .KVKWhite:
                return .KVKWhite
        }
    }
    
    static public func colorWith(value: Int) -> UIColor {
        return ColorStyle(rawValue: value)?.color ?? UIColor.clear
    }
    static public func colorWith(stringValue value: String) -> Int {
        switch value.lowercased() {
            case "black":
                return ColorStyle.KVKBlack.rawValue
            case "white":
                return ColorStyle.KVKWhite.rawValue
            case "pink":
                return ColorStyle.KVKPink.rawValue
            case "green":
                return ColorStyle.KVKGreen.rawValue
            case "red":
                return ColorStyle.KVKRed.rawValue
            case "gray":
                return ColorStyle.KVKGray.rawValue
            case "gnomebg":
                return ColorStyle.KVKGnomeBG.rawValue
            case "cell":
                return ColorStyle.KVKCell.rawValue
            default:
                return -1
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
                return UIColor(named: "KVKWhiteSystem") ?? UIColor.clear
            } else {
                return UIColor.white
            }
        }
    }
    static var KVKPink: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKPink") ?? UIColor.clear
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
    static var KVKCell: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKCell") ?? UIColor.clear
            } else {
                return UIColor.getKVKCell()
            }
        }
    }
    static var KVKBlack: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKBlack") ?? UIColor.clear
            } else {
                return UIColor.black
            }
        }
    }
    static var KVKWhite: UIColor{
        get{
            if #available(iOS 11.0, *) {
                return UIColor(named: "KVKWhite") ?? UIColor.clear
            } else {
                return UIColor.white
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
        return UIColor(red   : 255.0 / 255.0,
                       green : 255.0 / 255.0,
                       blue  : 240.0 / 255.0,
                       alpha :   1.0)
    }
    static func getKVKCell() -> UIColor{
        return UIColor(red   : 250.0 / 255.0,
                       green : 235.0 / 255.0,
                       blue  : 215.0 / 255.0,
                       alpha :   1.0)
    }
}
