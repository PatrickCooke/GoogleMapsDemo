//
//  placepickerViewController.swift
//  GoogleMapsDemo
//
//  Created by Patrick Cooke on 11/24/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

import UIKit
import GooglePlacePicker

class placepickerViewController: UIViewController {

    var placePicker: GMSPlacePicker?
    
    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    let lat = 42.718378
    let lon = -83.416747
    
    // Add a UIButton in Interface Builder, and connect the action to this function.
    @IBAction func pickPlace(sender: UIButton) {
        let center = CLLocationCoordinate2DMake(lat,lon)
        let northEast = CLLocationCoordinate2DMake(center.latitude + 0.001, center.longitude + 0.001)
        let southWest = CLLocationCoordinate2DMake(center.latitude - 0.001, center.longitude - 0.001)
        let viewport = GMSCoordinateBounds(coordinate: northEast, coordinate: southWest)
        let config = GMSPlacePickerConfig(viewport: viewport)
        placePicker = GMSPlacePicker(config: config)
        
        placePicker?.pickPlace(callback: { (place, error) -> Void in
            
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            if let place = place {

                //let street = place.addressComponents["street"]
//                print(street)
                self.nameLabel.text = place.name
                self.addressLabel.text = place.formattedAddress!.components(separatedBy:", ").joined(separator:"\n")
                let addressArray = place.formattedAddress?.components(separatedBy: ", ")
                guard let streetAddress = addressArray?[0] else {
                return
                }
                print(streetAddress)
                
                guard let cityAddress = addressArray?[1] else {
                    return
                }
                print(cityAddress)
                
                guard let stateZipAddress = addressArray?[2] else {
                    return
                }
                let zipIndex = stateZipAddress.index(stateZipAddress.startIndex, offsetBy: 3)
                let zipAddress = stateZipAddress.substring(from: zipIndex)
                print(zipAddress)
                print("lat: \(place.coordinate.latitude)")
                print("lon: \(place.coordinate.longitude)")
                
            } else {
                self.nameLabel.text = "No place selected"
                self.addressLabel.text = ""
            }
        })
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
