//
//  ViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 18/02/21.
//

import UIKit
import Alamofire


// Start - Hilangin keyboard setelah selesai diketik
extension UIViewController{
    
    func HideKeyboard() {
        let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        
        view.addGestureRecognizer(Tap)
        
    }
    
    
    @objc func DismissKeyboard(){
        view.endEditing(true)
    }
}
// End - Hilangin keyboard setelah selesai diketik



class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        //Text Field Naik saat Muncul Keyboard (1)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        //Text Field Naik saat Muncul Keyboard (1 end)


        
        //Memangil Fungsi Hide Keyboard Tap Anywhere
        usernameField.text = ""
        passField.text = ""
        self.HideKeyboard()
        //Memangil Fungsi Hide Keyboard Tap Anywhere(End)
        
        
        //Memangil Fungsi Hide Keyboard dengan tombol selesai
        usernameField.delegate = self
        passField.delegate = self
        
        usernameField.returnKeyType = .done
        passField.returnKeyType = .done
            
        self.view.addSubview(usernameField)
        self.view.addSubview(passField)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    //Memangil Fungsi Hide Keyboard dengan tombol selesai (End)
    
    
    
    //Text Field Naik saat Muncul Keyboard (2)
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    //Text Field Naik saat Muncul Keyboard (2 end)
    
    
    
    //Onboarding Screen / First Time Run
    override func viewDidAppear(_ animated: Bool) {
        let firstTime = UserDefaults.standard.object(forKey: "first_time") as? Bool

        // Show the intro collectionView
        if firstTime == nil {
            let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "OnboardingScreen") // Instatiates your pageView
                    view.modalPresentationStyle = .fullScreen
                    show(view, sender: self)
            UserDefaults.standard.set(false, forKey: "first_time")
        }
    }
    //Onboarding Screen / First Time Run (End)
    
    //Code Login Auth
    
    let link_request = "https://sid.polibatam.ac.id/apilogin/web/api/auth/login"
    let tokenAPI = "imsLKICAxlFhEOkbxeO8bbQu2LE44zVf"
    
        @IBAction func loginBtn(_ sender: Any) {
            if (usernameField.text=="" || passField.text=="") {
                // Create new Alert
                let dialogMessage = UIAlertController(title: "Login Gagal", message: "\n Username / Password tidak boleh kosong! Silahkan coba lagi!", preferredStyle: .alert)
                
                // Create OK button with action handler
                let ok = UIAlertAction(title: "Kembali", style: .default, handler: { (action) -> Void in
                    print("Field kosong button Kembali tapped")
                 })
                
                //Add OK button to a dialog message
                dialogMessage.addAction(ok)
                // Present Alert to
                self.present(dialogMessage, animated: true, completion: nil)
            }
            else {
                let configuration = URLSessionConfiguration.default
                    configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
                let parameters: Parameters = ["request":"login",
                                              "username":usernameField.text!,
                                              "password":passField.text!,
                                              "token":tokenAPI]
                
                Alamofire.request(link_request, method: .post, parameters: parameters).responseJSON
                {
                    response in
                    print(response)
                    
                    
                    if let result = response.result.value {
                        let jsonData = result as! NSDictionary
                        let myStringDict = jsonData.value(forKey: "data") as? [String:AnyObject]
                        
                        if (jsonData.value(forKey: "status") as! String == "success") {
                            
                            
                            // User Default
                            let userDefaultStore = UserDefaults.standard
                            userDefaultStore.set(self.usernameField.text, forKey: "username")
                            userDefaultStore.set(myStringDict?["name"], forKey: "name")
                            userDefaultStore.set(myStringDict?["jabatan"], forKey: "jabatan")
                            userDefaultStore.set(myStringDict?["nim_nik_unit"], forKey: "nim")
                            // User Default (End)
                            
                            let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                            let newViewController = storyBoard.instantiateViewController(withIdentifier: "TabbarViewController")
                            newViewController.modalPresentationStyle = .fullScreen
                            self.show(newViewController, sender: self)
                            
                        } else {
                            // Create new Alert
                            let dialogMessage = UIAlertController(title: "Login Gagal", message: "\n Username / Password salah! Silahkan coba lagi!", preferredStyle: .alert)
                            
                            // Create OK button with action handler
                            let ok = UIAlertAction(title: "Kembali", style: .default, handler: { (action) -> Void in
                                print("Password salah Ok button tapped")
                             })
                            
                            //Add OK button to a dialog message
                            dialogMessage.addAction(ok)
                            // Present Alert to
                            self.present(dialogMessage, animated: true, completion: nil)
                        }
                    }
                }
            }
        }
    //Code Login Auth (End)
    
    struct Identitas: Codable {
        var username: String
        var id: Int
        var email: String
        var jabatan: String
        var name: String
        var nim_nik_unit: Int
    }

}
