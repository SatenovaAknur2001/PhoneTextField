//
//  Color+Hex.swift
//  PhoneTextField
//
//  Created by Акнур on 02.08.2021.
//

import Foundation
import SwiftUI
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
    
    static var lightGray: Color { Color(hex: "#F0F0F0")}
    static var accentGreenMain: Color { Color(hex: "#27AE60")}
    static var accentGreenDark: Color { Color(hex: "#006F40")}
    static var lightBackroundMain: Color { Color(hex: "#FAFAFA")}
    static var grayTextDefault: Color { Color(hex: "#3A3A3F")}
    static var backgroundMain: Color { Color(hex: "#FFFFFF")}
    static var darkTextDefault: Color { Color(hex: "#000D1A" )}
    static var accentRed: Color { Color(hex: "#B10909")}
    static var placeholderGray: Color { Color(hex: "#A9ACB0")}
    static var darkBackground: Color { Color(hex: "#1B242D")}
    static var alertBackground: Color { Color(hex: "#f5f5f5")}
    static var disabledBackground: Color { Color(hex: "#D6D9DB")}
    static var gradientsGoldFirst: Color { Color(hex: "#E8D389")}
    static var gradientsGoldSecond: Color { Color(hex: "#DD9D3C")}
    static var gradientsGreenFirst: Color { Color(hex: "#7ACA95")}
    static var gradientsGreenSecond: Color { Color(hex: "#387C55")}
    static var gradientsNavy: Color { Color(hex: "#7AADCA")}
    static var gradientsBlue: Color { Color(hex: "#38437C")}
    static var separator: Color { Color(hex: "#E6E7E8")}
    static var shadow: Color { Color(hex: "#787878")}
    static var accentGold: Color { Color(hex: "#E8BF42")}
    static var tertiary: Color { Color(hex: "#F0F0F0")}
    static var lightGreen: Color { Color(hex: "#E9F7EF")}
}

