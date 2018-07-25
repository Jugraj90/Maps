//
//  goglMapRoute.swift
//  Maps
//
//  Created by Developer ST on 20/06/18.
//  Copyright © 2018 Developer ST. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class goglMapRoute: UIViewController , CLLocationManagerDelegate{
    
   
    let locationManager = CLLocationManager()

    var mapView:GMSMapView?
    
    @IBOutlet weak var map: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let camera = GMSCameraPosition.camera(withLatitude: 30.7333, longitude: 76.7794, zoom: 10.0)
        let mapView = GMSMapView.map(withFrame: self.map.frame, camera: camera)
        self.view.addSubview(mapView)
      
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
    

        
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 30.7333, longitude: 76.7794)
        marker.title = "Delhi"
        marker.snippet = "India’s capital"
        marker.map = mapView
        
       
    }
    
    
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
