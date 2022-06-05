//
//  UIFontExtension.swift
//  Pokedex
//
//  Created by Thays Prado on 04/06/22.
//  Copyright © 2022 ThaysPrado. All rights reserved.
//

import UIKit

extension UIFont {
    
    internal enum TPTextStyle {
        case title1
        case title2
        case title3
        case body
        case subheadline
        case footnote
        
        internal var size: CGFloat {
            switch self {
            case .title1:
                return 30
            case .title2:
                return 22
            case .title3:
                return 20
            case .body:
                return 17
            case .subheadline:
                return 15
            case .footnote:
                return 13
            }
        }
        
        internal var textStyle: TextStyle {
            switch self {
            case .title1:
                return .title1
            case .title2:
                return .title2
            case .title3:
                return .title3
            case .subheadline:
                return .subheadline
            case .body:
                return .body
            case .footnote:
                return .footnote
            }
        }
    }
    
    internal enum TPWeight: String {
        case regular = "Regular"
        case light = "Light"
        case bold = "Bold"
    }
    
    internal static func systemScaledFont(name: String, size: CGFloat, textStyle: TextStyle) -> UIFont? {
        if let font = UIFont(name: name, size: size) {
            return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
        }
        return nil
    }
    
    static func lato(with weight: TPWeight, forTextStyle customTextStyle: TPTextStyle) -> UIFont? {
        let name = "Lato-\(weight.rawValue)"
        return systemScaledFont(name: name, size: customTextStyle.size, textStyle: customTextStyle.textStyle)
    }
    
}
