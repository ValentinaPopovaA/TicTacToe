//
//  Palette.swift
//  TicTacToe
//
//  Created by Дмирий Зядик on 30.09.2024.
//

import UIKit

enum AppColors {
    case basic_white
    case basic_background
    case basic_black
    case basic_blue
    case basic_light_blue
    case secondary_purple
    case secondary_pink
    case secondary_gray
    
    var color: UIColor? {
        switch self {
        case .basic_blue:
            return UIColor(named: "blue" )
        case .basic_light_blue:
            return UIColor(named: "light_blue")
        case .basic_white:
            return UIColor(named: "white" )
        case .basic_background:
            return UIColor(named: "background" )
        case .basic_black:
            return UIColor(named: "black" )
        case .secondary_purple:
            return UIColor(named: "purple" )
        case .secondary_pink:
            return UIColor(named: "pink" )
        case .secondary_gray:
            return UIColor(named: "gray" )
        }
    }
}
extension UIColor {
 
    
    static func appColor(_ name: AppColors) -> UIColor? {
        switch name {
        case .basic_blue:
            return UIColor(named: "blue" )
        case .basic_light_blue:
            return UIColor(named: "light_blue")
        case .basic_white:
            return UIColor(named: "white" )
        case .basic_background:
            return UIColor(named: "background" )
        case .basic_black:
            return UIColor(named: "black" )
        case .secondary_purple:
            return UIColor(named: "purple" )
        case .secondary_pink:
            return UIColor(named: "pink" )
        case .secondary_gray:
            return UIColor(named: "gray" )
        }
    }
   
    static var basic_white: UIColor {
        return AppColors.basic_blue.color!
    }
    
    static var basic_background: UIColor {
        return AppColors.basic_background.color!
    }
    
    static var basic_light_blue: UIColor {
        return AppColors.basic_light_blue.color!
    }
    
    static var basic_blue: UIColor {
        return AppColors.basic_blue.color!
    }
    
    static var basic_black: UIColor {
        return AppColors.basic_black.color!
    }
    
    static var secondary_purple: UIColor {
        return AppColors.secondary_purple.color!
    }
    
    static var secondary_pink: UIColor {
        return AppColors.secondary_pink.color!
    }
    
    static var secondary_gray: UIColor {
        return AppColors.secondary_gray.color!
    }
}

