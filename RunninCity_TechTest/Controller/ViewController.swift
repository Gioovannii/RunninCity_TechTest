//
//  ViewController.swift
//  RunninCity_TechTest
//
//  Created by Giovanni Gaffé on 2021/5/20.
//

import UIKit
import CoreLocation

final class ViewController: UIViewController {
    
    // MARK: - Properties and outlets

    private let requestService = RequestService()
    @IBOutlet var mapView: UIView!
    
    let location: CLLocationCoordinate2D? = nil
    var currentLocation: CLLocation?
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

