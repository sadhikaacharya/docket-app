//
//  UIView+Extensions.swift
//  Docket
//
//  Created by Sadhika Acharya on 6/18/22.
//

import UIKit

extension UIView{
   @IBInspectable var cornerRadius: CGFloat{
    get{ return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}

extension UIViewController{
    
    static var identifier: String{
        return String(describing: self)
    }
    
    static func instatiate() -> Self{
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(identifier: identifier) as! Self
    }
}
