//
//  HomeViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 19/02/21.
//

import UIKit
import CoreLocation
import GooglePlaces

class HomeViewController: UIViewController, CLLocationManagerDelegate {
    

    @IBOutlet weak var absenmasuk: UIButton!
    @IBOutlet weak var absenkeluar: UIButton!
    
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var lblNama: UILabel!
    @IBOutlet weak var lblPosisi: UILabel!
    
    @IBOutlet weak var lblTanggal: UILabel!
    @IBOutlet weak var lblTempat: UILabel!
    @IBOutlet weak var lblAlamat: UILabel!
    @IBOutlet weak var lblJam: UILabel!
    @IBOutlet weak var lblKerjaLibur: UILabel!
    
    var imageFotoPic = UIImage()
    var tanggal:String?
    
    //MARK: Current Location Declare
    private var placesClient: GMSPlacesClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        placesClient = GMSPlacesClient.shared()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    // Current Location (End)
        
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
        lblTempat.adjustsFontSizeToFitWidth = true
        lblAlamat.adjustsFontSizeToFitWidth = true
        // Ambil data dari Login Screen - TextField (End)
        
        //MARK: Buat Foto Profile Bulat
        selectedImage.makePhotoRounded()
       
        //MARK: Pass Foto Profile
        //self.selectedImage.image = imageFotoPic
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
            self.tanggal = stringDate
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
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus)
        {
        let placeFields: GMSPlaceField = [.name, .formattedAddress]
        placesClient.findPlaceLikelihoodsFromCurrentLocation(withPlaceFields: placeFields) { [weak self] (placeLikelihoods, error) in
          guard let strongSelf = self else {
            return
          }

          guard error == nil else {
            print("Current place error: \(error?.localizedDescription ?? "")")
            return
          }

          guard let place = placeLikelihoods?.first?.place else {
            strongSelf.lblTempat.text = "No current place"
            return
          }

            strongSelf.lblTempat.text = place.name
            strongSelf.lblAlamat.text = place.formattedAddress
        }
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
