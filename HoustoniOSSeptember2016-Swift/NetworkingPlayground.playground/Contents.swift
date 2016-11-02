//: Playground - noun: a place where people can play

import UIKit
import MapKit
import PlaygroundSupport

class Pokemon {
    var name :String!
}

class Dog {
    
}




var str = "Hello, playground"

let url = "https://still-wave-26435.herokuapp.com/pokemon/all"
let pokemonURL = URL(string: url)

var arrayOfPokemons = [Pokemon]()

let catPokemon = Pokemon()

let dog = Dog()

arrayOfPokemons.append(catPokemon)

URLSession.shared.dataTask(with: pokemonURL!) { (data :Data?, response :URLResponse?, error :Error?) in
    
    let arrayOfDictionaries = try! JSONSerialization.jsonObject(with: data!, options: []) as! [[String:Any]]
    
    for dictionary in arrayOfDictionaries {
        
        let pokemon = Pokemon()
        pokemon.name = dictionary["name"] as! String
    
        let annotation = MKPointAnnotation()
        annotation.title = pokemon.name
        annotation.coordinate = CLLocationCoordinate2DMake(29.735101, -95.390524)
        
        arrayOfPokemons.append(pokemon)
    }
    
    

    
}.resume()


print(arrayOfPokemons)

print("OUTSIDE THE CALL OF INVOKING POKEMONS")

// DO NOT ADD THIS LINE IN YOUR CODE
PlaygroundPage.current.needsIndefiniteExecution = true




