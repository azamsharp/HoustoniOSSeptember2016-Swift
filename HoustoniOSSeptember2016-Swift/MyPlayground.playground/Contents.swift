//: Playground - noun: a place where people can play

import UIKit

var age = 23
age = 25

var greeting = "Hello World"
greeting = "Bye World"

var names = ["John","Carla","Jack","Alex","Mason","Jesse"]

names.append("Tom")

names[0] = "Jim"

for name in names {
   // print(name)
}

for index in 1..<9 {
    print(index)
}

var airports = ["IAH":"George Bush Airport","LAX":"Los Angelos Airport"]

airports["IAH"] = "Hobby Airport"

airports

for (airportCode,airportName) in airports {
    
    print(airportCode)
}

func add(a :Int,b:Int) -> Int {
    return a+b
}

func greet() {
    
}

func greeting(message :String) -> String {
    return "Hello World"
}

let greetingMessage = greeting(message: "Something")

greetingMessage

let number = 10

let pi :Double = 3.142

let isTrue :Bool = true





class Dog {
    
    var name :String
    var age :Int?
    var breed :String?
    
    var color :String!
    
    init() {
        
        self.name = ""
    }
    
    init(name :String) {
        self.name = name
    }
    
    func eat() {
        
    }
    
    func drink(nameOfTheDrink :String) {
        
    }
    
    func run() -> Int {
        return 100
    }
}

func findDogByName(name :String) -> Dog? {
    ///
    ///
    return Dog()
}

let dog = Dog()
dog.name = "Foo"

dog.breed = "SomeBreed"

var breed = dog.breed
print(breed!)



dog.age = 10

dog.eat()

let runSpeed = dog.run()

dog.drink(nameOfTheDrink: "Juice")

dog.name

let anotherDog = Dog(name: "Foo")

let myAge = 20

let myAgeInString = "My age is \(myAge) and my dog name is \(dog.name)"

myAgeInString







