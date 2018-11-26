//
//  SGViewSiwtcher.swift
//  SGLogin
//
//  Created by Suneel Gunupudi on 11/26/18.
//  Copyright © 2018 Suneel. All rights reserved.
//

import UIKit

class SGViewSwitcher {
    static let shared = SGViewSwitcher()
    
    func UpdateRootVC(){
        let isAlreadyLoggedin = UserDefaults.standard.bool(forKey: SGBrandOptions.shared.userLoggedinKey)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        if isAlreadyLoggedin{ //Already logged in
            let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
            appDelegate.window?.rootViewController = rootVC
            
        }else{//New User
            let rootVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "InitialVC")
            appDelegate.window?.rootViewController = rootVC
            
        }
        
    }
    
}
