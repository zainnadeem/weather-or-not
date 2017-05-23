//
//  Extentions.swift
//  C4QWeather
//
//  Created by Zain Nadeem on 5/23/17.
//  Copyright © 2017 Zain Nadeem. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    class func weatherFont(_ size : CGFloat) -> UIFont {
        return UIFont(name: "Avenir", size: size)!
    }
    
    class func weatherFontBold(_ size : CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Bold", size: size)!
    }
    
    class func weatherFontItalic(_ size : CGFloat) -> UIFont {
        return UIFont(name: "Avenir-MediumOblique", size: size)!
        
    }
}
