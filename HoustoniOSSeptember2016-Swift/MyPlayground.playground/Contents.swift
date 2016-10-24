//: Playground - noun: a place where people can play

import UIKit

enum Compas {
    
    case North
    case West
    case South
    case East
}

var compas :Compas = .West

if compas == .North {
    print("Begin moving North")
} else if(compas == .West) {
    print("Beging moving west")
}

switch compas {
    case .North:
        print("Move North")
    case .West:
        print("Move West")
    case .East:
        print("East")
    case .South:
        print("South")
}

func deleteFileFromDisk(fileName :String) throws {
    
    // delete the file
}

// if exception happens then app crashes
try! deleteFileFromDisk(fileName: "SecretFile.txt")

// if exception happens then returns nil
try? deleteFileFromDisk(fileName: "SecretFile.txt")

//do {
//    try deleteFileFromDisk(fileName: "MyFile.txt")
//}
//catch { // display a message to the user 
//    
//}









