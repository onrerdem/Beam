//
//  ViewController.swift
//  BEAM
//
//  Created by onur erdem on 11.12.2022.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var UserCodeTxt: UITextField!
    @IBOutlet weak var UserPassTxt: UITextField!
    
    var signIn : Bool = false
    var tokenData : String = ""
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LoginBtn(_ sender: Any) {
        
        if ((UserCodeTxt.text != nil) && (UserCodeTxt.text != "")) {
            
            if ((UserPassTxt.text != nil) && (UserPassTxt.text != "")) {
                signIn = isLogin(userCode: (UserCodeTxt.text)!, userPass: (UserPassTxt.text)!)
                if (signIn) {
                    performSegue(withIdentifier: "toDashboard", sender: nil)
                }else{
                    showAlert(errorMessage: "Kullanıcı Kodunuz vey Şifreniz Yanlış!!!")
                }
                
            }else{
                showAlert(errorMessage: "Kullanıcı Şifresi Boş Olamaz!!!")
            }
            
        }else{
            showAlert(errorMessage: "Kullanıcı Kodu Boş Olamaz!!!")
        }
        
    }
    
    func isLogin(userCode : String, userPass : String) -> Bool {
        
        return true
    }
    
    func showAlert (errorMessage:String) {
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertController.Style.alert)
        let alertBtn = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default)
        alert.addAction(alertBtn)
        self.present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDashboard"{
            let destination = segue.destination as? DashboardVC
            destination?.tokenData = tokenData
        }
    }
}

