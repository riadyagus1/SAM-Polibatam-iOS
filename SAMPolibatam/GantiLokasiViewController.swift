//
//  GantiLokasiViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 10/03/21.
//

import UIKit
import GoogleMaps
import GooglePlaces

class GantiLokasiViewController: UIViewController, GMSAutocompleteResultsViewControllerDelegate {

    @IBOutlet var mapView: GMSMapView!
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Location Manager
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        //MARK: Posisi Camera
        mapView.camera =  GMSCameraPosition.camera(withLatitude: 1.0719559465415636, longitude: 104.01874326930952, zoom: 11.0)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        // Posisi Camera (End)
        
        //MARK: Search
        setupSearchController()
        resultsViewController?.delegate = self
        // Search (End)
    }
    
    //MARK: Search
    func setupSearchController() {
        resultsViewController = GMSAutocompleteResultsViewController()
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultsUpdater = resultsViewController

        let searchBar = searchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        navigationItem.titleView = searchController?.searchBar
        definesPresentationContext = true
        searchController?.hidesNavigationBarDuringPresentation = false
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        
        searchController?.isActive = false
        
        mapView.animate(toLocation: place.coordinate)
        let marker = GMSMarker(position: place.coordinate)
        marker.title = place.name
        marker.map = mapView
        mapView.camera = GMSCameraPosition.camera(withTarget: place.coordinate, zoom: 17)
    }
       
       func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
           print("Error: \(error.localizedDescription)")
       }
    // Search (End)
    
    private let locationManager = CLLocationManager()
    
    //MARK: Back Button
    @IBAction func backBtn(_ sender: UIButton) {
        if let navController = self.navigationController {
          navController.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    // Back Button (End)
    
    //MARK: Confirm Button
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
    // Confirm Button (End)
    
}

//MARK: Zoom To Current Location
extension GantiLokasiViewController: CLLocationManagerDelegate {
  func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

    guard status == .authorizedWhenInUse else {
      return
    }

    locationManager.startUpdatingLocation()

    mapView.isMyLocationEnabled = true
    mapView.settings.myLocationButton = true
  }

  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.first else {
      return
    }

    mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 17, bearing: 0, viewingAngle: 0)
      
    locationManager.stopUpdatingLocation()
  }
}
// Zoom To Current Location (End)

