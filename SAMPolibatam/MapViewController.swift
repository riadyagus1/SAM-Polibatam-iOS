//
//  MapViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 22/02/21.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapViewController: UIViewController {

    @IBOutlet var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Posisi Camera
        mapView.camera = GMSCameraPosition.camera(withLatitude: 1.11881, longitude: 104.04844, zoom: 16.5)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        // Posisi Camera (End)
        
        //MARK: Circle Area Map
        let circleCenter = CLLocationCoordinate2D(latitude: 1.11881, longitude: 104.04844)
        let circle = GMSCircle(position: circleCenter, radius: 150)
        circle.map = mapView
        circle.fillColor = UIColor.green.withAlphaComponent(0.3)
        circle.strokeColor = .lightGray
        circle.strokeWidth = 3
        // Circle Area Map (End)
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        if let navController = self.navigationController {
          navController.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
