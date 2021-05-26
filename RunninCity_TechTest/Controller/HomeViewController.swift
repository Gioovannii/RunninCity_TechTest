//
//  ViewController.swift
//  RunninCity_TechTest
//
//  Created by Giovanni Gaffé on 2021/5/20.
//

import UIKit
import MapKit

final class HomeViewController: UIViewController {
    
    // MARK: - Properties and outlets
    
    private let requestService = RequestService()
    @IBOutlet weak private var mapView: MKMapView!
        
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchInterestingPoints()
    }
    
    /// Network Call
    private func fetchInterestingPoints() {
        requestService.request { result in
            switch result {
            case .success(let data):
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
                self.presentAlert(title: "Error", message: error.description)
            }
        }
    }
}

// MARK: - MKMApViewDelegate

extension HomeViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "InterestingPoints") as? MKMarkerAnnotationView
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "InterestingPoints")
        } else {
            annotationView?.annotation = annotation
        }
        annotationView?.glyphText = "🏛"
        annotationView?.markerTintColor = .black
        return annotationView
    }
}
