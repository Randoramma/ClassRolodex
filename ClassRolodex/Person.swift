//
//  Person.swift
//
//
//  Created by Randy McLain on 3/6/15.
//
//
// Foundation is the library like the ACM in JAVA
import Foundation
import UIKit

class Person {
    
    // the first name of the person object.
    var myFirstName : String = "John"
    // the last name of the person object.
    
    var myLastName = "Doe"
    
    
    
    var myImage : UIImage?
    
    
    
    // constructor for Person taking in firstName, lastName, and Student Status.
    init (firstName : String, lastName : String) {
        
        // reinitialize the properties with the constructor parameters.
        self.myFirstName = firstName
        self.myLastName = lastName
        
        // myImage = NSURL.fileURLWithPath(NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3")
    }

    // method returning the Person object first name property.
    func getFirstName () -> String {
        return myFirstName
    }
    
    // method returning the Person object last name property.
    func getLastName() -> String {
        return myLastName
    }
    
    // method returning a string object witht the persons first and last names.
    func toString() -> String {
        return "First: \(getFirstName()). Last:  \(getLastName())."
        
    }
    
}

