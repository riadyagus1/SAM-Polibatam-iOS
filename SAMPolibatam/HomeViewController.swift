//
//  HomeViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 19/02/21.
//

import UIKit

class HomeViewController: UIViewController {
    

    @IBOutlet weak var absenmasuk: UIButton!
    @IBOutlet weak var absenkeluar: UIButton!
    
    @IBOutlet weak var tmpFoto: UIImageView!
    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lblPosisi: UILabel!
    
    @IBOutlet weak var lblTanggal: UILabel!
    @IBOutlet weak var lblLokasi: UILabel!
    @IBOutlet weak var lblJam: UILabel!
    @IBOutlet weak var lblKerjaLibur: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Start - membuat kotak menjadi melengkung
        absenmasuk.layer.cornerRadius = 8.0
        absenkeluar.layer.cornerRadius = 8.0
        //End - membuat kotak menjadi melengkung
        
        // Ambil data dari Login Screen - TextField
        let userDefault = UserDefaults.standard
            
        lblNama.text = userDefault.string(forKey: "name")
        lblNama.isUserInteractionEnabled = false
        
        lblPosisi.text = userDefault.string(forKey: "jabatan")
        lblPosisi.isUserInteractionEnabled = false
        // Ambil data dari Login Screen - TextField (End)
    
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
