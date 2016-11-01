//
//  MapsViewController.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 11/1/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView :MKMapView!
    
    var locationManager :CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.locationManager = CLLocationManager()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        
        self.locationManager.delegate = self
        
        self.locationManager.requestAlwaysAuthorization()
        
        self.mapView.showsUserLocation = true
        self.mapView.delegate = self
        
        self.locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
       var pokemonAnnotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "PokemonAnnotationView")
        
        if pokemonAnnotationView == nil {
            pokemonAnnotationView = PokemonAnnotationView(annotation: annotation, reuseIdentifier: "PokemonAnnotationView")
        }
        
        return pokemonAnnotationView
        
    }
    
    @IBAction func addNewPokemonButtonPressed() {
     
        let pokemonAnnotation = MKPointAnnotation()
        pokemonAnnotation.title = "Pikachu Pokemon"
        pokemonAnnotation.coordinate = CLLocationCoordinate2DMake(29.735101, -95.390524)
        
//        var pokemonAnnotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "PokemonAnnotationView")
//        
//        if pokemonAnnotationView == nil {
//            pokemonAnnotationView = MKAnnotationView(annotation: pokemonAnnotation, reuseIdentifier: "PokemonAnnotationView")
//            
//        }
        
        self.mapView.addAnnotation(pokemonAnnotation)
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.mapView.setRegion(region, animated: true)
                }
            }
        }
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
