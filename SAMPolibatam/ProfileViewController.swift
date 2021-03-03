//
//  ProfileViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 19/02/21.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var fotoProfile: UIImageView!
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
        //End - membuat kotak menjadi melengkung
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
