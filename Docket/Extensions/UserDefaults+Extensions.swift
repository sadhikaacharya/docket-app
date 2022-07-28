//
//  UserDefaults+Extensions.swift
//  Docket
//
//  Created by Sadhika Acharya on 7/28/22.
//

import Foundation

extension UserDefaults{
    private enum UserDefaultsKeys: String{
        case hasOnboarded
        case userName
    }
    
    var hasOnboarded: Bool{
        get{
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
         
        set{
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
    
    var userName: String{
        get{
            string(forKey: UserDefaultsKeys.userName.rawValue)!
        }
        
        set{
            setValue(newValue, forKey: UserDefaultsKeys.userName.rawValue)
        }
    }
    
   
}
