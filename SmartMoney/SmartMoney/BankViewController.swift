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
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0]
        lat = userLocation.coordinate.latitude
        long = userLocation.coordinate.longitude
        print("\(lat!), \(long!)")
    }
 */
    
    
    @IBAction func search(_ sender: UIButton) {
        //location handling
        let geoCoder = CLGeocoder();
        let addressString = self.cityField.text!
        CLGeocoder().geocodeAddressString(addressString, completionHandler:
            {(placemarks, error) in
                
                if error != nil {
                    print("Geocode failed: \(error!.localizedDescription)")
                } else if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    let location = placemark.location
                    let coords = location!.coordinate
                    print(location)
                   
                    let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                    self.map.setRegion(region, animated: true)
                    let ani = MKPointAnnotation()
                    ani.coordinate = placemark.location!.coordinate
                    ani.title = placemark.locality
                    ani.subtitle = placemark.subLocality
                    
                    self.map.addAnnotation(ani)
                }
        })
    }
    
    
    @IBAction func findBanks(_ sender: UIButton) {
        // searching for banks
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = "banks"
        request.region = self.map.region
        let search = MKLocalSearch(request: request)
        
        search.start { response, _ in
            guard let response = response else {
                return
            }
            print( response.mapItems )
            var matchingItems:[MKMapItem] = []
            matchingItems = response.mapItems
            for i in 1...matchingItems.count - 1
            {
                    let place = matchingItems[i].placemark
                     print(place.location?.coordinate.latitude)
                     print(place.location?.coordinate.longitude)
                     print(place.name)
                let ani = MKPointAnnotation()
                ani.coordinate = place.location?.coordinate as! CLLocationCoordinate2D
                ani.title = place.name
                ani.subtitle = place.subLocality
                self.map.addAnnotation(ani)
                
            }
        }
    }
}
