//
//  mapViewController.swift
//  GoogleMapsDemo
//
//  Created by Patrick Cooke on 11/24/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

import UIKit
import  GoogleMaps

class mapViewController: UIViewController {

    @IBOutlet var mapView: GMSMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create a GMSCameraPosition that tells the map to display the
        let lat = 42.718378
        let lon = -83.416747
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 10.0)
        self.mapView.camera = camera
        self.mapView.isMyLocationEnabled = true
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marker.title = "Clarkston Starbucks"
        marker.snippet = "Download Speed is 33.35 mbps"
        marker.map = self.mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
