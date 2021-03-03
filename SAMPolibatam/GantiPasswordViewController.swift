//
//  GantiPasswordViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 03/03/21.
//

import UIKit

class GantiPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var oldPassword: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var newPasswordConfirm: UITextField!
    
    
    @IBAction func backBtn(_ sender: UIButton) {
        if let navController = self.navigationController {
          navController.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Memangil Fungsi Hide Keyboard Tap Anywhere
        self.HideKeyboard()
        //Memangil Fungsi Hide Keyboard Tap Anywhere(End)
        
        //Memangil Fungsi Hide Keyboard dengan tombol selesai
        oldPassword.delegate = self
        newPassword.delegate = self
        newPasswordConfirm.delegate = self
        
        oldPassword.returnKeyType = .done
        newPassword.returnKeyType = .done
        newPasswordConfirm.returnKeyType = .done
            
        self.view.addSubview(oldPassword)
        self.view.addSubview(newPassword)
        self.view.addSubview(newPasswordConfirm)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        oldPassword.borderStyle = UITextField.BorderStyle.roundedRect
        newPassword.borderStyle = UITextField.BorderStyle.roundedRect
        newPasswordConfirm.borderStyle = UITextField.BorderStyle.roundedRect
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    //Memangil Fungsi Hide Keyboard dengan tombol selesai (End)
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
