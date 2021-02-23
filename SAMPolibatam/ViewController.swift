//
//  ViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 18/02/21.
//

import UIKit

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
        // Do any additional setup after loading the view.
        usernameField.text = ""
        passField.text = ""
        self.HideKeyboard()
        
    }
    

    
    
}





