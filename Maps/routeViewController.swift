//
//  routeViewController.swift
//  Maps
//
//  Created by Developer ST on 21/06/18.
//  Copyright © 2018 Developer ST. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import Alamofire

class routeViewController: UIViewController,GMSMapViewDelegate {
    
    
   var mapView: GMSMapView!
    var activityIndicator = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        let cameraPositionCoordinates = CLLocationCoordinate2D(latitude: 30.7333, longitude: 76.7794)
        let cameraPosition = GMSCameraPosition.camera(withTarget: cameraPositionCoordinates, zoom: 12)

        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: cameraPosition)
        mapView.isMyLocationEnabled = true
        self.view = mapView
        
        guard let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?" +
            "origin=\(30.7333),\(76.7794)&destination=\(30.3782),\(76.7767)&" +
            "key=AIzaSyAaUfKUYj-b4mLArHXTgLa-aNpHOeBWo9E") else {
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data,response,error) in
            if let reponse = response {
                print(response ?? "no value")
            }
            if let data = data {
                print(data)
                do
                {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]{
                    print(json)
                    
//                    let routesArray = (json["routes"] as? Array) ?? []
//
//                    let routes = (routesArray.first as? Dictionary<String, AnyObject>) ?? [:]

//                 let routes = json["routes"].arrayValue
//
//                    for route in routes
//                    {
//                        let routeOverviewPolyline = route["overview_polyline"].dictionary
//                        let points = routeOverviewPolyline?["points"]?.stringValue
//                        let path = GMSPath.init(fromEncodedPath: points!)
//                        let polyline = GMSPolyline.init(path: path)
//                        polyline.map = self.mapView
//                    }
                    
                }
                }
                catch {
                    print(error)
                }
            }
        }
        .resume()
        //  create custum marker
        let marker = GMSMarker(position: cameraPositionCoordinates)
        
        // I have taken a pin image which is a custom image
        let markerImage = UIImage(named: "js.jpeg")!
        
        //creating a marker view
        let markerView = UIImageView(image: markerImage)
        
        //changing the tint color of the image
        // markerView.tintColor = UIColor.red
        
        marker.position = CLLocationCoordinate2D(latitude: 30.7333, longitude: 76.7794)
        
        marker.iconView = markerView
        
        marker.title = "Chandigarh"    //"\(marker)"
        
        marker.snippet = "India"
        
        marker.map = mapView
        
        mapView.selectedMarker = marker
        
        // create custum marker 2
        let marker2 = GMSMarker()
        
        // I have taken a pin image which is a custom image
        let markerImage2 = UIImage(named: "js.jpeg")!
        
        //creating a marker view
        let markerView2 = UIImageView(image: markerImage2)
        
        marker2.position = CLLocationCoordinate2D(latitude: 30.6425, longitude: 76.8173)
        
        marker2.iconView = markerView2
        
        marker2.title = "Zirakpur"
        
        marker2.snippet = "India"
        
        marker2.map = mapView
        
        //comment this line if you don't wish to put a callout bubble
        
        //// mapView.selectedMarker = marker2
        

        
    }
        

    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
