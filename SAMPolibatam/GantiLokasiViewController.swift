//
//  GantiLokasiViewController.swift
//  SAMPolibatam
//
//  Created by Agus Riady on 10/03/21.
//

import UIKit
import MapKit
import GoogleMaps
import GooglePlaces

class GantiLokasiViewController: UIViewController, GMSAutocompleteResultsViewControllerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSearchController()
        resultsViewController?.delegate = self
        
        //MARK: Posisi Camera
        let camera = GMSCameraPosition.camera(withLatitude: 1.0719559465415636, longitude: 104.01874326930952, zoom: 11.0)
                let mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
                self.view.addSubview(mapView)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        mapView.settings.compassButton = true
        // Posisi Camera (End)
    }

    
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
    //MARK: Confirm Button
    
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
        // 1
        searchController?.isActive = false

        // 2
        mapView.removeAnnotations(mapView.annotations)

        // 3
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: place.coordinate, span: span)
        mapView.setRegion(region, animated: true)

        // 4
        let annotation = MKPointAnnotation()
        annotation.coordinate = place.coordinate
        annotation.title = place.name
        annotation.subtitle = place.formattedAddress
        mapView.addAnnotation(annotation)
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        print("Error: \(error.localizedDescription)")
    }

}

extension ViewController: GMSAutocompleteResultsViewControllerDelegate {
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didAutocompleteWith place: GMSPlace) {
        
    }
    
    func resultsController(_ resultsController: GMSAutocompleteResultsViewController, didFailAutocompleteWithError error: Error) {
        
    }
}
