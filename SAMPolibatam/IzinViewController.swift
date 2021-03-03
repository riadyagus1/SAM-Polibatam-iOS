//
//  IzinViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 22/02/21.
//

import UIKit

class IzinViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var izinBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.HideKeyboard()
        //Memangil Fungsi Hide Keyboard Tap Anywhere(End)
        
        
        //Memangil Fungsi Hide Keyboard dengan tombol selesai
        izinBox.delegate = self
        izinBox.returnKeyType = .done
            
        self.view.addSubview(izinBox)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        izinBox.borderStyle = UITextField.BorderStyle.roundedRect
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    //Memangil Fungsi Hide Keyboard dengan tombol selesai (End)
    
    @IBAction func backBtn(_ sender: UIButton) {
        if let navController = self.navigationController {
          navController.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
