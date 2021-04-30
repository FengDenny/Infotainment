//
//  FontExtension.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import SwiftUI

extension Font {
    private static let fontName = "KronaOne"
    enum type: String {
        case regular
        var font:String{
            return "\(fontName)-\(self.rawValue.capitalized)"
        }
    }
    
    static func primary(_ type: type, size: CGFloat = 15) -> Font {
        return .custom(type.font, size: size)
    }
    
}
