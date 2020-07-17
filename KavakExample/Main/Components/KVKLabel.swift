//  KVKLabel.swift
//  Created by Daniel Garcia on 7/17/20.
//  Copyright © 2020 Daniel Garcia. All rights reserved.

import Foundation
import UIKit

@IBDesignable
open class KVKLabel: UILabel{
    
    public enum STYLE_LABEL_TYPE: Int32 {
        case none                = 0
        case KVKLABEL_H1         = 1
        case KVKLABEL_H2         = 2
        case KVKLABEL_SUBTITLE_1 = 3
        case KVKLABEL_SUBTITLE_2 = 4
        case KVKLABEL_BODY_1     = 5
        case KVKLABEL_BODY_2     = 6
        case KVKLABEL_BODY_3     = 7
        case KVKLABEL_H1_BOLD    = 8
        case KVKLABEL_H2_BOLD    = 9
    }
    
    @IBInspectable public var styleType: Int32 = 0 {
        didSet{
            set(labelStyle: STYLE_LABEL_TYPE(rawValue: styleType) ?? .none)
        }
    }
    @IBInspectable public var aligmentText: Int32 = 0 {
        didSet{
            set(labelStyle: STYLE_LABEL_TYPE(rawValue: styleType) ?? .none)
        }
    }
    @IBInspectable public var colorTextCode : Int = 0 {
        didSet{
           textColor = ColorStyle.colorWith(value: colorTextCode)
        }
    }
    @IBInspectable public var borderColor : Int = 1 {
        didSet{
            layer.borderColor = ColorStyle.colorWith(value: borderColor).cgColor
        }
    }
    @IBInspectable public var backgroundColorCode : Int = 6 {
        didSet{
            backgroundColor = ColorStyle.colorWith(value: backgroundColorCode)
        }
    }
    open override func tintColorDidChange() {
        layer.borderColor = ColorStyle.colorWith(value: borderColor).cgColor
    }
    open override func layoutSubviews() {
        layer.borderColor = ColorStyle.colorWith(value: borderColor).cgColor
    }
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }
        
    func initialize() {
        set(labelStyle: STYLE_LABEL_TYPE(rawValue: styleType) ?? .none)
    }
    
    public func set(labelStyle style: STYLE_LABEL_TYPE){
        
        textColor = ColorStyle.colorWith(value: colorTextCode)
        textAlignment = NSTextAlignment(rawValue: Int(aligmentText)) ?? .left
        
        switch (style) {
            case .KVKLABEL_H1:
                self.setH1Style()
            case .KVKLABEL_H2:
                self.setH2Style()
            case .KVKLABEL_SUBTITLE_1:
                self.setSubtitle1Style()
            case .KVKLABEL_SUBTITLE_2:
                self.setSubtitle2Style()
            case .KVKLABEL_BODY_1:
                self.setBody1Style()
            case .KVKLABEL_BODY_2:
                self.setBody2Style()
            case .KVKLABEL_BODY_3:
                self.setBody3Style()
            case .KVKLABEL_H1_BOLD:
                self.setH1BoldStyle()
            case .KVKLABEL_H2_BOLD:
                self.setH2BoldStyle()
            default: return
        }
    }
    
    public func setH1Style() { //1
        self.font = UIFont.systemFont(ofSize: 50.0, weight: .regular)
    }
    public func setH2Style() { //2
        self.font = UIFont.systemFont(ofSize: 40.0, weight: .regular)
    }
    public func setSubtitle1Style() { //3
        self.font = UIFont.systemFont(ofSize: 32.0, weight: .medium)
    }
    public func setSubtitle2Style() { //4
        self.font = UIFont.systemFont(ofSize: 28.0, weight: .medium)
    }
    public func setBody1Style() { //5
        self.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
    }
    public func setBody2Style() { //6
        self.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
    }
    public func setBody3Style() { //7
        self.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
    }
    public func setH1BoldStyle() { //8
        self.font = UIFont.systemFont(ofSize: 55.0, weight: .bold)
    }
    public func setH2BoldStyle() { //9
        self.font = UIFont.systemFont(ofSize: 45.0, weight: .bold)
    }

}
