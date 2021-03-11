//
//  HomeViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 19/02/21.
//

import UIKit
import CoreLocation

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    

    @IBOutlet weak var absenmasuk: UIButton!
    @IBOutlet weak var absenkeluar: UIButton!
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lblPosisi: UILabel!
    
    @IBOutlet weak var lblTanggal: UILabel!
    @IBOutlet weak var lblLokasi: UILabel!
    @IBOutlet weak var lblJam: UILabel!
    @IBOutlet weak var lblKerjaLibur: UILabel!
    
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Start - membuat kotak menjadi melengkung
        absenmasuk.layer.cornerRadius = 8.0
        absenkeluar.layer.cornerRadius = 8.0
        //End - membuat kotak menjadi melengkung
        
        //MARK: Ambil data dari Login Screen - TextField
        let userDefault = UserDefaults.standard
            
        lblNama.text = userDefault.string(forKey: "name")
        lblNama.isUserInteractionEnabled = false
        lblNama.adjustsFontSizeToFitWidth = true
        
        lblPosisi.text = userDefault.string(forKey: "jabatan")
        lblPosisi.isUserInteractionEnabled = false
        // Ambil data dari Login Screen - TextField (End)
        
        // Buat Foto Profile Bulat
        selectedImage.makePhotoRounded()

        // Current Location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Current Location (End)
        
        //Pass Foto Profile
        selectedImage.image = image
        //Pass Foto Profile (End)
    }
    
    //MARK: Current Location
    let locationManager = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                return
            }
            
            if (placemarks?.count)! > 0 {
                let pm = placemarks?[0]
                self.displayLocationInfo(pm)
            } else {
                print("Problem with the data received from geocoder")
            }
        })
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            let name = (containsPlacemark.name != nil) ? containsPlacemark.name : ""
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            lblLokasi.text = "\(name ?? "name"), \(locality ?? "locality"), \(administrativeArea ?? "administrativeArea"), \(country ?? "country")"
        }

    }
    
 
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
          print("Error while updating location " + error.localizedDescription)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // Current Location (End)
}
