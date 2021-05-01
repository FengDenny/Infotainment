//
//  Color+Extension.swift
//  Infotainment
//
//  Created by Denny Feng on 4/30/21.
//

import SwiftUI
//MARK:COLOR
// add 0x to the front of any color you  want
extension Color {
    static let primaryDark = Color.init(hex:0x121212)
    static let primaryDarkBackground = Color.init(hex:0x2D2E2D)
    static let softOrange = Color.init(hex: 0xDABAA2)
    
    init(hex: UInt, alpha: Double = 1) {
           self.init(
               .sRGB,
               red: Double((hex >> 16) & 0xff) / 255,
               green: Double((hex >> 08) & 0xff) / 255,
               blue: Double((hex >> 00) & 0xff) / 255,
               opacity: alpha
           )
       }
}
