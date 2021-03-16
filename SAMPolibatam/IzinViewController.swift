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
        
        //MARK: Memangil Fungsi Hide Keyboard Tap Anywhere
        self.HideKeyboard()
        //Memangil Fungsi Hide Keyboard Tap Anywhere(End)
        
        
        //MARK: Memangil Fungsi Hide Keyboard dengan tombol selesai
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
    
    //MARK: Back Button
    @IBAction func backBtn(_ sender: UIButton) {
        if let navController = self.navigationController {
          navController.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    // Back Button
    
    //MARK: Confirm Izin Button
    @IBAction func confirmButton(_ sender: UIButton) {
        if (izinBox.text==""){
            let dialogMessage = UIAlertController(title: "Pengajuan Izin Gagal", message: "\n Alasan izin tidak boleh kosong! Silahkan isi alasan izin terlebih dahulu!", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "Kembali", style: .default, handler: { (action) -> Void in
                print("Field kosong button Kembali tapped")
             })
            
            //Add OK button to a dialog message
            dialogMessage.addAction(ok)
            // Present Alert to
            self.present(dialogMessage, animated: true, completion: nil)
        } else {
            let dialogMessage = UIAlertController(title: "Pengajuan Izin Berhasil", message: "\n Pengajuan izin telah berhasil disimpan. Izin anda akan segera diproses. Terima kasih", preferredStyle: .alert)
            
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
    
    // Confirm Izin Button
}
