//
//  ConfirmViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 10/03/21.
//

import UIKit

class ConfirmViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = selectedImage
    }
    
    @IBAction func confirmBtn(_ sender: UIButton) {
        let dialogMessage = UIAlertController(title: "Absen Berhasil", message: "\n Absen telah berhasil disimpan. Terima kasih", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "Selesai", style: .default, handler: { (action) -> Void in
            print("Absen Berhasil Tapped")
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
