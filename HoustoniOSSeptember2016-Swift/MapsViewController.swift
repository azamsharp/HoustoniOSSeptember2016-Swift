//
//  MapsViewController.swift
//  HoustoniOSSeptember2016-Swift
//
//  Created by Mohammad Azam on 11/1/16.
//  Copyright © 2016 Mohammad Azam. All rights reserved.
//

import UIKit
import MapKit

class PokemonAnnotation : MKPointAnnotation {
    
    var imageURL : String!
    var latitude :Double!
    var longitude :Double!
}

class MapsViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView :MKMapView!
    var locationManager :CLLocationManager!
    
    var pokemons :[Pokemon]!
    
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
        
        // load all the pokemons
        
        self.pokemons = [Pokemon]()
        
        URLSession.shared.dataTask(with: URL(string: "https://still-wave-26435.herokuapp.com/pokemon/all" )!) { (data :Data?, response :URLResponse?, error :Error?) in
            
            let result = try! JSONSerialization.jsonObject(with: data!, options: []) as? [[String:Any]]
            
            for item in result! {
                
                var pokemon = Pokemon(name: item["name"] as! String, imageURL: item["imageURL"] as! String)
                pokemon.latitude = item["latitude"] as! Double
                pokemon.longitude = item["longitude"] as! Double
                
                self.pokemons.append(pokemon)
                
                // update the map view to add the pokemons
                
                let pokemonAnnotation = PokemonAnnotation()
                pokemonAnnotation.title = pokemon.name
                pokemonAnnotation.imageURL = pokemon.imageURL
                pokemonAnnotation.coordinate = CLLocationCoordinate2D(latitude: pokemon.latitude, longitude: pokemon.longitude)
                
                
                DispatchQueue.main.async {
                     self.mapView.addAnnotation(pokemonAnnotation)
                }
            }
            
        }.resume()
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        if annotation is MKUserLocation {
            return nil
        }
        
       var pokemonAnnotationView = self.mapView.dequeueReusableAnnotationView(withIdentifier: "PokemonAnnotationView")
        
        
        if pokemonAnnotationView == nil {
            pokemonAnnotationView = PokemonAnnotationView(annotation: annotation as! PokemonAnnotation, reuseIdentifier: "PokemonAnnotationView")
            pokemonAnnotationView?.canShowCallout = true
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
        
//        if let annotationView = views.last {
//            if let annotation = annotationView.annotation {
//                if annotation is PokemonAnnotation {
//                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 500, 500)
//                    self.mapView.setRegion(region, animated: true)
//                }
//            }
//        }
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
