//
//  BankViewController.swift
//  SmartMoney
//
//  Created by Ariz Chang on 11/1/20.
//  Copyright © 2020 Ariz Chang. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class BankViewController: UIViewController, CLLocationManagerDelegate {

    var manager:CLLocationManager!
    var lat:Double?
    var long:Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        lat = userLocation.coordinate.latitude
        long = userLocation.coordinate.longitude
        print("\(lat!), \(long!)")
    }
}
