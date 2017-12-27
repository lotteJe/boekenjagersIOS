//
//  BoekViewController.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

import MapKit
import Contacts

class BoekViewController: UIViewController {
    
    @IBOutlet weak var locatieMap: MKMapView!
    @IBOutlet weak var gevondenButton: UIBarButtonItem!
    
    @IBAction func buttonNavigeer(_ sender: Any) {
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapitem = MKMapItem(placemark: placemark)
        let options = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        mapitem.openInMaps(launchOptions: options)
    }
    @IBOutlet weak var opmerkingLabel: UITextView!
    
    @IBAction func gevonden(){
        performSegue(withIdentifier: "didFoundBoek", sender: self)
    }
    
    var boek: Boek!
    var coordinates:CLLocationCoordinate2D!
    
    override func viewDidLoad() {
        
        title = boek.titel
        self.opmerkingLabel.text = self.boek.opmerking
        
        let geocoder = CLGeocoder()
        let nummerStraat = (boek.locatie?.nummer)! + " " + (boek.locatie?.straat)! + ", "
        let gemeenteLand = (boek.locatie?.gemeente)! + ", BE " + String(describing: boek.locatie?.postcode)
        let address = nummerStraat + gemeenteLand
        geocoder.geocodeAddressString(address, completionHandler: {(placemarks, error) -> Void in
            if((error) != nil){
                print("Error", error ?? "")
            }
            if let placemark = placemarks?.first {
                self.coordinates = placemark.location!.coordinate
                let annotation = MKPointAnnotation()
                annotation.coordinate = self.coordinates
                
                annotation.title = self.boek.titel
                annotation.subtitle = self.boek.auteur
                
                //Toevoegen aan map
                self.locatieMap.addAnnotation(annotation)
                
                //opties voor map
                let span = MKCoordinateSpanMake(0.002, 0.002)
                let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                self.locatieMap.setRegion(region, animated: true)
            }
        })
    }
}
