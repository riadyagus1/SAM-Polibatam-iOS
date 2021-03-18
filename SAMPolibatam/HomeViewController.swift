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
        
        //MARK: Membuat kotak menjadi melengkung
        absenmasuk.layer.cornerRadius = 8.0
        absenkeluar.layer.cornerRadius = 8.0
        //Membuat kotak menjadi melengkung (End)
        
        //MARK: Ambil data dari Login Screen - TextField
        let userDefault = UserDefaults.standard
            
        lblNama.text = userDefault.string(forKey: "name")
        lblNama.isUserInteractionEnabled = false
        lblNama.adjustsFontSizeToFitWidth = true
        
        lblPosisi.text = userDefault.string(forKey: "jabatan")
        lblPosisi.isUserInteractionEnabled = false
        // Ambil data dari Login Screen - TextField (End)
        
        //MARK: Buat Foto Profile Bulat
        selectedImage.makePhotoRounded()

        //MARK: Current Location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Current Location (End)
        
        //MARK: Pass Foto Profile
        selectedImage.image = image
        //Pass Foto Profile (End)
        
        //MARK: Call Data Label Jam Kerja
        lblTanggal.text = getFullDate()
        lblJam.text = getDay()
        // Call Data Label Jam Kerja (End)
        
        //MARK: Call Absen Keluar Disable
        AbsenKeluarDisable()
        // Absen Keluar Disable (End)
    }
    
    //MARK: Data Label Jam Kerja
    //Tanggal Hari Ini
    func getFullDate() -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale.init(identifier: "id")
        formatter.dateStyle = .full
        let stringDate = formatter.string(from: Date())
        lblTanggal.text = stringDate
        return "\(stringDate)"
    }
    
    //Jam Kerja Menurut Hari
    func getDay() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.setLocalizedDateFormatFromTemplate("EEE")
    let day = dateFormatter.string(from: Date())
    print(dateFormatter.string(from: Date()))
    
        if(day=="Sat" || day=="Sun") {
            lblKerjaLibur.text = "Libur"
        } else {
            lblKerjaLibur.text = "Jam Kerja"
        }
        return "08.00 - 17.00"
    }
    // Data Label Jam Kerja(End)
    
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
    
    //MARK: Absen Keluar Disable
    func AbsenKeluarDisable() {
        if absenmasuk.currentTitle == "Absen Masuk" {
            absenkeluar.isEnabled = false
            absenkeluar.backgroundColor = .gray
        } else {
            absenkeluar.isEnabled = true
        }
    }
    // Absen Keluar Disable
    
    //MARK: Absen Keluar Disable
    func AbsenMasukDisable() {
        if absenmasuk.currentTitle == "Time" {
            absenmasuk.isEnabled = false
            absenmasuk.backgroundColor = .gray
        } else {
            absenmasuk.isEnabled = true
        }
    }
    // Absen Keluar Disable
    
    //MARK: Absen Keluar Disable
    func AbsenMasukKeluarDisable() {
        if absenmasuk.currentTitle == "Time" && absenkeluar.currentTitle == "" {
            absenmasuk.isEnabled = false
            absenmasuk.backgroundColor = .gray
            absenkeluar.isEnabled = false
            absenkeluar.backgroundColor = .gray
        } else {
            print("")
        }
    }
    // Absen Keluar Disable
    
}
