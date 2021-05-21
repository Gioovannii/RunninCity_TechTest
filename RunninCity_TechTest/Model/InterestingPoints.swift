//
//  Annotation.swift
//  RunninCity_TechTest
//
//  Created by Giovanni Gaffé on 2021/5/21.
//

import Foundation
import MapKit

class InterestingPoints: NSObject {

    let name: String?
    let location: CLLocation
     
    init(name: String?, longitude: Double, latitude: Double) {
        self.name = name
        self.location = CLLocation(latitude: latitude, longitude: longitude)
        super.init()
    }
}

extension InterestingPoints: MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D {
        get {
            return location.coordinate
        }
    }
    
    var subtitle: String? {
        get {
            return name
        }
    }
}
