//
//  GantiLokasiViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 10/03/21.
//

import UIKit
import MapKit

class GantiLokasiViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        if let navController = self.navigationController {
          navController.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func gantiLokasi(_ sender: UIButton) {
        let dialogMessage = UIAlertController(title: "Ganti Lokasi Rumah Berhasil", message: "\n Pergantian lokasi rumah berhasil dan lokasi rumah yang baru telah disimpan.", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "Selesai", style: .default, handler: { (action) -> Void in
            print("Ganti Lokasi Rumah Success")
            if let navController = self.navigationController {
              navController.popViewController(animated: true)
            }
            self.dismiss(animated: true, completion: nil)
         })
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        
        // Present Alert to
        self.present(dialogMessage, animated: true, completion: nil)
    }
    

}
