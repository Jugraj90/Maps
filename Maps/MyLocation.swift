//
//  MyLocation.swift
//  Maps
//
//  Created by Developer ST on 19/06/18.
//  Copyright © 2018 Developer ST. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
import GoogleMaps

class MyLocation: UIViewController , CLLocationManagerDelegate{

    // MARK:-
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       //  Do any additional setup after loading the view.
        
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]

        let span:MKCoordinateSpan = MKCoordinateSpanMake(30.44, 76.47)

        let  MyLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)

        let region:MKCoordinateRegion = MKCoordinateRegionMake(MyLocation, span)

        mapView.setRegion(region, animated: true)

        self.mapView.showsUserLocation = true

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   

}
