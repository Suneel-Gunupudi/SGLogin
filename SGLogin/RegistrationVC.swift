//
//  RegistrationVC.swift
//  SGLogin
//
//  Created by Suneel Gunupudi on 11/26/18.
//  Copyright © 2018 Suneel. All rights reserved.
//

import UIKit

class RegistrationVC: UIViewController {
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var retypePasswordTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registrationBtnAction(_ sender: UIButton) {
        
        let defaults = UserDefaults.standard
        let oldEmail = defaults.string(forKey: SGBrandOptions.shared.oldUserEmailKey)
        
        if (emailTF.text ?? "").isValidEmail && (passwordTF.text ?? "").isValidPassword && (retypePasswordTF.text ?? "").isValidPassword {
            if passwordTF.text != retypePasswordTF.text {
                notificationAlert(nil, message: "Retype password not matched", btnTitle: "OK")
                
            }else if (emailTF.text == oldEmail) {
                notificationAlert(nil, message: "Already User exist", btnTitle: "OK")
                
            }else{
                callMainVC()
                
            }
            
        }else{
            notificationAlert(nil, message: "Invalid email / password", btnTitle: "OK")
            
        }
        
    }
    
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
extension RegistrationVC{
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
extension RegistrationVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == emailTF {
            passwordTF.becomeFirstResponder()
        }else if textField == passwordTF {
            retypePasswordTF.becomeFirstResponder()
        }
        
        return true
        
    }
    
}

//MARK: - Webservice
extension RegistrationVC {
    func registrationAPI(){
        
    }
    
}
