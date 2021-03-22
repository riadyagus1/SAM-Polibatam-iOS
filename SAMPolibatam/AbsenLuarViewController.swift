//
//  AbsenLuarViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 22/03/21.
//

import UIKit

class AbsenLuarViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var list1: UITextField!
    @IBOutlet weak var list2: UITextField!
    @IBOutlet weak var list3: UITextField!
    @IBOutlet weak var list4: UITextField!
    @IBOutlet weak var list5: UITextField!
    @IBOutlet weak var textFieldCheck1: UITextField!
    @IBOutlet weak var textFieldCheck2: UITextField!
    @IBOutlet weak var textFieldCheck3: UITextField!
    @IBOutlet weak var textFieldCheck4: UITextField!
    @IBOutlet weak var textFieldCheck5: UITextField!
    @IBOutlet weak var checkbox1: UIButton!
    @IBOutlet weak var checkbox2: UIButton!
    @IBOutlet weak var checkbox3: UIButton!
    @IBOutlet weak var checkbox4: UIButton!
    @IBOutlet weak var checkbox5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        list1.isUserInteractionEnabled = false
        list1.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        
        
        textFieldCheck2.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        textFieldCheck2.isUserInteractionEnabled = false
        checkbox2.isUserInteractionEnabled = false
        list2.isUserInteractionEnabled = false
        list2.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        
        
        textFieldCheck3.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        textFieldCheck3.isUserInteractionEnabled = false
        checkbox3.isUserInteractionEnabled = false
        list3.isUserInteractionEnabled = false
        list3.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        
        textFieldCheck4.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        textFieldCheck4.isUserInteractionEnabled = false
        checkbox4.isUserInteractionEnabled = false
        list4.isUserInteractionEnabled = false
        list4.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        
        textFieldCheck5.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        textFieldCheck5.isUserInteractionEnabled = false
        checkbox5.isUserInteractionEnabled = false
        list5.isUserInteractionEnabled = false
        list5.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)

        //MARK: Memangil Fungsi Hide Keyboard Tap Anywhere
        self.HideKeyboard()
        //Memangil Fungsi Hide Keyboard Tap Anywhere(End)
        
        
        //MARK: Memangil Fungsi Hide Keyboard dengan tombol selesai
        list1.delegate = self
        list1.returnKeyType = .done
        self.view.addSubview(list1)
        
        list2.delegate = self
        list2.returnKeyType = .done
        self.view.addSubview(list2)
        
        list3.delegate = self
        list3.returnKeyType = .done
        self.view.addSubview(list3)
        
        list4.delegate = self
        list4.returnKeyType = .done
        self.view.addSubview(list4)
        
        list5.delegate = self
        list5.returnKeyType = .done
        self.view.addSubview(list5)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    //Memangil Fungsi Hide Keyboard dengan tombol selesai (End)
    
    @IBAction func checklist1(_ sender: UIButton) {
        if textFieldCheck1.text == "" {
            textFieldCheck1.text = "✓"
            list1.isUserInteractionEnabled = true
            list1.backgroundColor = .white
            checkbox2.isUserInteractionEnabled = true
            textFieldCheck2.backgroundColor = .white
        } else {
            textFieldCheck1.text = ""
            list1.isUserInteractionEnabled = false
            list1.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
            checkbox2.isUserInteractionEnabled = false
            textFieldCheck2.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        }
    }
    @IBAction func checklist2(_ sender: UIButton) {
        if textFieldCheck2.text == "" {
            textFieldCheck2.text = "✓"
            list2.isUserInteractionEnabled = true
            list2.backgroundColor = .white
            checkbox3.isUserInteractionEnabled = true
            textFieldCheck3.backgroundColor = .white
        } else {
            textFieldCheck2.text = ""
            list2.isUserInteractionEnabled = false
            list2.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
            checkbox3.isUserInteractionEnabled = false
            textFieldCheck3.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        }
    }
    @IBAction func checklist3(_ sender: UIButton) {
        if textFieldCheck3.text == "" {
            textFieldCheck3.text = "✓"
            list3.isUserInteractionEnabled = true
            list3.backgroundColor = .white
            checkbox4.isUserInteractionEnabled = true
            textFieldCheck4.backgroundColor = .white
        } else {
            textFieldCheck3.text = ""
            list3.isUserInteractionEnabled = false
            list3.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
            checkbox4.isUserInteractionEnabled = false
            textFieldCheck4.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        }
    }
    @IBAction func checklist4(_ sender: UIButton) {
        if textFieldCheck4.text == "" {
            textFieldCheck4.text = "✓"
            list4.isUserInteractionEnabled = true
            list4.backgroundColor = .white
            checkbox5.isUserInteractionEnabled = true
            textFieldCheck5.backgroundColor = .white
        } else {
            textFieldCheck4.text = ""
            list4.isUserInteractionEnabled = false
            list4.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
            checkbox5.isUserInteractionEnabled = false
            textFieldCheck5.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        }
    }
    @IBAction func checklist5(_ sender: UIButton) {
        if textFieldCheck5.text == "" {
            textFieldCheck5.text = "✓"
            list5.isUserInteractionEnabled = true
            list5.backgroundColor = .white
        } else {
            textFieldCheck5.text = ""
            list5.isUserInteractionEnabled = false
            list5.backgroundColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1.0)
        }
    }
    
    //MARK: Layar / Text Field Naik saat Muncul Keyboard (2)
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
    // Layar / Text Field Naik saat Muncul Keyboard (2 end)
    
    //MARK: Back Button
    @IBAction func backButton(_ sender: UIButton) {
        if let navController = self.navigationController {
          navController.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    // Back Button
    
    //MARK: Confirm Absen Button
    @IBAction func submitButton(_ sender: UIButton) {
        if list1.text == ""{
            let dialogMessage = UIAlertController(title: "Absen Gagal", message: "\n List kegiatan tidak boleh kosong! Silahkan isi list kegiatan terlebih dahulu!", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "Kembali", style: .default, handler: { (action) -> Void in
                print("Field kosong button Kembali tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)
            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
        } else {
            let dialogMessage = UIAlertController(title: "Absen Berhasil", message: "\n Absen telah berhasil disimpan. Terima kasih", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "Selesai", style: .default, handler: { (action) -> Void in
                print("Izin Berhasil Tapped")
                let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let newViewController = storyBoard.instantiateViewController(withIdentifier: "TabbarViewController")
                newViewController.modalPresentationStyle = .fullScreen
                self.show(newViewController, sender: self)
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)
            
            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
    
}
