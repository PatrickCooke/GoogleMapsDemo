//
//  placesViewController.swift
//  GoogleMapsDemo
//
//  Created by Patrick Cooke on 11/24/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

import UIKit
import GooglePlaces

class placesViewController: UIViewController {
    
    var placesClient: GMSPlacesClient?
    
    // Add a pair of UILabels in Interface Builder, and connect the outlets to these variables.
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesClient = GMSPlacesClient.shared()
    }
    
    // Add a UIButton in Interface Builder, and connect the action to this function.
    @IBAction func getCurrentPlace(sender: UIButton) {
        placesClient?.currentPlace(callback: {
            (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                return
            }
            
            self.nameLabel.text = "No current place"
            self.addressLabel.text = ""
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.nameLabel.text = place.name
                    let address = place.formattedAddress
//                    var lat = place.coordinate.latitude
//                    var lon = place.coordinate.longitude
                    self.addressLabel.text = address?.components(separatedBy: ", ").joined(separator: "\n")
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
