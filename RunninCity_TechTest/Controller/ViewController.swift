//
//  ViewController.swift
//  RunninCity_TechTest
//
//  Created by Giovanni Gaffé on 2021/5/20.
//

import UIKit
import CoreLocation
import MapKit

final class ViewController: UIViewController {
    
    // MARK: - Properties and outlets
    
    private let requestService = RequestService()
    @IBOutlet weak var mapView: MKMapView!
    
    let location: CLLocationCoordinate2D? = nil
    var currentLocation: CLLocation?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestService.request { result in
            switch result {
            case .success(let data):
                print("*\(data)")
                DispatchQueue.main.async {
                    self.navigationItem.title = data.city
                    guard let latitude = data.locations.first?.latitude else { return }
                    guard let longitude = data.locations.first?.longitude else { return }
                    let loadLocation = CLLocation(latitude: latitude, longitude: longitude)
                    
                    let regionRadius = 1000.0
                    let region = MKCoordinateRegion(center: loadLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
                    
                    self.mapView.setRegion(region, animated: true)
                    
                    let locations: [InterestingPoints] = data.locations.map { InterestingPoints(name: $0.name, longitude: $0.longitude, latitude: $0.latitude)}
                    
                    self.mapView.addAnnotations(locations)
                    
                    self.mapView.delegate = self
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

