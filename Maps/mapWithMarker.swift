//
//  ViewController2.swift
//  Maps
//
//  Created by Developer ST on 20/06/18.
//  Copyright © 2018 Developer ST. All rights reserved.
//

import UIKit

import MapKit

class ViewController2: UIViewController {
    
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    // kljhnlknbhp09;olbn
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    

    // MARK:- IBAction
    @IBAction func showMyLocation(_ sender: Any) {
        
        let latitude:CLLocationDegrees = 30.3782//39.048825
        
        let longitude:CLLocationDegrees = 76.7767//-120.981227
        
        let regionDistance:CLLocationDistance = 1000
        
        let coordinates =  CLLocationCoordinate2DMake(latitude, longitude)
        
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates,regionDistance,regionDistance)
        
        let option = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate:regionSpan.center),MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan:regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: coordinates)
        
        let mapItem = MKMapItem(placemark: placeMark)
        
        mapItem.name = "js"
        
        mapItem.openInMaps(launchOptions: option)
        
        
        
    }
    
    
    

   


}
