//
//  HomeVC.swift
//  SGLogin
//
//  Created by Suneel Gunupudi on 11/26/18.
//  Copyright © 2018 Suneel. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateData()
        
    }
    
    @IBAction func logoutBtnAction(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: SGBrandOptions.shared.userLoggedinKey)
        SGViewSwitcher.shared.UpdateRootVC()
        
    }

}

//Update Methods
extension HomeVC{
    func updateData(){
        
        var names: [String] = ["A", "B", "C", "D", "E", "F", "G"]
        var i = 0
        var c = names.count - 1
        print("Before Reverse: \(names)")
        while i < c {
            names.swapAt(i, c)
            i = i + 1
            c = c - 1
        }
        print("Middle Reverse: \(names)")
        
        for i in 0..<names.count/2 {
            (names[i], names[names.count - i - 1]) = (names[names.count - i - 1], names[i])
        }
         print("After Reverse: \(names)")
        
        
    }
    
    func notificationAlert(_ title: String?, message: String?, btnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionBtn = UIAlertAction(title: btnTitle, style: .cancel, handler: nil)
        alert.addAction(actionBtn)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

//MARK: - Webservice
extension HomeVC {
    func loginAPI(){
        
    }
    
}
