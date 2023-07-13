//
//  ScaleScreen.swift
//  Kitchen
//
//  Created by Yaroslav Savin on 04.07.2023.
//

import Foundation
import UIKit
public class Size {
    public func scaleWidth(_ value : CGFloat) -> CGFloat{
        let x = UIScreen.main.bounds.width/375
        return value * x
    }

    public func scaleHeight(_ value : CGFloat) -> CGFloat{
        let y = UIScreen.main.bounds.height/812
        return value * y
    }
    public func scaleWidthForDish(_ value : CGFloat) -> CGFloat{
        let x = UIScreen.main.bounds.width/375
        return value * x
    }

    public func scaleHeightForDish(_ value : CGFloat) -> CGFloat{
        let y = UIScreen.main.bounds.height/375
        return value * y
    }
    
    public func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    public func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    public func scaleToLeftCorner() -> CGFloat {
        let x = -UIScreen.main.bounds.width/3.8
        return x
    }
}
