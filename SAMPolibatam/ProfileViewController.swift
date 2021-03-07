//
//  ProfileViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 19/02/21.
//

import UIKit

extension UIImageView {
    func makePhotoRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet var imageViewPic: UIImageView!
    @IBOutlet weak var namaUser: UILabel!
    @IBOutlet weak var posisiNIP: UILabel!
    @IBOutlet weak var kotakHadir: UIImageView!
    @IBOutlet weak var kotakIzin: UIImageView!
    @IBOutlet weak var kotakAlpha: UIImageView!
    @IBOutlet weak var notifSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Start - membuat kotak menjadi melengkung
        kotakHadir.layer.cornerRadius = 8.0
        kotakIzin.layer.cornerRadius = 8.0
        kotakAlpha.layer.cornerRadius = 8.0
        imageViewPic.makePhotoRounded()
        //End - membuat kotak menjadi melengkung
        
        //MARK: Ambil data dari Login Screen
        let userDefault = UserDefaults.standard
            
        namaUser.text = userDefault.string(forKey: "name")
        namaUser.isUserInteractionEnabled = false
        
        posisiNIP.text = "\(userDefault.string(forKey: "nim") ?? "nim") / \(userDefault.string(forKey: "jabatan") ?? "Jabatan")"
        posisiNIP.isUserInteractionEnabled = false
        // Ambil data dari Login Screen(End)
        
        // Ganti Foto Profil
        imagePicker.delegate = self
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = true
        // Ganti Foto Profil
    }
    
    //MARK: Log Out
    @IBAction func logOutButton(_ sender: Any) {
        // Create new Alert
        let dialogMessage = UIAlertController(title: "Log Out Berhasil", message: "\n Terima kasih sudah menggunakan aplikasi kami", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("Log Out Success")
            let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "LoginScreen") as! ViewController
            newViewController.modalPresentationStyle = .fullScreen
            self.show(newViewController, sender: self)
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
    // Log Out (End)
    

    //MARK: Ganti Foto Profil
    var imagePicker = UIImagePickerController()
    
    @IBAction func buttonHandlerGallery(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                    print("Button capture")

                    imagePicker.delegate = self
                    imagePicker.sourceType = .savedPhotosAlbum
                    imagePicker.allowsEditing = true

                    present(imagePicker, animated: true, completion: nil)
                }
    }
    
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
           imageViewPic.image = info[.editedImage] as? UIImage
           dismiss(animated: true)
       }
    // Ganti Foto Profil (end)
}
