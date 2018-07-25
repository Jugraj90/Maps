//
//  polyLine.swift
//  Maps
//
//  Created by Developer ST on 21/06/18.
//  Copyright © 2018 Developer ST. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import Alamofire
import SwiftyJSON

class polyLine: UIViewController,GMSMapViewDelegate {
    
    var activityIndicator = UIActivityIndicatorView()
  
    var mapView: GMSMapView!
    
    var currentLocation = CLLocationCoordinate2D(latitude: 30.7333, longitude: 76.7794)
    
    var destinationLoc = CLLocationCoordinate2D(latitude: 30.6425, longitude: 76.8173)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
  
        let cameraPositionCoordinates = CLLocationCoordinate2D(latitude: 30.7333, longitude: 76.7794)
        let cameraPosition = GMSCameraPosition.camera(withTarget: cameraPositionCoordinates, zoom: 12)

        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: cameraPosition)
        mapView.isMyLocationEnabled = true
       self.view = mapView
        let origin = "\(currentLocation.latitude),\(currentLocation.longitude)"
        let destination = "\(destinationLoc.latitude),\(destinationLoc.longitude)"
        
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=driving&key=API_KEY"
        
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            if(error != nil){
                print("error")
            }else{
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    let routes = json["routes"] as! NSArray
                    self.mapView.clear()
                    
                    OperationQueue.main.addOperation({
                        for route in routes
                        {
                            let routeOverviewPolyline:NSDictionary = (route as! NSDictionary).value(forKey: "overview_polyline") as! NSDictionary
                            let points = routeOverviewPolyline.object(forKey: "points")
                            let path = GMSPath.init(fromEncodedPath: points! as! String)
                            let polyline = GMSPolyline.init(path: path)
                            polyline.strokeWidth = 3
                            
                            let bounds = GMSCoordinateBounds(path: path!)
                            self.mapView!.animate(with: GMSCameraUpdate.fit(bounds, withPadding: 30.0))
                            
                            polyline.map = self.mapView
                            
                        }
                    })
                }catch let error as NSError{
                    print("error:\(error)")
                }
            }
        }).resume()
      
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

