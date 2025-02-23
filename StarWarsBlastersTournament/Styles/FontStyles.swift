//
//  FontStyles.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 11/07/24.
//

import UIKit
import Foundation

enum FontStyle {
    
    enum Raleway: String {
        case bold = "Raleway-Bold"
        case italic = "Raleway-Italic"
        case light = "Raleway-Light"
        case black = "Raleway-Black"
        case regular = "Raleway-Regular"
        case medium = "Raleway-Medium"
        case semibold = "Raleway-SemiBold"
        
        func getFont(_ size: CGFloat) -> UIFont {
            if let font = UIFont(name: self.rawValue, size: size) {
                return font
            } else {
                // If the font cannot be created, return a default font or handle the error as needed
                return UIFont.systemFont(ofSize: size)
            }
        }
    }
}

struct SBTFonts {
    let light10: UIFont = UIFont(name: "Raleway-Light", size: 10)!
    let light11: UIFont = UIFont(name: "Raleway-Light", size: 11)!
    let light12: UIFont = UIFont(name: "Raleway-Light", size: 12)!
    let light13: UIFont = UIFont(name: "Raleway-Light", size: 13)!
    let light14: UIFont = UIFont(name: "Raleway-Light", size: 14)!
    let light15: UIFont = UIFont(name: "Raleway-Light", size: 15)!
    let light16: UIFont = UIFont(name: "Raleway-Light", size: 16)!
    let light17: UIFont = UIFont(name: "Raleway-Light", size: 17)!
    let light18: UIFont = UIFont(name: "Raleway-Light", size: 18)!
    let light19: UIFont = UIFont(name: "Raleway-Light", size: 19)!
    let light20: UIFont = UIFont(name: "Raleway-Light", size: 20)!

    let regular11: UIFont = UIFont(name: "Raleway-Regular", size: 11)!
    let regular12: UIFont = UIFont(name: "Raleway-Regular", size: 12)!
    let regular14: UIFont = UIFont(name: "Raleway-Regular", size: 14)!
    
    let bold10: UIFont = UIFont(name: "Raleway-Bold", size: 10)!
    let bold12: UIFont = UIFont(name: "Raleway-Bold", size: 12)!
    let bold14: UIFont = UIFont(name: "Raleway-Bold", size: 14)!
    let bold16: UIFont = UIFont(name: "Raleway-Bold", size: 16)!
    let bold20: UIFont = UIFont(name: "Raleway-Bold", size: 20)!
    let bold23: UIFont = UIFont(name: "Raleway-Bold", size: 23)!
    let bold24: UIFont = UIFont(name: "Raleway-Bold", size: 24)!
    
    let semibold10: UIFont = UIFont(name: "Raleway-SemiBold", size: 10)!
    let semibold12: UIFont = UIFont(name: "Raleway-SemiBold", size: 12)!
    let semibold14: UIFont = UIFont(name: "Raleway-SemiBold", size: 14)!
    let semibold16: UIFont = UIFont(name: "Raleway-SemiBold", size: 16)!
    
    let italic12: UIFont = UIFont(name: "Raleway-Italic", size: 12)!
    let italic14: UIFont = UIFont(name: "Raleway-Italic", size: 14)!
    let italic16: UIFont = UIFont(name: "Raleway-Italic", size: 16)!
}

