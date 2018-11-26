//
//  ViewController.swift
//  SGLogin
//
//  Created by Suneel Gunupudi on 11/26/18.
//  Copyright © 2018 Suneel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        let oldEmail = defaults.string(forKey: SGBrandOptions.shared.oldUserEmailKey)
        let oldPassword = defaults.string(forKey: SGBrandOptions.shared.oldUserPasswordKey)
        
        if (emailTF.text ?? "").isValidEmail && (passwordTF.text ?? "").isValidPassword {
            if (emailTF.text == oldEmail) && (passwordTF.text == oldPassword) {
                callMainVC()
                
            }else{
                notificationAlert(nil, message: "User not registered or password incorrect", btnTitle: "OK")
                
            }
            
        }else{
            notificationAlert(nil, message: "Invalid email / password", btnTitle: "OK")
        }
        
    }
    
    //Calling Main Viewcontroller after successfull login
    func callMainVC(){

        let defaults = UserDefaults.standard
        defaults.set(true, forKey: SGBrandOptions.shared.userLoggedinKey)
        defaults.set(emailTF.text, forKey: SGBrandOptions.shared.oldUserEmailKey)
        defaults.set(passwordTF.text, forKey: SGBrandOptions.shared.oldUserPasswordKey)
        
        //User Directly navigate to the Home Page
        SGViewSwitcher.shared.UpdateRootVC()
        
    }


}

//Update Methods
extension LoginVC{
    func updateData(){
        
    }
    
    func notificationAlert(_ title: String?, message: String?, btnTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionBtn = UIAlertAction(title: btnTitle, style: .cancel, handler: nil)
        alert.addAction(actionBtn)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

//MARK: - Textfield Delegate
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == emailTF {
            passwordTF.becomeFirstResponder()
        }
        
        return true
        
    }
    
}

//MARK: - Webservice
extension LoginVC {
    func loginAPI(){
        
    }
    
}
