//
//  MapViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 22/02/21.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    var coordinateNow:CLLocation?
    let coordinatePoltek = CLLocation(latitude: 1.118383, longitude: 104.04846)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Posisi Camera
        mapView.camera = GMSCameraPosition.camera(withLatitude: 1.118383, longitude: 104.04846, zoom: 16.5)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        // Posisi Camera (End)
        
        //MARK: Circle Area Map
        let circleCenter = CLLocationCoordinate2D(latitude: 1.118383, longitude: 104.04846)
        let circle = GMSCircle(position: circleCenter, radius: 200)
        circle.map = mapView
        circle.fillColor = UIColor.green.withAlphaComponent(0.3)
        circle.strokeColor = .lightGray
        circle.strokeWidth = 3
        // Circle Area Map (End)
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK: Get Current Coordinate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.coordinateNow = CLLocation(latitude: locValue.latitude, longitude: locValue.longitude)
    }
    // Get Current Coordinate (End)
    
    //MARK: Back Button
    @IBAction func backBtn(_ sender: UIButton) {
        if let navController = self.navigationController {
          navController.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    // Back Button (End)
    
    //MARK: Verifikasi Jarak
    @IBAction func verificationButton(_ sender: UIButton) {
        let distanceInMeters = coordinateNow?.distance(from: coordinatePoltek)
        
        if distanceInMeters! <= 200{
            let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "ConfirmScreen")
            newViewController.modalPresentationStyle = .fullScreen
            self.show(newViewController, sender: self)
        } else {
            let storyBoard:UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "KerjaDiluarScreen")
            newViewController.modalPresentationStyle = .fullScreen
            self.show(newViewController, sender: self)
        }
    }
    // Verifikasi Jarak (End)
}
